Organization of Test Cases, Non-regression Tests
------------------------------------------------

Organization of Test Cases and Order of Execution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Automatic test cases (FCIDECOMP.CLI.TC.01.01 and FCIDECOMP.PY.TC.01.01) test
the FCIDECOMP software can be used to decompress FC1 L1c NRT data
via command line tools and via Python.
The netCDF4 `nccopy` tool is taken as reference for command line tools,
and the `netCDF4` Python library is taken as reference for use via Python.

Manual test cases test the FCIDECOMP software
can be used to decompress FC1 L1c NRT data
via selected Java Software and via the Data Tailor Software (FICDECOMP.JAVA.TC.01.01 and FCIDECOMP.JAVA.TP.01.01),
and that it can be installed using the offline dependencies repository hosted at **TBD** (FCIDECOMP.OFF.TP.01.01).
`Panoply` is taken as reference for decompression via Java Software

.. _organization_of_test_cases_conventions:

Conventions
~~~~~~~~~~~

The following conventions have been adopted in writing the Test
Procedures:

-  all paths follow the Linux convention (“/” as the separator)

-  commands executed in a terminal are written with a BASH syntax (e.g.
   newlines).

For validation purposes, reference platform are:

- Centos 7, Windows 64-bit and Windows 32-bit for FCIDECOMP.CLI.TC.01.01 and FCIDECOMP.PY.TC.01.01
- **TBD**


.. _reference_platform:

Reference Platform and Execution Time for Test Cases
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As a support to the planning of test sessions, the following table
summarizes hardware and software pre-requisites and average execution
times for each test case category, for the reference platform with the
following specifications:

- Number of CPU cores: -

- RAM: -

- OS: -

.. list-table:: Estimated execution times for test cases under each test sub-category.
   :header-rows: 1
   :widths: 20 40 40

   * - Category ID
     - Software pre-requisites
     - Average execution time in seconds

   * - FCIDECOMP.CLI.TC.01.01
     - ``conda`` environment with

       * ``fcidecomp`` installed, as described in the INSTALL file at `<[FCIDECOMP]>`_
       * ``pytest`` installed, as described `here <https://anaconda.org/anaconda/pytest>`_
     -

   * - FCIDECOMP.PY.TC.01.01
     - ``conda`` environment with

       * ``fcidecomp`` installed, as described in the INSTALL file at `<[FCIDECOMP]>`_
       * ``pytest`` installed, as described `here <https://anaconda.org/anaconda/pytest>`_
     -

   * - FCIDECOMP.JAVA.TC.01.01
     - * ``conda`` environment with ``fcidecomp`` installed, as described in the INSTALL file at `<[FCIDECOMP]>`_
       * ``panoply`` installed, as described in `<https://www.giss.nasa.gov/tools/panoply/download/>`_
     -

   * - FCIDECOMP.DT.TC.01.01
     - ``conda`` environment with ``epct`` and ``epct_plugin_mtg`` installed, as described in `<[EPCT_MTG_README]>`_
     -

   * - FCIDECOMP.OFF.TC.01.01
     - ``conda`` environment with

       * ``fcidecomp`` installed, as described in the INSTALL file at `<[FCIDECOMP]>`_
       * ``pytest`` installed, as described `here <https://anaconda.org/anaconda/pytest>`_
     -


Requirements and Validation Goals addressed by Test Cases
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following table maps the requirements detailed in the :ref:`Work package description <[FCIDECOMP_WP]>` with the
validation goals defined in the :ref:`FCIDECOMP Verification and Validation Plan <[FCIDECOMP_VV]>`
and respective tests to meet these goals defined herein:

.. list-table:: Requirements and validation goals addressed by the test cases defined in this document.
   :header-rows: 1
   :widths: 10 40 50

   * - Requirement
     - Validation Goal
     - Corresponding Tests (IDs)

   * - DTWS-FCI-010
     - VG1, VG2, VG3, VG4
     - All

   * - DTWS-FCI-020
     - VG4
     - FCIDECOMP.DT.TC.01.01

   * - DTWS-FCI-030
     - VG1, VG3
     - FCIDECOMP.CLI.TC.01.01, FCIDECOMP.PY.TC.01.01

   * - DTWS-FCI-040
     - VG5, VG6
     - FCIDECOMP.OFF.TC.01.01

   * - DTWS-FCI-050
     - Contractual requirement
     - No test expected



