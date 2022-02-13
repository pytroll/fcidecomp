Manual Tests: Decompression via Java Software and via the EUMETSAT Data Tailor Software, and installation with offline dependencies repository
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this section, users are manually walked through the processes
of:

- Opening and inspecting a JPEG-LS compressd MTG FCI L1C product via Panoply (reference Java Software)
- Decompressiong a JPEG-LS compressed MTG FCI L1C product via the EUMETSAT Data Tailor Software
- Installing the FCIDECOMP Software using the offiline dependencies repoository hoested at EUMETSAT Gitlab

Tests reported in this section use the following test data files, all hosted at `[TEST_DATA] <[TEST_DATA]>`_:

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

FICDECOMP.JAVA.TC.01.01: decompression via Java Software
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0
   :widths: 20 80

   * - Goal
     -
   * - Input data
     -
   * - Pass/Fail criteria
     -


.. _FCIDECOMP.JAVA.TP.01.01:

FCIDECOMP.JAVA.TP.01.01: decompression via Java Software
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. list-table::
   :header-rows: 1
   :widths: 10 55 35

   * - id
     - Description
     - Expected output
   * - 0.
     -
     -
   * - 1.
     -
     -


FICDECOMP.DT.TC.01.01: decompression via the EUMETSAT Data Tailor Software
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0
   :widths: 20 80

   * - Goal
     - Validate the ability to decompress JPEG-LS compressed MTG FCI L1C products using the EUMETSAT Data Tailor Software
   * - Input data
     - TD.COMP.01, TD.DECOMP.01
   * - Pass/Fail criteria
     - The `epct_plugin_mtg` plugin is correctly installed

       The plugin successfully generates a decompressed netCDF ouput product

       The generated netCDF product and TD.DECOMP.01 `measured` groups are equal


.. _FCIDECOMP.DT.TP.01.01:

FCIDECOMP.DT.TP.01.01: decompression via the EUMETSAT Data Tailor Software
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. list-table::
   :header-rows: 1
   :widths: 5 50 45

   * - id
     - Description
     - Expected output
   * - 0.
     - Install the `epct` and `epct_plugin_mtg` packages as described in `<[EPCT_MTG_README]>`_
     - The installation is successful
   * - 1.
     - Check the `epct_plugin_mtg` si correctly installed, running the command:

       ``epct info``
     -

FICDECOMP.OFF.TC.01.01: installation of the FCIDECOMP Software using offline dependencies repository
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0
   :widths: 20 80

   * - Goal
     -
   * - Input data
     -
   * - Pass/Fail criteria
     -


.. _FCIDECOMP.OFF.TP.01.01:

FCIDECOMP.OFF.TP.01.01: installation of the FCIDECOMP Software using offline dependencies repository
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

.. list-table::
   :header-rows: 1
   :widths: 10 55 35

   * - id
     - Description
     - Expected output
   * - 0.
     -
     -
   * - 1.
     -
     -
