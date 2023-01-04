# Install the EUMETSAT FCIDECOMP software

This document describes how to install the EUMETSAT FCIDECOMP software.

Two installation methods are available:

- [installation via ``conda``](#installation-from-conda-package) using pre-built packages,  
  supported for the following Operating Systems:

  - Linux CentOS 7 64-bit
  - Linux Ubuntu 18.04 LTS 64-bit
  - Linux Ubuntu 20.04 LTS 64-bit
  - Windows 10 64-bit
  - Windows 10 32-bit.
- build and installation from the source code, available for the following operating systems
  - [RockLinux 8 64-bit](#rockylinux-8-64-bit)
  - [Ubuntu Linux 20.04 64-bit](#ubuntu-linux-2004-64-bit)

## Installation from `conda` package

### Pre-requisites

Installation requires:

- `conda`, installed as described
  [here](<https://conda.io/projects/conda/en/latest/user-guide/install/index.html>)
- a connection to the Internet

### Installation

Start by creating a new `conda` environment. Let's call it `fcidecomp`, but
any valid name would do (change the following instructions accordingly):

    conda create -n fcidecomp python=$PYTHON_VERSION
    
where Python versions currently supported by the FCIDECOMP software are 3.7 <= `$PYTHON_VERSION` <= 3.9.

Activate the environment:

    conda activate fcidecomp

Now execute:

    conda install -y -c anaconda -c conda-forge -c eumetsat fcidecomp

### Post-installation configuration

Once the installation has completed, re-activate the `conda` environment running the following commands:

    conda deactivate
    conda activate fcidecomp
    
This last step ensures the `HDF5_PLUGIN_PATH` environment variable is correctly set to the directory containing the
FCIDECOMP decompression libraries.


## Build and installation from the source code

### Rockylinux 8 64-bit

#### Install pre-requisites

First, install the software required to build the binaries:

    yum install git
    yum install cmake # 3.20 available on RL (installs make 4.2.1)
    yum install gcc # gcc-8.5.0-10.1.el8_6 available on RL
    yum install gcc-c++
  
#### Build CharLS

Next step is to install CharLS. `fcidecomp` has been tested with CharLS version ``2.1.0``, so let's
use this one:

    git clone https://github.com/team-charls/charls.git && cd charls && git checkout 2.1.0 
    mkdir release && cd release
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=On ..
    make && make install

#### Build and install ``fcidecomp``

To build ``fcidecomp``, a few dependencies need to be installed; ``powertools`` from
the ``epel-release`` repository is needed as well, so execute the following:

    yum install zlib-devel #installs version 1.2.11
    dnf install epel-release
    dnf config-manager --set-enabled powertools
    yum install hdf5-devel #installs version 1.10.5

Now we can build ``fcidecomp`` proper, with (set ``FCIDECOMP_TAG`` to the proper fcidecomp tag,
``PATH_TO_CHARLS`` to the path where CharLS has been installed, and
change the installation paths below as deemed appropriate):

    cd
    git clone https://gitlab.eumetsat.int/sepdssme/fcidecomp/fcidecomp/ && cd fcidecomp
    git checkout $FCIDECOMP_TAG && cd src/fcidecomp
    ./gen/build.sh fcicomp-jpegls release -DCMAKE_PREFIX_PATH=$PATH_TO_CHARLS   -DCMAKE_INSTALL_PREFIX=/usr/local/fcidecomp
    ./gen/build.sh fcicomp-jpegls test 
    ./gen/install.sh fcicomp-jpegls
    ./gen/build.sh fcicomp-H5Zjpegls release -DCMAKE_PREFIX_PATH="/usr/local/fcidecomp" -DCMAKE_INSTALL_PREFIX=/usr/local/fcidecomp
    ./gen/build.sh fcicomp-H5Zjpegls test # 4 failures
    ./gen/install.sh fcicomp-H5Zjpegls


## Build and installation from the source code

### Ubuntu Linux 20.04 64-bit

#### Install pre-requisites

First, install the software required to build the binaries:

    apt install -y git cmake gcc g++


#### Build CharLS

Follow the instructions for [RockyLinux 8](#build-charls)

#### Build and install ``fcidecomp``

To build ``fcidecomp``, a few dependencies need to be installed:

    apt install -y zlib1g-dev libhdf5-dev


Now we can build ``fcidecomp`` proper, with (set ``FCIDECOMP_TAG`` to the proper fcidecomp tag,
``PATH_TO_CHARLS`` to the path where CharLS has been installed, and
change the installation paths below as deemed appropriate):

    cd
    git clone https://gitlab.eumetsat.int/sepdssme/fcidecomp/fcidecomp/ && cd fcidecomp
    git checkout $FCIDECOMP_TAG && cd src/fcidecomp
    ./gen/build.sh fcicomp-jpegls release -DCMAKE_PREFIX_PATH=$PATH_TO_CHARLS  -DCMAKE_INSTALL_PREFIX=/usr/local/fcidecomp
    ./gen/build.sh fcicomp-jpegls test 
    ./gen/install.sh fcicomp-jpegls
    ./gen/build.sh fcicomp-H5Zjpegls release -DCMAKE_PREFIX_PATH="/usr/local/fcidecomp" -DCMAKE_INSTALL_PREFIX=/usr/local/fcidecomp
    ./gen/build.sh fcicomp-H5Zjpegls test # 4 failures
    ./gen/install.sh fcicomp-H5Zjpegls
