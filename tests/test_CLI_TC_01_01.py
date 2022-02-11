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

"""
This test checks that JPEG-LS compressed MTG FCI L1C products are correctly decompressed using the
netCDF4 tool `nccopy`
"""

import filecmp
import os
import pytest
import subprocess

import netCDF4 as nc

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


@pytest.mark.skipif(
    "HDF5_PLUGIN_PATH" not in os.environ.keys(), reason="requires HDF5_PLUGIN_PATH in env"
)
def test_decompression(tmpdir):

    uncompr_res_file = os.path.join(tmpdir, os.path.basename(BODY_UNCOMPR_FILEPATH))
    process = subprocess.run(
        f"nccopy -F none {BODY_COMPR_FILEPATH} {uncompr_res_file}", shell=True
    )

    for netcdf_file, txt_file in [
        (uncompr_res_file, 'body_res.txt'),
        (BODY_UNCOMPR_FILEPATH, 'body_test.txt')
    ]:
        command = f"ncdump -g measured -n decomp {netcdf_file} > {os.path.join(tmpdir, txt_file)}"
        process = subprocess.run(command, shell=True)

    assert filecmp.cmp(
        os.path.join(tmpdir, 'body_res.txt'),
        os.path.join(tmpdir, 'body_test.txt'),
        shallow=False
    )




