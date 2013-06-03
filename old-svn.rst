Moving SVN repositories to Github
======================================

.. contents::

Instructions made for ``svn.plone.org/collective``.

You have two options, calling directly git svn clone or use svn2git

Here is an example session of moving ``collective.logbook`` to Github

Prerequisites
-----------------
install svn2git (https://github.com/nirvdrum/svn2git):

    - on OSX Mountain Lion / Macports::
    
        sudo port install git-core +svn
        sudo port install rb-rubygems
        sudo gem install svn2git

    - On ubuntu::

      sudo apt-get install git-core git-svn ruby rubygems
      sudo gem install svn2git

    - Generic: install svn2git as a Ruby gem::

      sudo gem install svn2git / su -c 'gem install svn2git'

Make a proper git-svn fork
------------------------------

- Set your product name to be available in shell

    export PRODUCTNAME="collective.logbook"

- Working directory::
    
    mkdir -p ${PRODUCTNAME}/${PRODUCTNAME} && cd ${PRODUCTNAME}/${PRODUCTNAME}
    
- Create repository on Github in your dashboard. Choose "collective" as the owner.
    
- Grab the log from your addon and note the start and env revisions here we have : start:78034 / end:246764::
  
    svn log -q http://svn.plone.org/svn/collective/${PRODUCTNAME} > ../LOG
    
- Optionnal but recommended: Remap authors commiters to ``FullName <email>``

    - Take care of remapping to github accounts fullname/email pairs if they exists::
    
	cat ../LOG | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > ../authors-transform.txt
	cat ../authors-transform.txt
	...
	maurits = maurits <maurits>
	...

    - Edit the authors file::

	$ED ../authors-transform.txt
	...
	maurits = Maurits van Rees <m.van.rees@zestsoftware.nl>
	...    
    
- Run svn2git
  Note: the following takes 30+ minutes to complete on fast internet connection
  , as it walks through every of 150k+ commits in Collective SVN

    - To not grab all collective revisions, we will compute the last and first revisions and give them to svn2git with::

	export REVS="$(tail -n2 ../LOG|head -n1|awk '{print $1}'|sed "s/r//"):$(head -n2 ../LOG|tail -n1|awk '{print $1}'|sed "s/r//")"

    - Verify::

	echo $REVS

    - If you have the authors file::
  
	svn2git --authors ../authors-transform.txt --revision $REVS -v http://svn.plone.org/svn/collective/${PRODUCTNAME}

    - If you do not have the authors file::

	svn2git --revision $REVS -v http://svn.plone.org/svn/collective/${PRODUCTNAME}

Push code to github / Backup the old one
---------------------------------------------
    
- After migrating, push the git-svn checkout to github::

      git remote add origin git@github.com:collective/${PRODUCTNAME}.git
    git push -u --all
    git push --tags

- Move old trunk::

    cd ..
    svn mv -m "Moved to github" https://svn.plone.org/svn/collective/${PRODUCTNAME}/trunk https://svn.plone.org/svn/collective/${PRODUCTNAME}/trunk.old
    svn mkdir -m "Moved to github" https://svn.plone.org/svn/collective/${PRODUCTNAME}/trunk
    svn co https://svn.plone.org/svn/collective/${PRODUCTNAME}/trunk/ ${PRODUCTNAME}.old
    cd ${PRODUCTNAME}.old
    echo "Repo moved to https://github.com/collective/${PRODUCTNAME}" > MOVED-TO-GITHUB.txt
    svn add MOVED-TO-GITHUB.txt
    svn commit -m "Added Github moved notice"
