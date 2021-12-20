# Copyright 2021, European Organisation for the Exploitation of Meteorological Satellites (EUMETSAT)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import pytest
import subprocess
import xarray as xr

import fcidecomp

TEST_DATA_DIR = os.path.join(os.path.dirname(__file__), "test-data")
BANDS = [
    "ir_105", "ir_123", "ir_133", "ir_38", "ir_87", "ir_97",
    "nir_13", "nir_16", "nir_22",
    "vis_04", "vis_05", "vis_06", "vis_08", "vis_09",
    "wv_63", "wv_73"
]
GROUPS = [f"data/{band}/measured" for band in BANDS]

@pytest.mark.skipif(not os.environ["HDF5_PLUGIN_PATH"], reason="requires HDF5_PLUGIN_PATH in env")
def test_read_compressed_data():

    compr_file = os.path.join(TEST_DATA_DIR, "compressed_test.nc")
    uncompr_test_file = os.path.join(TEST_DATA_DIR, "uncompressed_test.nc")
    uncompr_res_file = os.path.join(TEST_DATA_DIR, "uncompressed_nccopy.nc")
    process = subprocess.run(["nccopy", "-F", "none", compr_file, uncompr_res_file])

    for group in GROUPS:
        ds_res = xr.open_dataset(uncompr_res_file, group=group)
        ds_test = xr.open_dataset(uncompr_test_file, group=group)
        assert ds_res.equals(ds_test)




