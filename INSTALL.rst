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
~~~~~~~~~~~~~

Start by creating a new ``conda`` environment. Let's call it ``fcidecomp``, but
any valid name would do (change the following instructions accordingly)::

    conda create -n fcidecomp python=3.7


Activate the environment::

    conda activate fcidecomp

Unzip the ``conda`` packages. They end up in a directory which ends with ``conda-channel``.

- On Linux, execute (replace $DATATAILOR with the path to the directory, including `conda-channel`::

    conda install -y --override-channels -c anaconda -c conda-forge -c $DATATAILOR fcidecomp


