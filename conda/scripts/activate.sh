if [ -z "${HDF5_PLUGIN_PATH}" ]; then
  export HDF5_PLUGIN_PATH="${CONDA_PREFIX}/hdf5/lib/plugin/"
elif ! [[ ${HDF5_PLUGIN_PATH} == *"${CONDA_PREFIX}/hdf5/lib/plugin/"* ]]; then
  export HDF5_PLUGIN_PATH="${HDF5_PLUGIN_PATH}:${CONDA_PREFIX}/hdf5/lib/plugin/"
fi