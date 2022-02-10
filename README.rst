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

Activate the environment created in one of the installation methods above, e.g.::

   conda activate fcidecomp

On Linux, it can be activated by default by adding it to `.bashrc`::

   echo conda activate fcidecomp >> $HOME/.bashrc

Once the environment is active, set the environment variable HDF5_PLUGIN_PATH to the path where the FCIDECOMP libraries
have been installed:

- On Linux, execute::

   export HDF5_PLUGIN_PATH=$CONDA_PREFIX/hdf5/lib/plugin/


Use with NetCDF-Java based tools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Panoply
=======

To be able to open FCICOMP compressed NetCDFs with Panoply, it should be instructed to use the NetCDF-C library (instead
of NetCDF-Java) for reading purposes. To do so, the file ``~/.unidata/nj22Config.xml`` must contain the following lines::

  <nj22Config>
    <Netcdf4Clibrary>
      <libraryPath><PATH_TO_NETCDF_LIB_DIR></libraryPath>
      <libraryName>netcdf</libraryName>
      <useForReading>true</useForReading>
    </Netcdf4Clibrary>
  </nj22Config>

where ``<PATH_TO_NETCDF_LIB_DIR>`` is the path to the directory containing the ``netcdf4`` library.

