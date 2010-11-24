How to use Transifex_
=====================

What is Transifex_
------------------

Transifex is an open service allowing people to collaboratively translate
software, documentation and other types of projects. Designed as a hub for
translations of open source projects, Transifex supports translations straight
from the project's source.

Why should I use Transifex_
---------------------------

I see two main reasons:

* Let non technical people contribute to translation of your add-on.
* `Monitor status of translations`_

How to use Transifex_ as translator
-----------------------------------

* register on transifex.net
* join or create a team for your language for the Plone project
* once it is validated you can participate to project

Current status: We use transifex to monitor translations, but we work on 
integration with svn collective. but github is already supported. So if the
project is hosted on github/collective you can start to translate the project.

Plug your project from `Transifex/Plone`_ to Github/Collective
--------------------------------------------------------------

If you are add-on developper you should consider asking for maintainer role
at `Transifex/Plone`_ to be able to add your project as 'component'. 

Once you have added your project follow the steps described under 'Submission'
tab:

    * validate the repository
        * download README.transifex from Transifex.
        * add it to your repository
        * push it to github/collective/yourproject
    * check allow submission
    * choose 'The upstream repository directly'
    * And voila, it's working !

The first commit from transifex to github/collective is available here:
https://github.com/collective/collective.gallery/commit/dfccbfb530ee984459630ae32ef8a8020f72e9d2

Contact
-------

For any feedback, you can contact me at toutpt at gmail dot com.

.. _`Transifex`: http://www.transifex.net
.. _`Transifex/Plone`: http://www.transifex.net/projects/p/Plone/
.. _`Monitor status of translations`: http://toutpt.wordpress.com/collective-translations/
