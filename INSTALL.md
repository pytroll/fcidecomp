# Install the EUMETSAT FCIDECOMP software

This document describes how to install the EUMETSAT FCIDECOMP software.
The following Operating Systems are supported:

- Linux CentOS 7 64-bit
- Linux Ubuntu 18.04 LTS 64-bit
- Linux Ubuntu 20.04 LTS 64-bit
- Windows 10 64-bit
- Windows 10 32-bit

## Pre-requisites

Installation requires:

- `conda`, installed as described
  [here](<https://conda.io/projects/conda/en/latest/user-guide/install/index.html>)
- a connection to the Internet

## Installation

Start by creating a new `conda` environment. Let's call it `fcidecomp`, but
any valid name would do (change the following instructions accordingly):

    conda create -n fcidecomp python=$PYTHON_VERSION
    
where Python versions currently supported by the FCIDECOMP software are 3.7 <= `$PYTHON_VERSION` <= 3.9.

Activate the environment:

    conda activate fcidecomp

Now execute:

    conda install -y -c anaconda -c conda-forge -c eumetsat fcidecomp

## Post-installation configuration

Once the installation has completed, re-activate the `conda` environment running the following commands:

    conda deactivate
    conda activate fcidecomp
    
This last step ensures the `HDF5_PLUGIN_PATH` environment variable is correctly set to the directory containing the
FCIDECOMP decompression libraries.




