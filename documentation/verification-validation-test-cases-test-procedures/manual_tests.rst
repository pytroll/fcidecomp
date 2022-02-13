Manual Tests: Decompression via Java Software and via the EUMETSAT Data Tailor Software, and installation with offline dependencies repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this section, users are manually walked through the processes
of:

- Opening and inspecting a JPEG-LS compressed MTG FCI L1C product via Panoply (reference Java Software)
- Decompression a JPEG-LS compressed MTG FCI L1C product via the EUMETSAT Data Tailor Software
- Installing the FCIDECOMP Software using the offline dependencies repository hosted at EUMETSAT Gitlab
  (`<[FCIDECOMP_DEP_OFF]>`_)

Tests reported in this section use the following test data files, all hosted at `<[TEST_DATA]>`_:

.. list-table:: Test data
   :header-rows: 1
   :widths: 10 20 70

   * - ID
     - Description
     - File name
   * - TD.COMP.01
     - JPEG-LS compressed MTG FCI L1C body file
     - W_XX-EUMETSAT-Darmstadt,IMG+SAT,MTI1+FCI-1C-RRAD-FDHSI-FD--CHK-BODY---NC4E_C_EUMT_20130804120845_GTT_DEV_20130804120330_20130804120345_N_JLS_T_0073_0015.nc
   * - TD.DECOMP.01
     - Decompressed MTG FCI L1C body file
     - W_XX-EUMETSAT-Darmstadt,IMG+SAT,MTI1+FCI-1C-RRAD-FDHSI-FD--CHK-BODY---NC4E_C_EUMT_20130804120845_GTT_DEV_20130804120330_20130804120345_N__T_0073_0015.nc

FCIDECOMP.JAVA.TC.01.01: decompression via Java Software
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0
   :widths: 20 80

   * - Goal
     - Validate the ability to open JPEG-LS compressed MTG FCI L1C products with Panoply
   * - Input data
     - TD.COMP.01
   * - Pass/Fail criteria
     - Data contained in the TD.COMP.01 can be plotted with Panoply


.. _FCIDECOMP.JAVA.TP.01.01:

FCIDECOMP.JAVA.TP.01.01: decompression via Java Software
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. list-table::
   :header-rows: 1
   :widths: 10 55 35

   * - ID
     - Description
     - Expected output
   * - 0.
     -
     -
   * - 1.
     -
     -


FCIDECOMP.DT.TC.01.01: decompression via the EUMETSAT Data Tailor Software
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0
   :widths: 20 80

   * - Goal
     - Validate the ability to decompress JPEG-LS compressed MTG FCI L1C products using the EUMETSAT Data Tailor Software
   * - Input data
     - TD.COMP.01
   * - Pass/Fail criteria
     - The `epct_plugin_mtg` plugin is correctly installed

       The plugin successfully generates a decompressed netCDF output product


.. _FCIDECOMP.DT.TP.01.01:

FCIDECOMP.DT.TP.01.01: decompression via the EUMETSAT Data Tailor Software
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. list-table::
   :header-rows: 1
   :widths: 5 50 45

   * - ID
     - Description
     - Expected output

   * - 0.
     - Install the `epct` and `epct_plugin_mtg` packages as described in `<[EPCT_MTG_README]>`_
     - The installation is successful

   * - 1.
     - Check the `epct_plugin_mtg` si correctly installed, running the command:

       ``epct info``
     - The output of the command reports ``epct_mtg`` under the ``registered_backends`` key

   * - 2.
     - Check the `epct_plugin_mtg` si correctly installed, running the command:

       ``epct info``
     - The output of the command reports ``epct_mtg`` under the ``registered_backends`` key

   * - 3.
     - Decompress the TD.COMP.01 file, running the command:

       ``echo -e "product: MTGFCIL1\nformat: netcdf4_satellite" | epct run-chain -y -o $OUTPUT_DIR $COMPRESSED_PRODUCT``

       where

       * ``$OUTPUT_DIR`` is the path to the directory where the decompressed is placed, which should be different from the
         directory containing TD.COMP.01
       * ``$COMPRESSED_PRODUCT`` is the path to TD.COMP.01
     - The output of the command reports ``*** STOP PROCESSING - Status DONE ***``

   * - 4.
     - Check that the output product is actually decompressed, running the command:

       ``ncdump -h -s $OUTPUT_PRODUCT | grep _Filter``

       where ``$OUTPUT_PRODUCT`` is the path to the decompressed output product, reported in the printed output of
       step 3
     - The output of the command is empty

FCIDECOMP.OFF.TC.01.01: installation of the FCIDECOMP Software using the offline dependencies repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0
   :widths: 20 80

   * - Goal
     - Validate the possibility to install the FCIDECOMP Software using the offline dependencies repository hosted at
       `<[FCIDECOMP_DEP_OFF]>`_
   * - Input data
     - TD.COMP.01
   * - Pass/Fail criteria
     - The FCIDECOMP Software is correctly installed

       The plugin can be used to successfully generates a decompressed netCDF output product


.. _FCIDECOMP.OFF.TP.01.01:

FCIDECOMP.OFF.TP.01.01: installation of the FCIDECOMP Software using the offline dependencies repository
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. list-table::
   :header-rows: 1
   :widths: 10 55 35

   * - ID
     - Description
     - Expected output
   * - 0.
     - Install the FCIDECOMP Software following instructions reported in the README file at `<FCIDECOMP_DEP_OFF>`_
     - The installation is successful
   * - 1.
     - Execute the automatic test described in :ref:`automatic_tests`
     - Tests are successful
