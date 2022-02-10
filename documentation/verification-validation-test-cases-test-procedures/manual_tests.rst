Manual Tests: Interface, Guidance and Documentation, Data Cube Handling (ACDC.TC.02)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this section, users are manually walked through the processes
of input data retrieval, customisation, and inspection of the generated output data cube,
via Jupyter notebooks.

In particular, users are initially shown how to interface with the list of input datasets.
Detailed instructions explain how to input their preferred choice of variables,
and subsequently generate the data cube using the new Data Tailor plugin `epct_plugin_acdc`.

In-depth examples subsequently demonstrate how to customize the plugin configuration in order to
subset on a region of interest or filter bands, estimate the output data cube size, and perform
basic inspection of the thus generated data cube via plots, animations or simply by
downloading output data.


ACDC.TC.02.01: ACDC Data Discovery
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0
   :widths: 20 80

   * - Goal
     - Validate the ability to discover ACDC input data.
   * - Input data
     - :ref:`Jupyter Notebook 214 <[JUPYTER_214]>`
   * - Pass/Fail criteria
     - The list of products supported by the plugin is correctly retrieved.

       The plugin can be configured in such a way to obtain the AAI variable of GOME-2 data.

       The Data Tailor interface can successfully be invoked.

       The plugin successfully generates NetCDF output products with the configuration defined.


.. _ACDC.TP.02.01:

ACDC.TP.02.01: ACDC Data Discovery
'''''''''''''''''''''''''''''''''''''''

.. list-table::
   :header-rows: 1
   :widths: 10 55 35

   * - id
     - Description
     - Expected output
   * - 0.
     - Launch :ref:`Jupyter Notebook 214 <[JUPYTER_214]>`.
     - The notebook is successfully launched.
   * - 1.
     - Inspect the notebook description and comments.
     - The description clearly states instructions, objectives and expected outcomes.
   * - 2.
     - Execute all steps
     - Results are compatible with expected outcomes from step 1.

ACDC.TC.02.02: ACDC Case Study I
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0
   :widths: 20 80

   * - Goal
     - Validate the ability to handle ACDC data through a jupyter notebook.
   * - Input data
     - :ref:`Jupyter Notebook 325 <[JUPYTER_325]>`
   * - Pass/Fail criteria
     - The plugin can be configured in such a way to obtain the Nitrogen dioxide variable of TROPOMI data.

       This data can successfully be cropped in a user-defined ROI.

       The output data cube size can be successfully estimated.

       The plugin successfully generates NetCDF output products with this configuration.

       Output products can successfully be saved locally.


.. _ACDC.TP.02.02:

ACDC.TP.02.02: ACDC Case Study I
'''''''''''''''''''''''''''''''''''''''''''''''''''

.. list-table::
   :header-rows: 1
   :widths: 10 55 35

   * - id
     - Description
     - Expected output
   * - 0.
     - Launch :ref:`Jupyter Notebook 325 <[JUPYTER_325]>`.
     - The notebook is successfully launched.
   * - 1.
     - Inspect the notebook description and comments.
     - The description clearly states instructions, objectives and expected outcomes.
   * - 2.
     - Execute all steps
     - Results are compatible with expected outcomes from step 1.


ACDC.TC.02.03: ACDC Case Study II
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0
   :widths: 20 80

   * - Goal
     - Validate the ability to handle ACDC data through a thoroughly documented jupyter notebook.
   * - Input data
     - :ref:`Jupyter Notebook 321 <[JUPYTER_321]>`
   * - Pass/Fail criteria
     - The plugin can be configured in such a way to obtain the Nitrogen dioxide variable of GOME-2 data.

       A band filter can successfully be specified.


.. _ACDC.TP.02.03:

ACDC.TP.02.03: ACDC Case Study II
'''''''''''''''''''''''''''''''''''''''''''''''''''

.. list-table::
   :header-rows: 1
   :widths: 10 55 35

   * - id
     - Description
     - Expected output
   * - 0.
     - Launch :ref:`Jupyter Notebook 321 <[JUPYTER_321]>`.
     - The notebook is successfully launched.
   * - 1.
     - Inspect the notebook description and comments.
     - The description clearly states instructions, objectives and expected outcomes.
   * - 2.
     - Execute all steps
     - Results are compatible with expected outcomes from step 1.