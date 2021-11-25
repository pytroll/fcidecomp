set -ex

PATH_TO_DELIVERY=$(pwd)
FCIDECOMP_EXTRACTION_PATH=${PATH_TO_DELIVERY}/build
mkdir -p ${FCIDECOMP_EXTRACTION_PATH}
cd ${FCIDECOMP_EXTRACTION_PATH}

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

# 2.5.2
cp -r ${PATH_TO_DELIVERY}/fcidecomp/* ${FCIDECOMP_EXTRACTION_PATH}

# 2.5.3

# 2.5.3.1
CHARLS_INSTALLATION_PATH=${CONDA_PREFIX}
FCIDECOMP_INSTALLATION_PATH=${PREFIX}
./gen/build.sh fcicomp-jpegls release \
-DCMAKE_PREFIX_PATH=${CONDA_PREFIX} \
-DCMAKE_INSTALL_PREFIX=${FCIDECOMP_INSTALLATION_PATH} \
-DCHARLS_ROOT=${CHARLS_INSTALLATION_PATH} \
-DCMAKE_INCLUDE_PATH=${SRC_DIR}/src

./gen/build.sh fcicomp-jpegls test
./gen/install.sh fcicomp-jpegls

# 2.5.3.2
ZLIB_INSTALLATION_PATH=${CONDA_PREFIX}
HDF5_INSTALLATION_PATH=${CONDA_PREFIX}
./gen/build.sh fcicomp-H5Zjpegls release \
-DCMAKE_PREFIX_PATH="${FCIDECOMP_INSTALLATION_PATH};
${ZLIB_INSTALLATION_PATH};${HDF5_INSTALLATION_PATH}" \
-DCMAKE_INSTALL_PREFIX=${FCIDECOMP_INSTALLATION_PATH}

# Fails
# ./gen/build.sh fcicomp-H5Zjpegls test

./gen/install.sh fcicomp-H5Zjpegls