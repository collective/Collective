How to merge pull requests (Admin documentation)
================================================

This documentation is meant for github.com/collective admins.

Merging pull requests via the github.com web interface is very convenient, but
sometimes merge conflicts cannot be resolved automatically. Then you have to do
it manually, like so:

1. Clone github.com/collective, if not done already (or be sure to operate on
the master branch):

.. code-block:: console

    $ git clone git@github.com:collective/collective.github.com.git

2. Add the remote repository from which the pull request comes from and fetch
it:

.. code-block:: console

    $ git remote add thet git://github.com/thet/collective.github.com.git
    $ git fetch thet

3. Merge it and resolve the merge conflicts manually:

.. code-block:: console

    $ git merge thet/master
    $ vim permissions.cfg

4. Commit and push it back.

    $ git commit permissions.cfg -m"merge with thet/master"
    $ git push

For more Information see the `Github help page
<http://help.github.com/send-pull-requests>`_ on this topic. 
