Support to required usage patterns
-----------------------------------

Introduction
~~~~~~~~~~~~

This section describes the strategies adopted to ensure that the FCIDECOMP software supports the required usage
patterns.

**[NOTA: questo l'ho spostato qui da Packaging and deployment]**

As a baseline, the FCIDEOCOMP software supports HDF5 1.10. Strategies to grant support for multiple versions of HDF5
described in the `Further developments appendix <further_developments`.

.. _integration_with_netcdf_c:

Integration with tools based on netCDF-C
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**[NOTA: mi sembra che questa parte stia meglio in un ulteriore sottoparagrafo invece che nell'intro,
ma se non sei d'accordo la sposto su e tolgo questo paragrafo]**

The current implementation of the FCIDECOMP software (:ref:`v1.0.2 <[FCIDECOMP_LATEST]>`) which, as mentioned in the
:ref:`Repository initialization <repository_initialization>` paragraph serves as blueprint for the software codebase,
already satisfies the HDF5 filters interface. Given this, integration with utilities relying on the ``netcdf-c``
library (:ref:`[NETCDF-C] <[NETCDF_C]>`) is ensured, provided that:

- the location of the FCIDECOMP filter library is specified in a specific environment variable, ``HDF5_PLUGIN_PATH``;
- the correct filter id (32018 for FCIDECOMP), if required by the utility, is specified;

.. _usage_as_cli_tool:

Usage as CLI tool
~~~~~~~~~~~~~~~~~

In order to provide a baseline support for CLI usage of the FCIDECOMP software, ``nccopy`` (software utility of the
``netcdf-c`` library) is chosen as reference standard CLI tool. To foster integration with ``nccopy``, the FCIDECOMP
software provides to:

- put the filter's library to a specific path at installation
- have the ``HDF5_PLUGIN_PATH`` environment variable automatically set each time a conda environment where FCIDECOMP is installed get activated

The FCIDECOMP software documentation also provides instructions on how to call ``nccopy`` to decompress files using the
FCIDECOMP filter.

Integration with Python
~~~~~~~~~~~~~~~~~~~~~~~

Integration with Python is provided by a small Python package developed ad hoc, which satisfies the required ``h5py``
interface to make the FCIDECOMP filter available for Python applications. Such package, based upon a stripped-down
version of the :ref:`hdf5plugin <[HDF5PLUGIN]>` package, is essentially composed of an ``__init__.py`` defining the
filter interface to ``h5py``.

See the :ref:`Integration with hdf5plugin appendix <integration_with_hdf5plugin>` for details on the integration with the widely used :ref:`hdf5plugin <[HDF5PLUGIN]>` package and interation
with its maintainers' community.

.. _integration_with_data_tailor:

Integration with EUMETSAT Data Tailor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

At the moment, the Data Tailor supports reading compressed FCI L1C products through the optional
``epct_plugin_mtg4africa`` :ref:`customisation plugin <[MTG4AFRICA]>`, which in turns install FCIDECOMP by installing
with ``pip`` the ``hdf5plugin`` package.

The approach to integrate the described solution with the Data Tailor includes a revision of the current
build and installation approach for the ``epct_plugin_mtg4africa`` customisation plugin, so that it
installs the FCIDECOMP support through the Python package described above and its dependencies.

.. _integration_with_netcdf_java:

Integration with tools based on netCDF-Java
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`Panoply <[PANOPLY]>` and :ref:`HDFView <[HDFVIEW]>` have been identified as the key software based on netCDF-Java
to support. The integration of the FCIDECOMP software in these applications can be achieved by instructing them
to use the netCDF-C library (instead of netCDF-Java) to read netCDF files
(see related :ref:`github issue <[NETCDF_JAVA_GITHUB]>`). Support is then granted by describing the aforementioned
procedure in the FCIDECOMP software documentation.

The issue of a generic integration with :ref:`Unidata Netcdf-Java <[NETCDF_JAVA]>` is discussed in the
:ref:`Design justification appendix <design_justifications>`.
