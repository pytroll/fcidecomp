Install the EUMETSAT FCIDECOMP software
---------------------------------------

This document describes how to build and install the EUMETSAT FCIDECOMP software from the source code on a machine
provided with an internet connection.
The following Operating Systems are supported:

- CentOS Linux 7 64bit

There are two ways to install the EUMETSAT FCIDECOMP software:

* from the conda packages in the EUMETSAT Anaconda repository (requires an Internet connection),
  as described below in `Installation from the Anaconda repository`_
* from conda packages downloaded as artifacts of CI pipelines on the target machine (mostly for testing purposes),
  as described in `Installation from an 'artifacts' file`_ .

Hardware pre-requisites
~~~~~~~~~~~~~~~~~~~~~~~~

Installation from the Anaconda repository
-----------------------------------------

Pre-requisites
~~~~~~~~~~~~~~

Installation requires:

- ``conda``, installed as described
  `here <https://conda.io/projects/conda/en/latest/user-guide/install/index.html>`_

- a connection to internet

Installation
~~~~~~~~~~~~~

Start by creating a new ``conda`` environment. Let's call it ``fcidecomp``, but
any valid name would do (change the following instructions accordingly)::

    conda create -n fcidecomp python=3.7


Activate the environment::

    conda activate fcidecomp


- On Linux, execute::

    conda install -y --override-channels -c anaconda -c conda-forge -c eumetsat fcidecomp


Installation from an 'artifacts' file
--------------------------------------

Pre-requisites
~~~~~~~~~~~~~~

Installation requires:

- the FCIDECOMP ``conda`` packages, downloaded as a single ``zip`` file from the project CI pipelines

- ``conda``, installed as described
  `here <https://conda.io/projects/conda/en/latest/user-guide/install/index.html>`_.

Installation
~~~~~~~~~~~~

Start by creating a new ``conda`` environment. Let's call it ``fcidecomp``, but
any valid name would do (change the following instructions accordingly)::

    conda create -n fcidecomp python=3.7


Activate the environment::

    conda activate fcidecomp

Unzip the ``conda`` packages. They end up in a directory which ends with ``conda-channel``.

- On Linux, execute (replace $FCIDECOMP with the path to the directory, including `conda-channel`::

    conda install -y --override-channels -c anaconda -c conda-forge -c $FCIDECOMP fcidecomp


Test and use the FCIDECOMP software
-----------------------------------

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



