Install the EUMETSAT FCIDECOMP software
---------------------------------------

This document describes how to build and install the EUMETSAT FCIDECOMP software from the source code on a machine
provided with an internet connection.
The following Operating Systems are supported:

- Linux CentOS 7 64bit
- Linux Ubuntu 18.04 LTS
- Linux Ubuntu 20.04 LTS
- Windows 10 64bit
- Windows 10 32bit

There are two ways to install the EUMETSAT FCIDECOMP software:

* from the conda packages in the EUMETSAT Anaconda repository (requires an Internet connection),
  as described below in `Installation from the Anaconda repository`_
* from conda packages downloaded as artifacts of CI pipelines on the target machine (mostly for testing purposes),
  as described in `Installation from an 'artifacts' file`_ .

Installation from the Anaconda repository
-----------------------------------------

Pre-requisites
~~~~~~~~~~~~~~

Installation requires:

- ``conda``, installed as described
  `here <https://conda.io/projects/conda/en/latest/user-guide/install/index.html>`_

- a connection to the internet

Installation
~~~~~~~~~~~~~

Start by creating a new ``conda`` environment. Let's call it ``fcidecomp``, but
any valid name would do (change the following instructions accordingly)::

    conda create -n fcidecomp python=3.7


Activate the environment::

    conda activate fcidecomp


Now execute::

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
Execute (replace ``CONDACHANNELPATH`` with the path to the directory, including `conda-channel`)::

    conda install -y --override-channels -c anaconda -c conda-forge -c CONDACHANNELPATH fcidecomp

For example, on Linux::

    conda install -y --override-channels -c anaconda -c conda-forge -c /home/user1/Desktop/conda/conda-channel fcidecomp

For example, on Windows::

    conda install -y --override-channels -c anaconda -c conda-forge -c C:\Users\user1\Desktop\conda\conda-channel fcidecomp

Installation from the Conda recipe
----------------------------------

The FCIDECOMP software can be also built and installed using the provided ``conda`` recipe: instructions are detailed in the
``conda/README.rst`` file.




