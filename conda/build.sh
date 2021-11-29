# Code inspired by:
# - https://github.com/conda-forge/charls-feedstock/blob/master/recipe/build.sh
# - https://github.com/mraspaud/fcidecomp-conda-recipe/blob/master/build.sh

set -ex

PATH_TO_DELIVERY=$(pwd)
FCIDECOMP_BUILD_PATH=${PATH_TO_DELIVERY}/build
mkdir -p ${FCIDECOMP_BUILD_PATH}
cd ${FCIDECOMP_BUILD_PATH}



# Install CharLS
cmake ${CMAKE_ARGS} -LAH                                                  \
    -DCMAKE_BUILD_TYPE="Release"                                          \
    -DCMAKE_PREFIX_PATH=${PREFIX}                                         \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}                                      \
    -DCMAKE_INSTALL_LIBDIR="lib"                                          \
    -DBUILD_SHARED_LIBS=1                                                 \
    -DCHARLS_BUILD_TESTS=1                                                \
    -DCHARLS_BUILD_SAMPLES=0                                              \
    -DCHARLS_INSTALL=1                                                    \
    ..
make -j${CPU_COUNT}
make install

# Build FCIDECMP
cp -r ${PATH_TO_DELIVERY}/fcidecomp/* ${FCIDECOMP_BUILD_PATH}

## Build fcicomp-jpegls
./gen/build.sh fcicomp-jpegls release                                     \
    -DCMAKE_PREFIX_PATH=${CONDA_PREFIX}                                   \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}                                      \
    -DCHARLS_ROOT=${CONDA_PREFIX}                                         \
    -DCMAKE_INCLUDE_PATH=${SRC_DIR}/src
./gen/build.sh fcicomp-jpegls test
./gen/install.sh fcicomp-jpegls

## Build fcicomp-H5Zjpegls
./gen/build.sh fcicomp-H5Zjpegls release                                  \
    -DCMAKE_PREFIX_PATH=${CONDA_PREFIX}                                   \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}
# Fails
# ./gen/build.sh fcicomp-H5Zjpegls test
./gen/install.sh fcicomp-H5Zjpegls