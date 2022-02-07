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


TEST_DATA_PATH = os.environ.get("EPCT_TEST_DATA_DIR", os.path.join("data","data-tailor"))
INPUT_PATH = os.path.join(TEST_DATA_PATH, "MTG", "MTGFCIL1")
BODY_COMPR_FILEPATH = os.path.join(
    INPUT_PATH,
    "W_XX-EUMETSAT-Darmstadt,IMG+SAT,MTI1+FCI-1C-RRAD-FDHSI-FD--CHK-BODY---"
    "NC4E_C_EUMT_20130804120845_GTT_DEV_20130804120330_20130804120345_N_JLS_T_0073_0015.nc"
)
BODY_UNCOMPR_FILEPATH = os.path.join(
    INPUT_PATH,
    "W_XX-EUMETSAT-Darmstadt,IMG+SAT,MTI1+FCI-1C-RRAD-FDHSI-FD--CHK-BODY---"
    "NC4E_C_EUMT_20130804120845_GTT_DEV_20130804120330_20130804120345_N__T_0073_0015.nc"
)
BANDS = [
    "ir_105", "ir_123", "ir_133", "ir_38", "ir_87", "ir_97",
    "nir_13", "nir_16", "nir_22",
    "vis_04", "vis_05", "vis_06", "vis_08", "vis_09",
    "wv_63", "wv_73"
]
GROUPS = [f"data/{band}/measured" for band in BANDS]

@pytest.mark.skipif(not os.environ["HDF5_PLUGIN_PATH"], reason="requires HDF5_PLUGIN_PATH in env")
def test_decompression(tmpdir):

    uncompr_res_file = os.path.join(tmpdir, os.path.basename(BODY_UNCOMPR_FILEPATH))
    process = subprocess.run(["nccopy", "-F", "none", BODY_COMPR_FILEPATH, uncompr_res_file])

    for group in GROUPS:
        ds_res = xr.open_dataset(uncompr_res_file, group=group)
        ds_test = xr.open_dataset(BODY_UNCOMPR_FILEPATH, group=group)
        assert ds_res.equals(ds_test)






