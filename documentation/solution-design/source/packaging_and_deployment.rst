Packaging and deployment
------------------------

Introduction
~~~~~~~~~~~~

In the following paragraphs the strategy to build and package the FCIDECOMP software in order to ensure
support for all the required systems is reported.

.. _supported_platforms:

Supported platforms
~~~~~~~~~~~~~~~~~~~

The FCIDECOMP software supports the following platforms:

- Windows 10, 32 and 64 bit
- Ubuntu 18.04, Ubuntu 20.04 64 bit
- CentOS 7 64 bit

Details on the selection process leading to the list presented above are provided in
:ref:`design_justifications`.

Building the binaries
~~~~~~~~~~~~~~~~~~~~~

The build system for the software binaries is drawn from the one used in the
:ref:`FCIDECOMP v1.0.2 source code <[FCIDECOMP_LATEST]>`, and adapted from there to guarantee support for all the
required systems.

Packaging as a Conda package
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Packages are built using Conda, as it provides standardised environments with a large set of pre-compiled packages.
From the point of view of Conda, the operating systems listed in the :ref:`supported_platforms` paragraph can be
considered as two groups of OS: in Conda standardised environment it is enough to build the package for one Linux
distribution in order to make it compatible with other Linux distributions. So two conda packages are released: one for
Linux distributions, and one for Windows 10.

These conda packages install both the FCIDECOMP libraries and its Python bindings. As a blueprint for the
conda recipes, the :ref:`Conda recipe <[FCIDECOMP_CONDA]>` for the packaging of FCIDECOMP mantained by Martin Raspaud
from the Swedish Meteorological and Hydrological Institute has been used.

Conda packages are uploaded to EUMETSAT Anaconda repository **[NOTA: abbiamo una reference?]**.

Packaging process
~~~~~~~~~~~~~~~~~

GitLab CI/CD pipelines to compile, build, test and upload the conda packages to EUMETSAT Anaconda repository are
implemented.

Two GitLab runners are implemented, one with a Docker executor on Linux and the other with a Shell executor on Windows.

**[NOTA: se va presentata come una cosa già fatta, come inserire che non siamo sicure se serva un altro runner per Windows 32-bit?]**