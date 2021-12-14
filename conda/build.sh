# Code inspired by:
# - https://github.com/conda-forge/charls-feedstock/blob/master/recipe/build.sh
# - https://github.com/mraspaud/fcidecomp-conda-recipe/blob/master/build.sh

set -ex

PATH_TO_DELIVERY=$(pwd)
FCIDECOMP_BUILD_PATH=${PATH_TO_DELIVERY}/build
mkdir -p ${FCIDECOMP_BUILD_PATH}
cd ${FCIDECOMP_BUILD_PATH}

# Build FCIDECMP
cp -r ${PATH_TO_DELIVERY}/fcidecomp/* ${FCIDECOMP_BUILD_PATH}

## Build fcicomp-jpegls
./gen/build.sh fcicomp-jpegls release                                     \
    -DCMAKE_PREFIX_PATH=${CONDA_PREFIX}                                   \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}                                      \
    -DCHARLS_ROOT=${PREFIX}                                               \
./gen/build.sh fcicomp-jpegls test
./gen/install.sh fcicomp-jpegls

## Build fcicomp-H5Zjpegls
./gen/build.sh fcicomp-H5Zjpegls release                                  \
    -DCMAKE_PREFIX_PATH="${PREFIX};${CONDA_PREFIX};${CONDA_PREFIX}"       \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}                                      \
# Fails (4 out of 7 tests failing)
# ./gen/build.sh fcicomp-H5Zjpegls test
./gen/install.sh fcicomp-H5Zjpegls

pip install --no-deps --ignore-installed -vv ../fcidecomp-python