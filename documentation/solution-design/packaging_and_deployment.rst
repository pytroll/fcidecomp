.. _packaging_and_deployment:

Packaging and deployment
------------------------

Introduction
~~~~~~~~~~~~

This section describes the strategy to build and package the FCIDECOMP software in order to ensure
support for all the required systems.

.. _supported_platforms:

Supported platforms
~~~~~~~~~~~~~~~~~~~

The FCIDECOMP software supports the following platforms:

- Windows 10, 32 and 64 bit
- Ubuntu 18.04, Ubuntu 20.04 64 bit
- CentOS 7 64 bit

Details on the selection process leading to the list presented above are provided in
:ref:`a_design_justification`.

.. _conda_package:

Packaging as a Conda package
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Packages are built using Conda, as it provides standardised environments with a large set of pre-compiled packages.
From the point of view of Conda, the operating systems listed in the :ref:`supported_platforms` paragraph can be
considered as two groups of OS: in Conda standardised environment it is enough to build the package for one Linux
distribution in order to make it compatible with other Linux distributions. So two Conda packages are released: one for
Linux distributions, and one for Windows 10.

As Conda is both a package manager and an environment manager, it allows to generate the same environment and install
the packages on different OSes of the same type and architecture (e.g. Linux 64-bit). For this reason its use ensures
long-term maintainability of the chosen solution, even in the case any OS listed in :ref:`supported_platforms` should
reach its end-of-life before the end of the period covered by MTG operations.

These Conda packages install both the FCIDECOMP libraries and its Python bindings. As a blueprint for the
Conda recipe, the :ref:`Conda recipe <[FCIDECOMP_CONDA]>` for the packaging of FCIDECOMP mantained by Martin Raspaud
from the Swedish Meteorological and Hydrological Institute has been used.

Conda packages are uploaded to EUMETSAT Anaconda repository https://anaconda.org/Eumetsat/repo.

.. _building_binaries:

Building the binaries from the source code
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The build system for the software binaries is drawn from the one used in the
:ref:`FCIDECOMP v1.0.2 source code <[FCIDECOMP_LATEST]>`, and adapted from there to guarantee support for all the
required systems. It uses ``GCC`` and ``MSVC`` to compile the binaries respectively in Linux and Windows systems.

.. _installing_dependencies:

Installing dependencies
~~~~~~~~~~~~~~~~~~~~~~~

All :ref:`dependencies <dependencies>` are installed through Conda (see :ref:`conda_package`), except for ``CharLS 1.x``.
The required ``CharLS`` version, on which the :ref:`FCIDECOMP v1.0.2 source code <[FCIDECOMP_LATEST]>` is built upon,
is no more present on any public Conda distribution channel. It is thus compiled and installed, together with the
FCIDECOMP software binaries, starting from the source code available at its :ref:`GitHub repository <charls_v1>`.

In order to grant the ability to install the software even in case the remote repositories hosting its dependencies
should become unreachable, a separate assets repository is hosted on EUMETSAT infrastructure.
This assets repository hosts ``.tar.gz`` archives and Conda packages of all the dependencies needed for each release tag
of the FCIDECOMP software. For a possible more general solution, which is out of the scope of this project, see
:ref:`a_improvements`.

.. _packaging_process:

~~~~~~~~~~~~~~~~~

Three Conda packages are released: one for Linux and two for Windows (32-bit and 64-bit).

GitLab CI/CD pipelines to compile, build, test and upload the Conda packages to EUMETSAT Anaconda repository are
implemented. Three GitLab runners are deployed to run the pipelines: one with a Docker executor on Linux and the
other two with Shell executors on Windows 64-bit, where one of these two is configured to compile the package at
32-bit.

For the runners on Windows, the software `Visual Studio 2022` is needed, with some additional notes listed below:
 * the standard shell environment must be set using the script `vcvars64.bat` for compiling
   the package at 64-bit, or the script `vcvars32.bat` for compiling the package at 32-bit. Both the
   scripts are provided by `Visual Studio 2022`
 * in case of compiling the package at 32-bit, the Shell environment must include also the set
   of the variable CONDA_FORCE_32BIT=1

See :ref:`a_runners` for details on the deployed GitLab runners.



