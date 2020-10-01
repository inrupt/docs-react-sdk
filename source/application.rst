==================
Sample Application
==================

The following outlines how a sample application uses the Inrupt's Solid
React SDK to log in to a user's Pod and displays the Profile. The
sample application allows users to view/edit user profile. You can play
with the application at https://solid-ui-react-example.docs.inrupt.com/.

Session Provider
================

The sample application uses the :sdkreact:`SessionProvider
<path=/docs/authentication-session-provider--provider-with-hook>` and
wraps the application in the ``SessionProvider`` 

.. literalinclude:: /appcode/app.tsx
   :language: text
   :lines: 22-39
   :emphasize-lines: 1,14-16

(Source: `pages/_app.tsx
<https://github.com/inrupt/solid-ui-react-example-project/blob/master/pages/_app.tsx>`_)

Session and Login Status
========================

Wrapped within the ``SessionProvider``, the sample application can use the
Inrupt SDK's ``useSession`` interface to access the current
:apisolidauthnbrowser:`Session
</classes/_session_.session.html#constructor>` and check its login
status.

.. literalinclude:: /appcode/pages.tsx
   :language: typescript
   :lines: 22-31
   :emphasize-lines: 1,6,8

(Source: `pages/index.tsx
<https://github.com/inrupt/solid-ui-react-example-project/blob/master/pages/index.tsx>`_)

Log In
======

To log in, sample application creates a ``LoginForm`` that uses Inrupt
SDK's :sdkreact:`LoginButton
<path=/docs/authentication-login-button--with-children>`. Specify the
``oidcIssuer`` and ``redirectUrl`` attributes for the ``LoginButton``:

.. literalinclude:: /appcode/loginForm.tsx
   :language: text
   :lines: 22-56
   :emphasize-lines: 2,24-28

(Source: `components/loginForm/index.tsx
<https://github.com/inrupt/solid-ui-react-example-project/blob/master/components/loginForm/index.tsx>`_)

You can also specify an optional ``onError`` attributes for the
:sdkreact:`LoginButton
<path=/docs/authentication-login-button--with-children>`.

Display the Profile
====================

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

   - :sdkreact:`Value <path=/story/components-value--datetime>`

.. literalinclude:: /appcode/profile.tsx
   :language: text
   :lines: 22-138
   :emphasize-lines: 3-10, 30, 43, 51, 70-74, 79-84

(Source: `components/profile/index.tsx
<https://github.com/inrupt/solid-ui-react-example-project/blob/master/components/profile/index.tsx>`_)

Additional Information
======================

You can view the source on `GitHub
<https://github.com/inrupt/solid-ui-react-example-project>`_.

