Post-installation configuration
-------------------------------

Once the installation has completed, re-activate the Conda environment running the following commands::

    conda deactivate
    conda activate fcidecomp

This last step ensures the ``HDF5_PLUGIN_PATH`` environment variable is correctly set to the directory containing the
FCIDECOMP decompression libraries (check if that's actually the case to ensure the FCIDECOMP is correctly configured
and ready to be used).