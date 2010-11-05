New to git?
===========

Useful links
------------

    * http://gitref.org
    * http://www.gitready.com
    * http://progit.org/book

Quick guide
-----------

When I switched to git I got used to a specific git workflow, inspired
by my previous experience with subversion. these are just a handful of
commands and a tiny bit of git's full capabilities but it may be useful
for you as well. (by `Johannes Raggam`_)


Global Settings
^^^^^^^^^^^^^^^

Essential

.. code-block:: console

    $ git config --global user.name "USERS NAME"
    $ git config --global user.email USERS@EMAIL

Create global gitignore

.. code-block:: console

    $ echo -e "*.mo\n*.pyc\n*.pyo" > ~/.gitignore
    $ git config --global core.excludesfile ~/.gitignore

Cloning
^^^^^^^

.. code-block:: console

    $ git clone git@github.com:USERNAME/REPOSITORYNAME.git

Creating
^^^^^^^^

First, create a github project on `github.com collective`_

.. _github.com collective: https://github.com/organizations/collective

Second, create a project on your local computer and initialize it

.. code-block:: console

    $ mkdir PROJECT
    $ cd PROJECT
    $ git init # initialize git versioning in current directory
    $ git remote add origin git@github.com:collective/REPOSITORYNAME.git

These settings will let you push with just "git push" as command

.. code-block:: console

    $ git config branch.master.merge refs/heads/master
    $ git config branch.master.remote origin

Create local gitignore

.. code-block:: console

    $ echo -e "bin\ndev\ndevelop-eggs\neggs\nparts\n*.egg-info\n.*
        \n!.gitignore" > .gitignore

Add files, commit and push

.. code-block:: console

    $ git add . # add current dir and subdirs to project
    $ git commit -am"MESSAGE" # commit all staged changes
    $ git commit FILE -m"MESSAGE" # commit FILE
    $ git push # push changes to master on github

    $ git pull # update
    $ git fetch # or so


Some more useful resources
--------------------------

    * Interesting doc about git rebasing instead of merging branches:
        http://jbowes.wordpress.com/2007/01/26/git-rebase-keeping-your-branches-current




.. _`Johannes Raggam`: raggam-nl@adm.at
