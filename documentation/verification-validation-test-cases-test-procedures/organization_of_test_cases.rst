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
    | -                       | -                                         | -                                   |
    +-------------------------+-------------------------------------------+-------------------------------------+


Requirements and Validation Goals addressed by Test Cases
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following table maps the requirements detailed in the :ref:`Work package description <[FCIDECOMP_WP]>` with the
validation goals defined in the :ref:`FCIDECOMP Verification and Validation Plan <[FCIDECOMP_VV]>`
and respective tests to meet these goals defined herein:

.. table:: Requirements and validation goals addressed by the test cases defined in this document.

    +-----------------------------------+-----------------+-------------------------------------------+
    | Requirements                      | Validation Goal | Corresponding Tests (IDs)                 |
    +===================================+=================+===========================================+
    | DTWS-FCI-010                      | -               | -                                         |
    +-----------------------------------+-----------------+-------------------------------------------+
    | DTWS-FCI-020                      | VG4             | FCIDECOMP.TC.02                           |
    +-----------------------------------+-----------------+-------------------------------------------+
    | DTWS-FCI-030                      | VG1, VG3        | FCIDECOMP.TC.01, FCIDECOMP.TC.02          |                    |
    +-----------------------------------+-----------------+-------------------------------------------+
    | DTWS-FCI-040                      | -               | -                                         |
    +-----------------------------------+-----------------+-------------------------------------------+
    | DTWS-FCI-050                      | -               | -                                         |
    +-----------------------------------+-----------------+-------------------------------------------+


