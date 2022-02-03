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

import filecmp
import os
import pytest
import subprocess

import fcidecomp

SAMPLE_DATA = os.path.join(os.path.dirname(__file__), "sample_data")
BODY_COMPR_FILEPATH = os.path.join(SAMPLE_DATA, "compressed.nc")
BODY_UNCOMPR_FILEPATH = os.path.join(SAMPLE_DATA, "uncompressed.nc")
BANDS = [
    "ir_105", "ir_123", "ir_133", "ir_38", "ir_87", "ir_97",
    "nir_13", "nir_16", "nir_22",
    "vis_04", "vis_05", "vis_06", "vis_08", "vis_09",
    "wv_63", "wv_73"
]

@pytest.mark.skipif(not os.environ["HDF5_PLUGIN_PATH"], reason="requires HDF5_PLUGIN_PATH in env")
def test_decompression(tmpdir):

    uncompr_res_file = os.path.join(tmpdir, "uncompressed.nc")
    process = subprocess.run(
        f"nccopy -F none {BODY_COMPR_FILEPATH} {uncompr_res_file}", shell=True
    )

    for netcdf_file, txt_file in [
        (uncompr_res_file, 'body_res.txt'),
        (BODY_UNCOMPR_FILEPATH, 'body_test.txt')
    ]:
        if os.sys.platform == "win32":
            command = f"ncdump -g measured {netcdf_file.replace('\\', '\\\\')} > {os.path.join(tmpdir, txt_file)}"
        else:
            command = f"ncdump -g measured {netcdf_file} > {os.path.join(tmpdir, txt_file)}"
        process = subprocess.run(command, shell=True)

    assert filecmp.cmp(
        os.path.join(tmpdir, 'body_res.txt'),
        os.path.join(tmpdir, 'body_test.txt'),
        shallow=False
    )




