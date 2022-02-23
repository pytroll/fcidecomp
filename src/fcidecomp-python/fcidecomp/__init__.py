# Code inspired by:
# - https://github.com/silx-kit/hdf5plugin

import ctypes as _ctypes
from glob import glob as _glob
import logging as _logging
import os as _os
import sys as _sys
from collections.abc import Mapping as _Mapping
import h5py as _h5py

_logger = _logging.getLogger(__name__)

try:
    PLUGINS_PATH = _os.environ["HDF5_PLUGIN_PATH"]
except KeyError:
    print("HDF5_PLUGIN_PATH environment variable is not defined")

FCIDECOMP_ID = 32018
FILTERS = {'fcidecomp': FCIDECOMP_ID}

try:
    _FilterRefClass = _h5py.filters.FilterRefBase
except AttributeError:
    class _FilterRefClass(_Mapping):
        """
        Base class for referring to an HDF5 filter and describing its options.
        """
        filter_id = None
        filter_options = ()

        # Mapping interface supports using instances as **kwargs for compatibility
        # with older versions of h5py
        @property
        def _kwargs(self):
            return {
                'compression': self.filter_id,
                'compression_opts': self.filter_options
            }

        def __hash__(self):
            return hash((self.filter_id, self.filter_options))

        def __len__(self):
            return len(self._kwargs)

        def __iter__(self):
            return iter(self._kwargs)

        def __getitem__(self, item):
            return self._kwargs[item]


class FciDecomp(_FilterRefClass):
    """`
    `h5py.Group.create_dataset``'s compression arguments for using FciDecomp filter.
    """
    filter_id = FCIDECOMP_ID

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)


def _init_filters():
    """
    Initialise and register HDF5 filters with h5py
    Generator of tuples: (filename, library handle)
    """
    hdf5_version = _h5py.h5.get_libversion()

    for name, filter_id in FILTERS.items():
        # Check if filter is already loaded (not on buggy HDF5 versions)
        if (1, 8, 20) <= hdf5_version < (1, 10) or hdf5_version >= (1, 10, 2):
            if _h5py.h5z.filter_avail(filter_id):
                _logger.warning("%s filter already loaded, skip it.", name)
                continue

        # Load DLL
        if _sys.platform.startswith('win'):
            filter_file_name = 'H5Zjpegls.dll'
        elif _sys.platform.startswith('linux'):
            filter_file_name = 'libH5Zjpegls.so'
        filename = _glob(_os.path.join(PLUGINS_PATH, filter_file_name))
        if len(filename):
            filename = filename[0]
        else:
            _logger.error("Cannot initialize filter %s: File not found", name)
            continue
        try:
            lib = _ctypes.CDLL(filename)
        except OSError:
            _logger.error("Failed to load filter %s: %s", name, filename)
            continue

        if _sys.platform.startswith('win'):
            # Use register_filter function to register filter
            lib.register_filter.restype = _ctypes.c_int
            retval = lib.register_filter()
        else:
            # Use init_filter function to initialize DLL and register filter
            lib.init_filter.argtypes = [_ctypes.c_char_p]
            lib.init_filter.restype = _ctypes.c_int
            retval = lib.init_filter(
                bytes(_h5py.h5z.__file__, encoding='utf-8'))

        if retval < 0:
            _logger.error("Cannot initialize filter %s: %d", name, retval)
            continue

        yield filename, lib


_filters = dict(_init_filters())  # Store loaded filters
