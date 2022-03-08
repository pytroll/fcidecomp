# Install the EUMETSAT FCIDECOMP software

This document describes how to install the EUMETSAT FCIDECOMP software.
The following Operating Systems are supported:

- Linux CentOS 7 64bit
- Linux Ubuntu 18.04 LTS
- Linux Ubuntu 20.04 LTS
- Windows 10 64bit
- Windows 10 32bit

There are three ways to install the EUMETSAT FCIDECOMP software:

- from the conda packages hosted in the EUMETSAT Anaconda repository (requires an Internet connection),
as described below in the [Installation from the Anaconda repository](#installation-from-the-anaconda-repository)
section;
- from the conda packages downloaded as artifacts of a CI/CD GitLab pipeline on the target machine 
(mostly for testing purposes), as described in the 
[Installation from an 'artifacts' file](#installation-from-an-artifacts-file) section;
- using the provided conda recipe, as described in the 
[Installation from the Conda recipe](#installation-from-the-conda-recipe) section.

## Installation from the Anaconda repository

### Pre-requisites

Installation requires:

- `conda`, installed as described
  [here](<https://conda.io/projects/conda/en/latest/user-guide/install/index.html>)
- a connection to the internet

### Installation

Start by creating a new `conda` environment. Let's call it `fcidecomp`, but
any valid name would do (change the following instructions accordingly):

    conda create -n fcidecomp python=$PYTHON_VERSION
    
where Python versions currently supported by the FCIDECOMP Software are 3.7 <= `$PYTHON_VERSION` <= 3.9.

Activate the environment:

    conda activate fcidecomp

Now execute:

    conda install -y -c anaconda -c conda-forge -c eumetsat fcidecomp

## Installation from an 'artifacts' file

### Pre-requisites

Installation requires:

- the FCIDECOMP `conda` packages, downloaded as a single `zip` file from the one of the project's 
  [CI/CD pipelines](<https://gitlab.eumetsat.int/sepdssme/fcidecomp/fcidecomp/-/pipelines>)
- `conda`, installed as described
  [here](<https://conda.io/projects/conda/en/latest/user-guide/install/index.html>)

### Installation

Start by creating a new `conda` environment. Let's call it `fcidecomp`, but
any valid name would do (change the following instructions accordingly):

    conda create -n fcidecomp python=$PYTHON_VERSION
    
where Python versions currently supported by the FCIDECOMP Software are 3.7 <= `$PYTHON_VERSION` <= 3.9.

Activate the environment:

    conda activate fcidecomp

Unzip the `conda` packages. They end up in a directory which ends with `conda-channel`.
Execute (replace `$CONDA_CHANNEL_PATH` with the path to the directory, including `conda-channel`):

    conda install -y -c anaconda -c conda-forge -c $CONDA_CHANNEL_PATH fcidecomp


## Installation from the Conda recipe

The FCIDECOMP software can be also built and installed using the provided `conda` recipe: instructions are detailed in 
the `conda/README.md` file.




