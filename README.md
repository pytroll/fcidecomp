# EUMETSAT FCIDECOMP software

## Supported platforms and installation

The FCIDECOMP software can be installed on:

- CentOS Linux 7 64bit
- Linux Ubuntu 18.04 LTS
- Linux Ubuntu 20.04 LTS
- Windows 10 64bit
- Windows 10 32bit

Installation procedures are in described in the INSTALL.rst file.

## Testing the FCIDECOMP software

A set of Python unit tests is present to ensure the installed software works correctly. They should be run within the
Conda environment in which the software has been installed.

The tests depend on the presence of a set of test data, which can be downloaded
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

Once this is done, the environment variable `EPCT_TEST_DATA_DIR` should be set to the full path to $EPCT_TEST_DATA_DIR,
and tests can be executed running the following command from within the root directory of the repository:

    pytest -vv

## Using the FCIDECOMP software

### Use with netCDF4-C tools

Once the `fcidecomp` Conda package is installed and the Conda environment in which it is installed is activated,
netCDF4-C tools should be automatically configured to decompress JPEG-LS compressed netCDF files. As an example,
to decompress a file using `nccopy`, run the following line:

    nccopy -F none <PATH_TO_COMPRESSED_FILE> <PATH_TO_DECOMPRESSED_FILE>

where:

- `<PATH_TO_COMPRESSED_FILE>` is the path to the JPEG-LS compressed file
- `<PATH_TO_DECOMPRESSED_FILE>` is the path where the decompressed file should be saved

### Use with `h5py`-based Python libraries

Once the `fcidecomp` Conda package is installed and the Conda environment in which it is installed is activated,
use of the FCIDECOMP decompression libraries should be automatically enabled for `h5py`-based Python libraries.

### Use with NetCDF-Java based tools

#### Panoply

To be able to open JPEG-LS compressed netCDFs with Panoply, it should be instructed to use the NetCDF-C library (instead
of NetCDF-Java) for reading purposes. In Linux, it is possible to enable this feature by ensuring the file
`$HOME/.unidata/nj22Config.xml` exists, and that it contains the following lines:

    <nj22Config>
      <Netcdf4Clibrary>
        <libraryPath><PATH_TO_NETCDF_LIB_DIR></libraryPath>
        <libraryName>netcdf</libraryName>
        <useForReading>true</useForReading>
      </Netcdf4Clibrary>
    </nj22Config>

where `<PATH_TO_NETCDF_LIB_DIR>` is the path to the directory containing the `netcdf4` library.
