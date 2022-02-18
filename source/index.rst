===============
Solid React SDK
===============

Inrupt provides a Solid React SDK ``solid-ui-react`` to help
developers create `Solid <https://solidproject.org/>`_ applications.

``solid-ui-react`` consists of:

.. list-table::
   :widths: 40 60

   * - Authentication components
   
     - To help you log in and log out of an identity provider.

   * - Data components

     - To help you view and edit individual properties or view a
       sortable and filterable table of multiple things.

   * - Context providers and hooks

     - To help simplify development when using functional programming.

Getting Started
===============

To get started with Inrupt's Solid React SDK, see:

.. list-table::
   :widths: 30 70

   * - :doc:`Explore a Sample Application </application>`

     - Locally set up a provided sample application that uses the Solid
       React SDK.

   * - :doc:`/installation`

     - Install using ``npm``.

   * - :sdkreact:`Components API </>`

     - Play with the Solid React SDK components in Storybook.

       In the Storybook, the Solid React SDK components are grouped
       into categories; e.g. ``Authentication``, ``Components``, and
       ``Providers``. Click on a component.

       - The :guilabel:`Canvas` displays a rendered view. The Canvas
         for a component may also include:

         - :guilabel:`Controls` panel. For components that take
           arguments, you can update the argument values in the
           Controls panel and see it rendered in the Canvas.
         
         - :guilabel:`Actions` panel. The Actions panel displays a
           list of callbacks that have occurred; for example, an ``onSave``
           or ``onError`` event.

         - :guilabel:`Story` panel. The Story panel contains the
           source of the example.

       - The :guilabel:`Docs` displays documentation for the component,
         including the code.

       For more information on Storybook, see the `Storybook
       Documentation at storybook.js.org
       <https://storybook.js.org/docs/react/get-started/introduction>`_.


   * - `GitHub <https://github.com/inrupt/solid-ui-react>`_

     - View the Solid React SDK source on GitHub.

JavaScript Client Libraries
===========================

Inrupt's Solid React SDK is built on top of the following JavaScript
client libraries: 

.. list-table::
   :header-rows: 1
   :widths: 35 65
   
   * - Library
     - Description

   * - ``solid-client``

     - A client library for accessing data stored in Solid Pods.

   * - ``solid-client-authn``

     - A set of libraries for authenticating to Solid identity servers.

   * - ``vocab-common-rdf``
   
     - A library that provides convenience objects for many RDF-related
       identifiers.

For more information, see `Inrupt JavaScript Client Libraries
<https://docs.inrupt.com/developer-tools/javascript/client-libraries/>`_.

Issues & Help
=============

.. include:: /includes/table-issues-help.rst


.. toctree::
   :titlesonly:
   :hidden:

   Explore a Sample App </application>
   /installation
   Components API <https://solid-ui-react.docs.inrupt.com/>
   /release-notes


