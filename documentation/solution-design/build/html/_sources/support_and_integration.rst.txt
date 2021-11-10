Support to required usage patterns
-----------------------------------

Introduction
~~~~~~~~~~~~

This section describes the strategies adopted to ensure that the FCIDECOMP software supports the required usage
patterns.

Integration with tools based on netCDF-C
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[NOTA per Maurizio: mi sembra che questa parte stia meglio in un ulteriore sottoparagrafo invece che nell'intro,
ma se non sei d'accordo la sposto su e tolgo questo paragrafo]

The current implementation of the FCIDECOMP software (:ref:`v1.0.2 <[FCIDECOMP_LATEST]>`) which, as mentioned in the
:ref:`Repository initialization <repository_initialization>` paragraph serves as blueprint for the software codebase,
already satisfies the HDF5 filters interface. Given this, integration with utilities relying on the ``netcdf-c``
library provided that (see :ref:`here <[NETCDF_C]>`), provided that:

- the location of the FCIDECOMP filter library is specified in a specific environment variable, ``HDF5_PLUGIN_PATH``;
- the correct filter id (32018 for FCIDECOMP), if required by the utility, is specified;

Usage as CLI tool
~~~~~~~~~~~~~~~~~

In order to provide a baseline support for CLI usage of the FCIDECOMP software, ``nccopy`` (software utility of the
``netcdf-c`` library) is chosen as reference standard CLI tool.
To foster integration with ``nccopy``, we will:

- have the FCIDECOMP software package install the filter's library to a specific path at installation
- have the ``HDF5_PLUGIN_PATH`` environment variable automatically set each time a conda environment where FCIDECOMP is installed get activated
- document how to call ``nccopy`` to decompress files using the FCIDECOMP filter

Integration with Python
~~~~~~~~~~~~~~~~~~~~~~~

HDF5 filters are typically used in Python programs by invoking the ``h5py`` library, which may in turn require
additional packages to provide specific filters. An example of such additional packages is the ``hdf5plugin`` library,
which makes the FCIDECOMP filter, among others, available to ``h5py``.

To grant integration with Python we will develop a package specific for the FCIDECOMP filter, initially as a
stripped-down version of :ref:`hdf5plugin <[HDF5PLUGIN]>`. We will also try to contact maintainers of the ``hdf5plugin``
package to evaluate synergies and reduce conflicts. In this direction, Initial proposal is to have a small package which
only includes the FCIDECOMP plugin support from ``hdf5plugin``, and to propose the ``hdf5plugin`` maintainers to use it
as a sub-module dependency in ``hdf5plugin`` in order not to break their interfaces and not to duplicate effort; in
this case, this small python package would be maintained by B-Open (for the duration of the contract) on behalf of
EUMETSAT.

Integration with EUMETSAT Data-Tailor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

At the moment, the Data Tailor supports reading compressed FCI L1C products through the optional
``epct_plugin_mtg4africa`` customisation plugin, which in turns install FCIDECOMP by installing with ``pip`` the
``hdf5plugin`` package. Note that the same Data Tailor plugin also uses the FCICOMP software to compress output data,
and that such compressor is built when building the Data Tailor plugin package. This has potential fo dependency
conflicts, as the compressor and the decompressor rely in part on the same dependencies.

The approach to integrate the described solution with the Data Tailor will therefore include a revision of the current
build and installation approach for the ``epct_plugin_mtg4africa`` customisation plugin. The most promising
direction is having the plugin install FCIDECOMP from the conda package, so that dependency conflicts are to some
extent managed by conda.

Integration with tools based on netCDF-Java
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use of the FCIDECOMP decompressor in Java may be complex to address. There is evidence that Unidata netCDF-Java based
tools may work with HDF5 dynamic filters, but it is less clear whether they can still be used with non-Unidata
applications based on NetCDF-Java (e.g. panoply). The main problem is related to the fact NetCDF-Java is essentially
independent from HDF-Java (while NetCDF-C is based on HDF-C), and while HDF-Java can use HDF dynamically loaded filters
as NetCDF-C based applications do, NetCDF-Java cannot.

A promising solution (see this :ref:`github issue <[NETCDF_JAVA_GITHUB]>`) consists in instructing NetCDF-Java based
applications to read files using the NetCDF-C library, via a simple tweak to a configuration file. A preliminary test
showed that, in the considered environment, the described solution is able to let :ref:`Panoply <[PANOPLY]>` (one of the
most used NetCDF-Java based applications) decompress NetCDFs using the FCIDECOMP plugin. We will explore how the
solution behaves with other notable NetCDF-Java based applications, such as :ref:`HDFView <[HDFVIEW]>` and
:ref:`ToolsUI <[NETCDF_JAVA]>`.

In the case this solution is adopted, it will only require to be documented as an effective work-around to use the
FCIDECOMP plugin with NetCDF-Java based applications.
