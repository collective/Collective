Introduction
============

`github/collective`_ started as experiment in october 2010. Many of Plone
developers joined over the last year, which definetly shows that development
using git is gaining popularity among Plonistas.


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
- Or fork `collective.github.com`_ repository, edit ``permissions.cfg`` file
  and send us Pull Request.


How to fork, create new repository
==================================

- If you are already an owner of some repository you should have enought rights
  to use Github's fork system or be able to create new repository.
  
    **TODO:** script does not set owner the person who forked project or first
    commiter

- If you are not owner of any repository you can create ticket or modify
  `permissions.cfg`_ in one of the following ways:

    **to fork repository**::

        [repo:vim-snipmate]
        fork = garbas/vim-snipmate
        teams = contributors
        owners = garbas

    **to create repository**::

        [repo:vim-snipmate]
        teams = contributors
        owners = garbas


Teams, permissions and how to manage them
=========================================

Permissions are stored in `permissions.cfg`_ file in `collective.github.com`_
repository. We might change this in the future to read from plone.org's LDAP,
but for now this is the place.

We scheduled a script that runs every 10min and checks for differences and
updates them. More about script you can read here: 

Inside `permissions.cfg`_ file you have a list of teams and repositories.
Team
are sections starting with ``team:`` and repository is a section
starting with ``repo:``.

    **TODO:** finish and move this section to separate document


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

