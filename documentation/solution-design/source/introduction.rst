Introduction
------------

Purpose
~~~~~~~

The document describes a design proposal for a maintainable solution allowing users to reliably decode FCI L1c products
compressed with CharLS.

Reference Documents
~~~~~~~~~~~~~~~~~~~

.. list-table:: Reference documents
  :header-rows: 1
  :class: longtable
  :widths: 20 30 50

  * - #
    - Title
    - Reference

  * - [CONDA_VARIANTS]

      .. _[CONDA_VARIANTS]:
    - conda-build – Build variants
    - `https://docs.conda.io/projects/conda-build/en/latest/resources/variants.html <https://docs.conda.io/projects/conda-build/en/latest/resources/variants.html>`_

  * - [FCIDECOMP_CONDA]

      .. _[FCIDECOMP_CONDA]:
    - FCIDECOMP Conda recipe developed by Martin Raspaud (SMHI)
    - `https://github.com/mraspaud/fcidecomp-conda-recipe/ <https://github.com/mraspaud/fcidecomp-conda-recipe/>`_

  * - [FCIDECOMP_LATEST]

      .. _[FCIDECOMP_LATEST]:
    - FCIDECOMP v1.0.2 repository
    - `https://sftp.eumetsat.int/public/folder/UsCVknVOOkSyCdgpMimJNQ/User-Materials/Test-Data/MTG/MTG_FCI_L1C_Enhanced-NonN_TD-272_May2020/FCI_Decompression_Software_V1.0.2/EUMETSAT-FCIDECOMP_V1.0.2.tar.gz <https://sftp.eumetsat.int/public/folder/UsCVknVOOkSyCdgpMimJNQ/User-Materials/Test-Data/MTG/MTG_FCI_L1C_Enhanced-NonN_TD-272_May2020/FCI_Decompression_Software_V1.0.2/EUMETSAT-FCIDECOMP_V1.0.2.tar.gz>`_

  * - [FCIDECOMP_WPD]

      .. _[FCIDECOMP_WPD]:
    - Work Package Description
    - EUM/SEP/WPD/21/1244304

  * - [HDF5PLUGIN]

      .. _[HDF5PLUGIN]:
    - ``hdf5plugin`` python package
    - `https://github.com/silx-kit/hdf5plugin <https://github.com/silx-kit/hdf5plugin>`_

  * - [HDFVIEW]

      .. _[HDFVIEW]:
    - HDFView Software
    - `https://www.hdfgroup.org/downloads/hdfview/ <https://www.hdfgroup.org/downloads/hdfview/>`_

  * - [NETCDF_JAVA]

      .. _[NETCDF_JAVA]:
    - Unidata - NetCDF-Java
    - `https://www.unidata.ucar.edu/software/netcdf-java/ <https://www.unidata.ucar.edu/software/netcdf-java/>`_


  * - [NETCDF_JAVA_GITHUB]

      .. _[NETCDF_JAVA_GITHUB]:
    - NetCDF-C for reading (nj22Config.xml) in non-Unidata netCDF-Java based tools
    - `https://github.com/Unidata/thredds/issues/1063 <https://github.com/Unidata/thredds/issues/1063>`_

  * - [PANOPLY]

      .. _[PANOPLY]:
    - Panoply netCDF, HDF and GRIB Data Viewer
    - `https://www.giss.nasa.gov/tools/panoply/ <https://www.giss.nasa.gov/tools/panoply/>`_
