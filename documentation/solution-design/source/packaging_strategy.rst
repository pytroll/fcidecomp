Packaging strategy
------------------

In the following paragraphs outlines of the strategy to build and package the FCIDECOMP software in order to ensure
support for and integration with all the required systems are reported.

.. _supported_platforms:

Supported platforms
~~~~~~~~~~~~~~~~~~~

Based on the :ref:`Work Package Description <[FCIDECOMP_WPD]>` and not considering OS that already have reached their
End of Life, the FCIDECOMP software will support the following platforms:

- Windows 10, 32 and 64 bit
- Ubuntu 18.04, Ubuntu 20.04 64 bit
- CentOS 7 64 bit

Building the binaries
~~~~~~~~~~~~~~~~~~~~~

The build system for the software binaries will be initially drawn from the one used in the
:ref:`FCIDECOMP v1.0.2 source code <[FCIDECOMP_LATEST]>`, and adapted from there to guarantee support for all the
required systems.

Packaging as a Conda package
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Packages will be built using Conda, as it provides standardised environments with a large set of pre-compiled packages.
From the point of view of Conda, the operating systems listed in the :ref:`Supported platforms <supported_platforms>`
paragraph can be considered as two groups of OS: in Conda standardised environment it is enough to build the package for
one Linux distribution in order to make it compatible with other Linux distributions. So two conda packages will be
released: one for Linux distributions, and one for Windows 10.

These conda packages will install both the FCIDECOMP libraries and its Python bindings. As a blueprint for the
conda recipes, the :ref:`Conda recipe <[FCIDECOMP_CONDA]>` for the packaging of FCIDECOMP mantained by Martin Raspaud
from the Swedish Meteorological and Hydrological Institute will be used.

The initial aim will be to support HDF5 1.10, and then the use of :ref:`conda variants <[CONDA_VARIANTS]>` will be
explored to support multiple versions on the same build platform.

Conda packages will be uploaded to EUMETSAT Anaconda repository.

CI/CD pipelines
~~~~~~~~~~~~~~~

We will implement simple CI/CD pipelines to compile, build, test and possibly upload the conda packages to the conda
repository.

At least two GitLab runners will be implemented, one with a Docker executor on Linux and the other on Windows.