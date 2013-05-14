Moving SVN repositories to Github
-----------------------------------

Instructions made for ``svn.plone.org/collective``.

Here is an example session of moving ``collective.logbook`` to Github on OSX Mountain Lion / Macports::

    sudo port install git-core +svn
    sudo port install rb-rubygems
    sudo gem install svn2git
    
    mkdir collective.logbook && cd collective.logbook
    
    # Create repository on Github in your dashboard. Choose "collective" as the owner.

    # Run svn2git
    # Note: the following takes 30+ minutes to complete on fast internet connection
    # as it walks through every of 150k+ commits in Collective SVN
    svn2git http://svn.plone.org/svn/collective/collective.logbook/
    
    # Push the git-svn checkout to github:
    git remote add origin git@github.com:collective/collective.logbook.git
    git push -u origin master


    # Move old trunk
    cd ..
    svn mv -m "Moved to github" https://svn.plone.org/svn/collective/collective.logbook/trunk/ https://svn.plone.org/svn/collective/collective.logbook/trunk.old
    svn mkdir -m "Moved to github" https://svn.plone.org/svn/collective/collective.logbook/trunk/
    svn co https://svn.plone.org/svn/collective/collective.logbook/trunk/ collective.logbook.old
    cd collective.logbook.old
    echo "Repo moved to https://github.com/collective/collective.logbook" > MOVED-TO-GITHUB.txt
    svn add MOVED-TO-GITHUB.txt
    svn commit -m "Added Github moved notice"
