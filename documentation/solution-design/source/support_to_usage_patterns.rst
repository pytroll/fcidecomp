Support to required usage patterns
-----------------------------------

Introduction
~~~~~~~~~~~~

This section describes the strategies adopted to ensure that the FCIDECOMP software supports the required usage
patterns.

Version 1.0.2 of the FCIDEOCOMP software only supports HDF5 1.10. Strategies to grant support for multiple versions of HDF5
described in :ref:`a_further_developments`.

Dependencies
~~~~~~~~~~~~
:TBW: CharLS v.... JPEGLs... (then in packaging we describe how we include them, and in :ref:`a_further_developments` how to improve)


.. _integration_with_netcdf_c:

Integration with generic tools based on netCDF-C
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Version :ref:`v1.0.2 <[FCIDECOMP_LATEST]>` of the FCIDECOMP software,
already satisfies the HDF5 filters interface; FCIDECOMP is a registered with filter id 
32018 (:ref:`[HDF5FILTERS] <[HDF5FILTERS]>`). 
Integration with utilities relying on the ``netcdf-c``
library (:ref:`[NETCDF-C] <[NETCDF_C]>`) is therefore ensured, provided that:

- the location of the FCIDECOMP filter library is specified in a specific environment variable, ``HDF5_PLUGIN_PATH``;
- the filter id (32018 for FCIDECOMP), if required by the utility, is specified.

.. _usage_as_cli_tool:

Usage as CLI tool
~~~~~~~~~~~~~~~~~

In order to provide a baseline support for CLI usage of the FCIDECOMP software, ``nccopy`` (a software utility included
in the ``netcdf-c`` library) is chosen as reference standard CLI tool. To streamline the ingration with ``nccopy``, 
the FCIDECOMP conda package (:ref:`packaging_and_deployment`_) provides to:

- put the filter's library to a specific path at installation
- set the ``HDF5_PLUGIN_PATH`` environment variable automatically.

The FCIDECOMP software documentation also provides instructions on how to call ``nccopy`` to decompress files using the
FCIDECOMP filter.

Integration with Python
~~~~~~~~~~~~~~~~~~~~~~~

Integration with Python is provided by a small Python package developed ad hoc, which satisfies the required ``h5py``
interface to make the FCIDECOMP filter available for Python applications. Such package, based upon a stripped-down
version of the :ref:`hdf5plugin package <[HDF5PLUGIN]>`, is essentially composed of an ``__init__.py`` defining the
filter interface to ``h5py``.

See :ref:`_a_integration_with_hdf5plugin` for details on the proposed integration with the widely used ``hdf5plugin`` package and
interaction with its maintainers.

.. _integration_with_data_tailor:

Integration with EUMETSAT Data Tailor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

At the moment, the Data Tailor supports reading compressed FCI L1C products through the optional
``epct_plugin_mtg4africa`` :ref:`customisation plugin <[MTG4AFRICA]>`, which in turns install FCIDECOMP by installing
with ``pip`` the ``hdf5plugin`` package.

The approach to integrate the described solution with the Data Tailor includes a revision of the current
build and installation approach for the ``epct_plugin_mtg4africa`` customisation plugin, so that it
installs the FCIDECOMP support and its dependencies from the new conda package (see :ref:`packaging_and_deployment`_).

.. _integration_with_netcdf_java:

Integration with tools based on netCDF-Java
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`Panoply <[PANOPLY]>` and :ref:`HDFView <[HDFVIEW]>` have been identified as the key software based on netCDF-Java
to support. 

The integration of the FCIDECOMP software in these applications is achieved by instructing them
to use the netCDF-C library (instead of netCDF-Java) to read netCDF files
(see related :ref:`github issue <[NETCDF_JAVA_GITHUB]>`). Support is then granted by describing the aforementioned
procedure in the FCIDECOMP software documentation.

The issue of a generic integration with :ref:`Unidata Netcdf-Java <[NETCDF_JAVA]>` is discussed in
:ref:`_a_design_justifications`.
