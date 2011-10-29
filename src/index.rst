Introduction
============

`github/collective`_ started as experiment in october 2010. Many of 
`Plone <http://plone.org>`_ developers joined over the last year, which 
definetly shows that development using git is gaining popularity among Plonistas.


"Rules" on github/collective
============================

- Every member gets Github's ``Pull and Push`` permission to all repositories.
- Each repository has owners (team of repository owners) which have
  Administrative rights for it.
- Abuses should be reported as ticket in `collective.github.com`_ repository.


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
repository and then edit the `permissions.cfg`_. If youre done commit, push 
and create a pull request. 

We scheduled a script that runs every 10min and checks for differences and
updates them. 

Inside `permissions.cfg`_ file you have a list of teams and repositories.
Team are sections starting with ``team:`` and repository is a section
starting with ``repo:``.

Instructions on editing permissions.cfg
---------------------------------------

Existing repository, but not owner any more
    You created a repository in past and now youre not owner anymore? Add 
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
of your lazyness**

**TODO:** script does not set owner the person who forked project or first
committer


More information
================

.. toctree::
    :maxdepth: 2
    
    how_to_transifex
    how_to_followcommits
    how_to_update_this_documentation
    new_to_git


.. _`collective.github.com`: https://github.com/collective/collective.github.com
.. _`permissions.cfg`: https://github.com/collective/collective.github.com/blob/master/permissions.cfg
.. _`github/collective`: http://github.com/collective

