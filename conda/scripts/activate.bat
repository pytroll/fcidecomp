@echo off
IF NOT DEFINED HDF5_PLUGIN_PATH (
    set HDF5_PLUGIN_PATH="%CONDA_PREFIX%\Library\bin"
)

set tempstring=%HDF5_PLUGIN_PATH%
IF x%tempstring:%CONDA_PREFIX%\Library\bin=%==x%tempstring% (
    set HDF5_PLUGIN_PATH="%HDF5_PLUGIN_PATH%;%CONDA_PREFIX%\Library\bin")
