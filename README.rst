EUMETSAT FCIDECOMP software
===========================

Supported platforms and installation
------------------------------------

The FCIDECOMP software can be installed on:

- CentOS Linux 7 64bit
- Linux Ubuntu 18.04 LTS
- Linux Ubuntu 20.04 LTS
- Windows 10 64bit
- Windows 10 32bit

Installation procedures are in described in the INSTALL.rst file.

Testing the FCIDECOMP software
------------------------------

Activate the environment created in one of the installation methods described in the INSTALL.rst file, e.g.::

   conda activate fcidecomp

On Linux, it can be activated by default by adding it to `.bashrc`::

   echo conda activate fcidecomp >> $HOME/.bashrc

Once the environment is active, the environment variable HDF5_PLUGIN_PATH is automatically set to the path where the
FCIDECOMP libraries have been installed.

Use with NetCDF-Java based tools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Panoply
=======

To be able to open JPEG-LS compressed netCDFs with Panoply, it should be instructed to use the NetCDF-C library (instead
of NetCDF-Java) for reading purposes. In Linux, it is possible to enable this feature by ensuring the file
``$HOME/.unidata/nj22Config.xml`` exists, and that it contains the following lines::

  <nj22Config>
    <Netcdf4Clibrary>
      <libraryPath><PATH_TO_NETCDF_LIB_DIR></libraryPath>
      <libraryName>netcdf</libraryName>
      <useForReading>true</useForReading>
    </Netcdf4Clibrary>
  </nj22Config>

where ``<PATH_TO_NETCDF_LIB_DIR>`` is the path to the directory containing the ``netcdf4`` library.

Use with netCDF4-C tools
~~~~~~~~~~~~~~~~~~~~~~~~

Once the ``fcidecomp`` Conda package is installed and the Conda environment in which it is installed is activated,
netCDF4-C tools should be automatically configured to decompress JPEG-LS compressed netCDF files. As an example,
to decompress a file using ``nccopy``, run the following line::

  nccopy -F none <PATH_TO_COMPRESSED_FILE> <PATH_TO_DECOMPRESSED_FILE>

where:

- <PATH_TO_COMPRESSED_FILE> is the path to the JPEG-LS compressed file
- <PATH_TO_DECOMPRESSED_FILE> is the path where the decompressed file should be saved