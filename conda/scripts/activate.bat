@echo off
if [%HDF5_PLUGIN_PATH%] = [] (
    set HDF5_PLUGIN_PATH="%CONDA_PREFIX%\Library\bin"
)
if "%HDF5_PLUGIN_PATH%"=="%%HDF5_PLUGIN_PATH:%CONDA_PREFIX%\Library\bin=%"
    set HDF5_PLUGIN_PATH="%HDF5_PLUGIN_PATH%;%CONDA_PREFIX%\Library\bin"