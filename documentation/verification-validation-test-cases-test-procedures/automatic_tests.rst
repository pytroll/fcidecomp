.. _automatic_tests:

Automatic Tests: Decompression via Command Line Tools and via Python
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section presents the automatic validation tests for the FCIDECOPM Software.
These tests are run on a pipeline on EUMETSAT's Gitlab CI/CD,
on machines provided by EUMETSAT with CentOS 7, Windows 64-bit and Windows 32-bit,
with the `fcidecomp` software installed.

The tests can also be run on a local machine, provided:

- a clone of the `FCIDECOMP Software Gitlab repository <FCIDECOMP>`_ is present on the machine
- Test data hosted at `<[TEST_DATA]>`_ are present on the machine, and placed in a directory bearing the structure
  ``<EPCT_TEST_DATA_DIR>/MTG/MTGFCIL1``
- The environment variable ``EPCT_TEST_DATA`` is set the path of ``<EPCT_TEST_DATA_DIR>``
- pre-requisites described at :ref:`reference_platform` are satisfied

Once the above requirements are satisfied, automatic tests can be run executing the following command from the root
directory of the FICDECOMP Software repository:

``pytest -vv``



FCIDECOMP.CLI.TC.01.01: Test on decompression via command line tools
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. automodule:: test_CLI_TC_01_01
    :members:
    :undoc-members:
    :show-inheritance:

FCIDECOMP.PY.TC.01.01: Test on decompression via Python
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. automodule:: test_PY_TC_01_01
    :members:
    :undoc-members:
    :show-inheritance:
