Introduction
============

`github/collective`_ started as an experiment in October 2010. Many
`Plone <http://plone.org>`_ developers have joined since then, which 
definitely shows that development using git is gaining popularity amongst Plonistas.

Migration
=========

The sync from the Plone subversion repository was done using the scripts
located here: https://github.com/plone/svn-migrate.

After the initial sync, ongoing syncing is not possible. Either you move
your stuff to github or you leave it on svn/collective (or you move it to
any other location, such as bitbucket).

"Rules" on github/collective
============================

- Every member gets Github's ``Pull and Push`` permission to all repositories.
- Each repository has owners (team of repository owners) which have
  Administrative rights to it.
- Abuse should be reported by opening a ticket in the `collective.github.com`_ repository.

How to get access
=================

- File a ticket that you want permission here:
  https://github.com/collective/collective.github.com/issues

- Or fork `collective.github.com`_ repository, edit ``permissions.cfg`` file, 
  commit and push it and send us a Pull Request (see section below for details).

How to manage permissions and repositories
==========================================

Overview
--------

Permissions are stored in `permissions.cfg`_ file in `collective.github.com`_
repository (We might change this in the future to read from plone.org's LDAP,
but for now this is the place).

Fork the `collective.github.com <https://github.com/collective/collective.github.com>`_
repository and then edit the `permissions.cfg`_. 
When you're done, commit, push, and create a pull request. 

We scheduled a script that runs every 10min and checks for differences and
updates them. 

Inside `permissions.cfg`_ file you have a list of teams and repositories.
Team are sections starting with ``team:`` and repositories are sections
starting with ``repo:``.

Instructions on editing permissions.cfg
---------------------------------------

Existing repository, but not owner any more
    You created a repository in past and now you're not owner anymore? Add 
    yourself to the ``owners =`` of the existing repository section.

Fork an existing repository from another github user or organization
    Add a new section::

        [repo:REPOSITORYNAME]
        fork = FROM_USERNAME_OR_ORGANISATIONNAME/REPOSITORYNAME
        teams = contributors
        owners = MY_USERNAME

Create a new repository
    Add a new section::

        [repo:NEW_REPOSITORY_NAME]
        teams = contributors
        owners = MY_USERNAME

Add yourself to the ``contributors`` (or any other team)
   Find the section ``[team:contributors]`` and append your username to the end.

**Please not use the button on github website to create new repositories, 
otherwise the admin team has to edit the permissions.cfg file manually because 
of your laziness**

**TODO:** script does not set owner the person who forked project or first
committer

More information
================

.. toctree::
    :maxdepth: 2
    
    how_to_followcommits
    how_to_update_this_documentation
    new_to_git
    how_to_merge

.. _`collective.github.com`: https://github.com/collective/collective.github.com
.. _`permissions.cfg`: https://github.com/collective/collective.github.com/blob/master/permissions.cfg
.. _`github/collective`: http://github.com/collective

