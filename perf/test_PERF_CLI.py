import os
import subprocess

import pytest

TEST_DATA_PATH = os.environ.get("EPCT_TEST_DATA_DIR", "")
INPUT_PATH = os.path.join(TEST_DATA_PATH, "MTG", "MTGFCIL1")
COMP_FILEPATH = [os.path.join(INPUT_PATH, file_name) for file_name in (
    "W_XX-EUMETSAT-Darmstadt_IMG+SAT_MTI1+FCI-1C-RRAD-FDHSI-FD--CHK-BODY--"
    "DIS-NC4E_C_EUMT_20200405000845_GTT_DEV_20200405000330_20200405000345_N_JLS_T_0001_0015.nc",
    "W_XX-EUMETSAT-Darmstadt_IMG+SAT_MTI1+FCI-1C-RRAD-FDHSI-FD--CHK-BODY--"
    "DIS-NC4E_C_EUMT_20200405120015_GTT_DEV_20200405115500_20200405115515_N_JLS_T_0072_0021.nc"
)]
DECOMP_FILEPATH = [os.path.join(INPUT_PATH, file_name) for file_name in (
    "W_XX-EUMETSAT-Darmstadt,IMG+SAT,MTI1+FCI-1C-RRAD-FDHSI-FD--CHK-BODY---"
    "NC4E_C_EUMT_20200405000845_GTT_DEV_20200405000330_20200405000345_N__T_0001_0015.nc",
    "W_XX-EUMETSAT-Darmstadt_IMG+SAT_MTI1+FCI-1C-RRAD-FDHSI-FD--CHK-BODY---"
    "NC4E_C_EUMT_20200405120015_GTT_DEV_20200405115500_20200405115515_N__T_0072_0021.nc"
)]


def cli_decompression(comp_file, decomp_file):

    process = subprocess.call(["nccopy", "-F", "none", comp_file, decomp_file])

    return process


@pytest.mark.skipif(
    "HDF5_PLUGIN_PATH" not in os.environ.keys(), reason="requires HDF5_PLUGIN_PATH in env"
)
@pytest.mark.parametrize(
    "test_input,test_output",
    [(test, exp) for (test, exp) in zip(COMP_FILEPATH, DECOMP_FILEPATH)],
    ids=[f"{os.path.getsize(comp_file) / (1024 * 1024):.2f} Mb" for comp_file in COMP_FILEPATH]
)
def test_decomp_cli(benchmark, tmpdir, test_input, test_output):

    decomp_res_file = os.path.join(tmpdir, os.path.basename(test_output))
    result = benchmark(cli_decompression, test_input, decomp_res_file)

    assert result == 0



