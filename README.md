# EUMETSAT FCIDECOMP software

The FCIDECOMP software enables decompression of JEPG-LS netCDF files via netCDF-C and netCDF-Java based softwares,
Python libraries and the EUMETSAT Data-Tailor software.

## Supported platforms and installation

The FCIDECOMP software can be installed on:

- Linux CentOS 7 64-bit
- Linux Ubuntu 18.04 LTS 64-bit
- Linux Ubuntu 20.04 LTS 64-bit
- Windows 10 64-bit
- Windows 10 32-bit

## Installing the FCIDECOMP software

Installation procedures are described in the INSTALL file.

## Testing the FCIDECOMP software

A set of Python unit tests is present to ensure the installed software works correctly. They should be run within the
Conda environment in which the software has been installed.

### Prerequisites

- `pytest`, installed in the Conda environment in which the software has been installed as described 
[here](https://anaconda.org/anaconda/pytest)

Also, the tests depend on the presence of a set of test data, which can be downloaded
[here](<https://gitlab.eumetsat.int/data-tailor/epct-test-data/-/tree/development/MTG/MTGFCIL1>).
Test files should be placed in a directories tree structured as follows (replace $EPCT_TEST_DATA_DIR
with any chosen name):

```BASH
|_$EPCT_TEST_DATA_DIR
  |_MTG
    |_MTGFCIL1
      |_<test_file_1>
      |_<test_file_2>
      |_ ...
```

Once this is done, the environment variable `EPCT_TEST_DATA_DIR` should be set to the full path to the 
`$EPCT_TEST_DATA_DIR` directory.

### Running the tests

Tests can be executed running the following command from within the root directory of the FCIDECOMP software repository:

    pytest -vv tests

## Using the FCIDECOMP software

The FCIDECOMP decompression library can be used in different ways, described in the following sections.

### Use with netCDF4-C tools

Once the `fcidecomp` Conda package is installed and the Conda environment in which it is installed is activated,
netCDF4-C tools should be automatically configured to decompress JPEG-LS compressed netCDF files. As an example,
to decompress a file using `nccopy`, run the following line:

    nccopy -F none $PATH_TO_COMPRESSED_FILE $PATH_TO_DECOMPRESSED_FILE

where:

- `$PATH_TO_COMPRESSED_FILE>` is the path to the JPEG-LS compressed file
- `$PATH_TO_DECOMPRESSED_FILE>` is the path where the decompressed file should be saved

### Use with `h5py`-based Python libraries

Once the `fcidecomp` Conda package is installed and the Conda environment in which it is installed is activated,
use of the FCIDECOMP decompression libraries should be automatically enabled for `h5py`-based Python libraries.

To ensure the FCIDECOMP filter is loaded, in a Python shell execute:

    import fcidecomp
    
Now every `h5py`-based Python library, such as `xarray`, will be able to open and read JPEG-LS compressed files without 
further steps.

### Use with netCDF-Java based tools

Starting from netCDF-Java **TBD**, it is possible to open JPEG-LS compressed netCDFs with netCDF-Java based tools, 
such as toolsUI and Panoply, instructing netCDF-Java to use the netCDF-C library for reading purposes. 
It is possible to enable this feature by ensuring the file `$HOME/.unidata/nj22Config.xml` exists (if it doesn't, 
is should be created) and that it contains the following lines:

    <nj22Config>
      <Netcdf4Clibrary>
        <libraryPath>$PATH_TO_NETCDF_LIB_DIR</libraryPath>
        <libraryName>netcdf</libraryName>
        <useForReading>true</useForReading>
      </Netcdf4Clibrary>
    </nj22Config>

where `$PATH_TO_NETCDF_LIB_DIR` is the path to the directory containing the `netcdf4` library, which:

- in Linux, corresponds to `$PATH_TO_CONDA_ENV/lib`
- in Windows, corresponds to `$PATH_TO_CONDA_ENV\Library\lib`

with `$PATH_TO_CONDA_ENV` equal to the path to the `conda` environment in which `fcidecomp` is installed.

The described feature has also been proved working for netCDF-Java 5.1.0.

### Use with the EUMETSAT Data-Tailor software

A plugin enabling the decompression of JPEG-LS Meteosat Third Generation (MTG) products via the FCIDECOMP software is
available for the EUMETSAT Data-Tailor software. For further information, refer to the README of its [public GitLab
repository](<TBD>) and the [dedicated EUMETSAT confluence page](<TBD>).

## TBDs

| Section     | TBD         |
| ----------- | ----------- |
| [Use with netCDF-Java based tools](#use-with-netcdf-java-based-tools)                       | Set version of netCDF-Java enabling described feature when available  |
| [Use with the EUMETSAT Data-Tailor software](#use-with-the-eumetsat-data-tailor-software)   | Set URL to public MTG plugin GitLab repository, when available        |
| [Use with the EUMETSAT Data-Tailor software](#use-with-the-eumetsat-data-tailor-software)   | Set URL to confluence MTG plugin page, when available                 |