How to update this page
=======================

This page is created using Sphinx. In order to update it I would advise you
to head to http://sphinx.pocoo.org and get familiar with Sphinx and
reStructeredText.

1. Clone `collective.github.com`_ repository

.. code-block:: console

    $ git clone git@github.com:collective/collective.github.com

2. Run buildout

Source is located in ``src`` directory.

.. code-block:: console

    $ cd src
    src/ $ virtualenv --no-site-packages .
    src/ $ source bin/activate
    src/ $ pip install Sphinx
    src/ $ source bin/activate

This will install all needed. Now its time for you to edit ``.rst`` files.

3. Generate html

After editing ``.rst`` files you need to "compile" html.

**IMPORTANT**
Make sure site looks nice when rendered. It will be compiled in root of
package.

.. code-block:: console

    src/ $ make html

4. Commit changes

For nice history please commit changes to ``.rst`` files separately then
changes to compiled site.

.. code-block:: console

    src/ $ git commit -a -m "Some very important changes"
    src/ $ cd ..
    $ git commit -a -m "Upload up html"

5. Don't forget to push

.. code-block:: console

    $ git push origin master


And that's all folks...

.. _`collective.github.com`: http://github.com/collective
