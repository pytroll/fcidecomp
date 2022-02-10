Organization of Test Cases, Non-regression Tests
------------------------------------------------

Organization of Test Cases and Order of Execution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Automatic test cases (FCIDECOPM.TC.01.*) test the FCIDECOMP software can be used to
decompress FC1 L1c NRT data via command line tools and via Python.
The netCDF4 `nccopy` tool is taken as reference for command line tools,
and the netCDF4 Python library is taken ar reference for use via Python.

Manual test cases (FCIDECOMP.TC.02.*) test the FCIDECOMP software can be used to
decompress FC1 L1c NRT data via command line tools and
via selected Java software (Panoply) and via the Data Tailor Software.

Conventions
~~~~~~~~~~~

The following conventions have been adopted in writing the Test
Procedures:

-  all paths follow the Linux convention (“/” as the separator)

-  commands executed in a terminal are written with a BASH syntax (e.g.
   newlines).

For validation purposes, the reference platform is CentOS 7.


Reference Platform and Execution Time for Test Cases
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As a support to the planning of test sessions, the following table
summarizes hardware and software pre-requisites and average execution
times for each test case category, for the reference platform with the
following specifications:

- Number of CPU cores: 1

- RAM: 4 GB

- OS: CentOS 7 64 bit

.. table:: Estimated execution times for test cases under each test sub-category.

    +-------------------------+-------------------------------------------+-------------------------------------+
    | Category ID             | Software pre-requisites                   | Average execution time in seconds   |
    |                         |                                           |                                     |
    |                         |                                           |                                     |
    +=========================+===========================================+=====================================+
    | ACDC.TC.01.GOME2        | Conda, Data Tailor core package `epct`    | 184                                 |
    |                         | and `epct_plugin_acdc` plugin installed   |                                     |
    +-------------------------+                                           +-------------------------------------+
    | ACDC.TC.01.IASIL3       |                                           | 185                                 |
    +-------------------------+                                           +-------------------------------------+
    | ACDC.TC.01.TROPOMI      |                                           | 36                                  |
    +-------------------------+-------------------------------------------+-------------------------------------+
    | ACDC.TC.02.*            | Notebook server running and accessible    | 1200                                |
    +-------------------------+-------------------------------------------+-------------------------------------+


Requirements and Validation Goals addressed by Test Cases
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following table maps the requirements detailed in the :ref:`Work package description <[ACDC_WP]>` with the
validation goals defined in the :ref:`ACDC Verification and Validation Plan <[ACDC_VV]>`
and respective tests to meet these goals defined herein:

.. table:: Requirements and validation goals addressed by the test cases defined in this document.

    +-----------------------------------+-----------------+-------------------------------------------+
    | Requirements                      | Validation Goal | Corresponding Tests (IDs)                 |
    +===================================+=================+===========================================+
    | REQ 01. All Data Records          | All             | ACDC.TC.01                                |
    +-----------------------------------+-----------------+-------------------------------------------+
    | REQ 02. Output Format NetCDF4     | VG2             | ACDC.TC.01                                |
    +-----------------------------------+-----------------+-------------------------------------------+
    | REQ 03. CDM Compliance            | VG3             | ACDC.TC.01                                |
    +-----------------------------------+-----------------+-------------------------------------------+
    | REQ 04. CF Compliance             | VG2             | ACDC.TC.01                                |
    +-----------------------------------+-----------------+-------------------------------------------+
    | REQ 05. Tools Compatibility       | VG2, VG4        | ACDC.TC.01                                |
    +-----------------------------------+-----------------+-------------------------------------------+
    | REQ 06. Regular Lat-Lon           | VG2             | ACDC.TC.01                                |
    +-----------------------------------+-----------------+-------------------------------------------+
    | REQ 08. Metadata                  | VG2, VG3        | ACDC.TC.01                                |
    +-----------------------------------+-----------------+-------------------------------------------+
    | REQ 09. Jupyter Notebook          | VG4             | ACDC.TC.02                                |
    +-----------------------------------+-----------------+-------------------------------------------+

