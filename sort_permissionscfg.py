#!/usr/bin/env python
from ConfigParser import RawConfigParser
from collections import OrderedDict

GITHUBSECTION = 'repo:collective.github.com'
COMMENT = """\
#
# collective repositories \/
#
# -> below here add new repositories.
# -> place in alphabetical order.
# -> existing repositories may not have the right owner. This happened at
#    import time and set garbas as owner. If you are the owner of such a 
#    repository, just place your name there. 

"""

def write(self, fp):
    """Write an .ini-format representation of the configuration state."""
    # base code stolen from ConfigParser
    for section in self._sections:
        fp.write("[%s]\n" % section)
        for (key, value) in self._sections[section].items():
            if key == "__name__":
                continue
            if (value is not None) or (self._optcre == self.OPTCRE):
                key = " = ".join((key, str(value).replace('\n', '\n    ')))
            fp.write("%s\n" % (key))
        fp.write("\n")
        if section == GITHUBSECTION:
           fp.write(COMMENT)


config = RawConfigParser()
config.read('permissions.cfg')
newconfig = RawConfigParser()

for key, value in config._sections.iteritems():
    if not key.startswith('team:'):
        continue
    members = value['members'].split('\n')
    value['members'] = '\n'.join(sorted(members, key=str.lower))
    newconfig._sections[key] = value

newconfig._sections[GITHUBSECTION] = config._sections[GITHUBSECTION]

for key, value in sorted(config._sections.iteritems(), 
                         key=lambda x: x[0].lower()):
    if key.startswith('team:') or key == GITHUBSECTION:
        continue
    newconfig._sections[key] = value

with open('permissions.cfg', 'w') as pcfg:
    write(newconfig, pcfg)

