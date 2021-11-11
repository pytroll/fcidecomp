.. _introduction:

Introduction
------------

Purpose
~~~~~~~

The document details the V&V plan for the Work Package 'Support to CharLS decompression for MTG users'
in the context of the EUMETSAT Data Tailor Web Service.

Scope
~~~~~

Objective of this plan is define how to validate the ability of the FCIDECOMP software to decompress
FC1 L1c NRT data, verifying its compatibility with MTG user stations.

It is addressed at:

-  Data Tailor developers/quality manager, to support them in the internal V&V
   process,

-  EUMETSAT officers in charge of the validation of the prototype.


Applicable Documents
~~~~~~~~~~~~~~~~~~~~

.. list-table:: Applicable documents.
  :header-rows: 1
  :widths: 25 35 40

  * - #
    - Title
    - Reference
  * - [FCIDECOMP_TP]

      .. _[FCIDECOMP_TP]:
    - Support to CharLS decompression for MTG users - Test Cases and Test Procedures
    - :TBD:
  * - [FCIDECOMP_VCD]

      .. _[FCIDECOMP_VCD]:
    - Support to CharLS decompression for MTG users - Verification Control Document
    - :TBD:
  * - [FCIDECOMP_VP]

      .. _[FCIDECOMP_VP]:
    - Support to CharLS decompression for MTG users - Test Plan
    - :TBD:
  * - [FCIDECOMP_WP]

      .. _[FCIDECOMP_WP]:
    - Support to CharLS decompression for MTG users - Work package description
    - EUM/SEP/WPD/21/1244304


Reference Documents
~~~~~~~~~~~~~~~~~~~

.. list-table:: Reference documents.
  :header-rows: 1
  :class: longtable
  :widths: 23 42 35

  * - #
    - Title
    - Reference
  * - [FCIDECOMP_EXECPLAN]

      .. _[FCIDECOMP_EXECPLAN]:
    - FCIDECOMP software - Execution Plan
    - `fcidecomp/documentation/execution-plan <../../../execution-plan/_build/html/index.html>`_
  * - [OPSTRR]

      .. _[OPSTRR]:
    - OPS/TSS Working Practice on TRR_TRB
    - EUM/TSS/DOC/13/688793
  * - [FCIDECOMP_SRC]

      .. _[FCIDECOMP_SRC]:
    - FCIDECOMP source code
    - https://sftp.eumetsat.int/public/folder/UsCVknVOOkSyCdgpMimJNQ/User-Materials/Test-Data/MTG/MTG_FCI_L1C_Enhanced-NonN_TD-272_May2020/FCI_Decompression_Software_V1.0.2/EUMETSAT-FCIDECOMP_V1.0.2.tar.gz
  * - [HDF5PLUGIN]

      .. _[HDF5PLUGIN]:
    - “Hdf5plugin - HDF5 Plugins for Windows, MacOS, and Linux“
    - https://pypi.org/project/hdf5plugin
  * - [FCICOMP_DCK]

      .. _[FCICOMP_DCK]:
    - “Docker container for setting up the environment for compressing charls fci1c files.“
    - https://gitlab.eumetsat.int/data-tailor/support-to-mtg/mtg-fci1c-fcicomp-docker
  * - [FCIDECOMP_CND]

      .. _[FCIDECOMP_CND]:
    - “fcidecomp-conda-recipe“
    - https://github.com/mraspaud/fcidecomp-conda-recipe/blob/master/meta.yaml
  * - [HDF]

      .. _[HDF]:
    - “The HDF Support portal – Filters“
    - https://support.hdfgroup.org/services/filters.html
  * - [CONDA_BLD]

      .. _[CONDA_BLD]:
    - “conda-build – Build variants”
    - https://docs.conda.io/projects/conda-build/en/latest/resources/variants.html
  * - [JOA_DCK]

      .. _[JOA_DCK]:
    - “joaquinrgu/fcidecomp“
    - https://hub.docker.com/r/joaquinrgu/fcidecomp
  * - [NETCDF_ISS]

      .. _[NETCDF_ISS]:
    - “NetCDF-C for reading (nj22Config.xml) in non-Unidata netCDF-Java based tools #1063“
    - https://github.com/Unidata/thredds/issues/1063


List of TBDs
^^^^^^^^^^^^

.. list-table:: Items yet to be defined.
  :header-rows: 1
  :widths: 50 20 30

  * - Item
    - Place in text
    - Expected definition time
  * - Test Cases and Test Procedures reference
    - :ref:`introduction`, Applicable Documents
    - Mid-term review
  * - Verification Control Document reference
    - :ref:`introduction`, Applicable Documents
    - As soon as tests are defined and the document populated
