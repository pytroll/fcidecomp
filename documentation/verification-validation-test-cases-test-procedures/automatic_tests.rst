.. _automatic_tests:

Automatic Tests: Decompression via Command Line Tools and via Python
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section presents the automatic validation tests for the FCIDECOMP Software.
These tests are run on a CI/CD pipeline on EUMETSAT's Gitlab instance,
on machines provided by EUMETSAT with CentOS 7 64-bit (run in Docker container), Windows 10 64-bit and
Windows 10 32-bit,
with all requirements described in :ref:`reference_platform` satisfied.

The tests can also be run on a local machine, provided:

- a clone of the :ref:`FCIDECOMP Software Gitlab repository <[FCIDECOMP]>` is present on the machine
- Test data hosted at :ref:`[TEST_DATA] <[TEST_DATA]>` are present on the machine at the path
  ``$EPCT_TEST_DATA_DIR/MTG/MTGFCIL1``
- The environment variable ``EPCT_TEST_DATA`` is set the path of ``$EPCT_TEST_DATA_DIR``
- pre-requisites described at :ref:`reference_platform` are satisfied

Once the above requirements are satisfied, automatic tests can be run executing the following command from the root
directory of the FICDECOMP Software repository:

``pytest -vv``

:Note: The test case descriptions of the automated tests are extracted from the test files themselves.


FCIDECOMP.CLI.TC.01.01: decompression via command line tools
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. automodule:: test_CLI_TC_01_01
    :members:
    :undoc-members:
    :show-inheritance:

FCIDECOMP.PY.TC.01.01: decompression via Python
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. automodule:: test_PY_TC_01_01
    :members:
    :undoc-members:
    :show-inheritance:
