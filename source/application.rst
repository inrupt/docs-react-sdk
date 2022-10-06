==================
Sample Application
==================

The following outlines how a sample application uses the Inrupt's Solid
React SDK to log in to a user's Pod and displays the Profile. The
sample application allows users to view/edit user profile.

Set Up
======

To set up the sample application locally, 

#. You can either:

   - Clone the application's `GitHub repo
     <https://github.com/inrupt/solid-ui-react-demo>`_, or
  
   - Use `Next.js application generator
     <https://nextjs.org/docs/api-reference/create-next-app>`_ to set up
     the project.
  
     .. code-block:: sh

        npx create-next-app -e https://github.com/inrupt/solid-ui-react-demo

     When prompted for the project name, either accept the default or
     enter a new name.
     
#. Go to your project directory, substituting your project name for
   ``<app-name>`` (e.g., ``my-app``, etc.):

   .. code-block:: sh

      cd <app-name>

#. Optional. `Next.js <https://nextjs.org/telemetry>`_ collects
   anonymous telemetry data. To opt out, run the following in the root of
   your project directory

   .. code-block:: sh
   
      npx next telemetry disable

#. After you have set up the project, go to the project directory and
   run either:

   .. code-block:: sh

      npm ci
      npm run dev

   or

   .. code-block:: sh

      yarn dev

#. When the application is running locally, open the browser to
   ``https://localhost:3000``.

Examination of the Code
=======================

Session Provider
----------------

The sample application uses the :sdkreact:`SessionProvider
<path=/docs/authentication-session-provider--provider-with-hook>` and
wraps the application in the ``SessionProvider``

.. literalinclude:: /appcode/appContainer.jsx
   :language: text
   :lines: 39

.. code-block:: none

   // ... Content omitted

.. literalinclude:: /appcode/appContainer.jsx
   :language: text
   :lines: 54-83
   :emphasize-lines: 5, 28

(Source: `components/appContainer/index.jsx
<https://github.com/inrupt/solid-ui-react-demo/blob/main/components/appContainer/index.jsx>`_)

Session and Login Status
------------------------

Wrapped within the ``SessionProvider``, the sample application can use the
Inrupt SDK's ``useSession`` interface to access the current
:apisolidauthnbrowser:`Session
</classes/_session_.session.html#constructor>` and check its login
status.

.. literalinclude:: /appcode/pages.jsx
   :language: text
   :lines: 22-34
   :emphasize-lines: 1,10

(Source: `pages/index.jsx
<https://github.com/inrupt/solid-ui-react-demo/blob/main/pages/index.jsx>`_)

Log In
------

To log in, sample application creates a ``LoginForm`` that uses Inrupt
SDK's :sdkreact:`LoginButton
<path=/docs/authentication-login-button--with-children>`. Specify the
``oidcIssuer`` and ``redirectUrl`` attributes for the
:sdkreact:`LoginButton
<path=/docs/authentication-login-button--with-children>`.

For example, the sample application includes ``oidcIssuer`` and
``redirectUrl`` attributes as well as the optional ``onError`` and
``authOptions`` attributes.

.. literalinclude:: /appcode/loginForm.jsx
   :language: text
   :lines: 23
   
.. code-block:: none

   // ... Content  omitted

.. literalinclude:: /appcode/loginForm.jsx
   :language: text
   :lines: 37-71
   :emphasize-lines: 20-25

(Source: `components/loginForm/index.jsx
<https://github.com/inrupt/solid-ui-react-demo/blob/main/components/loginForm/index.jsx>`_)

Display the Profile
-------------------

The sample application uses the Inrupt SDK's to display the profile
data:

- The :sdkreact:`CombinedDataProvider
  <path=/docs/providers-combined-data-provider--with-data-urls>`
  specifies the URL of the profile SolidDataset.

- The following Inrupt SDK components display various properties from
  the profile. The components provide an ``edit`` attribute to toggle
  these fields to be editable or non-editable. You can also specify the
  ``autosave`` attribute.

   - :sdkreact:`Text <path=/docs/components-text--basic-example>`

   - :sdkreact:`Image <path=/docs/components-image--with-dataset-provider>`

.. literalinclude:: /appcode/profile.jsx
   :language: text
   :lines: 22-131
   :emphasize-lines: 3-8, 34, 42, 47, 61-65,107

(Source: `components/profile/index.jsx
<https://github.com/inrupt/solid-ui-react-demo/blob/main/components/profile/index.jsx>`_)

Additional Information
======================

You can view the source on `GitHub
<https://github.com/inrupt/solid-ui-react-demo>`_.

