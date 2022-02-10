Automatic Tests of Input Data Retrieval, Customisation, Output Data CDM and CF Compliance (ACDC.TC.01)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section presents the automatic validation tests launched
on a pipeline on EUMETSAT's Gitlab CI/CD,
on a machine provided by EUMETSAT with CentOS 7 platform,
with the `epct_plugin_acdc` plugin and Data Tailor installed.

Each test comprises a series of subtests which validate the capability to retrieve the respective
products, customise them, and verify compliance of the generated outputs against
the :ref:`Common Data Model of the CDS <[CDS]>` and :ref:`CF convetions <[CF_STN]>`.

ACDC.TC.01.GOME2: Tests on GOME2 products
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

GOME2_METOPA_AAI product
--------------------------
.. automodule:: test_TC_01_GOME2_METOPA_AAI
    :members:
    :undoc-members:
    :show-inheritance:

GOME2_METOPA_HCHO product
--------------------------------------------------
.. automodule:: test_TC_01_GOME2_METOPA_HCHO
    :members:
    :undoc-members:
    :show-inheritance:

GOME2_METOPA_NO2 product
-------------------------------------------------
.. automodule:: test_TC_01_GOME2_METOPA_NO2
    :members:
    :undoc-members:
    :show-inheritance:

GOME2_METOPB_AAI product
---------------------------------------------------
.. automodule:: test_TC_01_GOME2_METOPB_AAI
    :members:
    :undoc-members:
    :show-inheritance:

GOME2_METOPB_HCHO product
------------------------------------------------
.. automodule:: test_TC_01_GOME2_METOPB_HCHO
    :members:
    :undoc-members:
    :show-inheritance:

GOME2_METOPB_NO2 product
--------------------------------------------------
.. automodule:: test_TC_01_GOME2_METOPB_NO2
    :members:
    :undoc-members:
    :show-inheritance:

GOME2_METOPB_NO2_ASCII product
-------------------------------------------------
.. automodule:: test_TC_01_GOME2_METOPB_NO2_ASCII
    :members:
    :undoc-members:
    :show-inheritance:

GOME2_METOPC_AAI product
---------------------------------------------------
.. automodule:: test_TC_01_GOME2_METOPC_AAI
    :members:
    :undoc-members:
    :show-inheritance:


ACDC.TC.01.IASIL3: Tests on IASIL3 products
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

IASIL3_METOPA_CO product
------------------------------------------------
.. automodule:: test_TC_01_IASIL3_METOPA_CO
    :members:
    :undoc-members:
    :show-inheritance:

IASIL3_METOPA_HCOOH product
--------------------------------------------------
.. automodule:: test_TC_01_IASIL3_METOPA_HCOOH
    :members:
    :undoc-members:
    :show-inheritance:

IASIL3_METOPA_NH3 product
-------------------------------------------------
.. automodule:: test_TC_01_IASIL3_METOPA_NH3
    :members:
    :undoc-members:
    :show-inheritance:

IASIL3_METOPB_CO product
---------------------------------------------------
.. automodule:: test_TC_01_IASIL3_METOPB_CO
    :members:
    :undoc-members:
    :show-inheritance:

IASIL3_METOPB_HCOOH product
-----------------------------
.. automodule:: test_TC_01_IASIL3_METOPB_HCOOH
    :members:
    :undoc-members:
    :show-inheritance:

IASIL3_METOPB_NH3 product
------------------------------
.. automodule:: test_TC_01_IASIL3_METOPB_NH3
    :members:
    :undoc-members:
    :show-inheritance:

IASIL3_METOPC_CO product
---------------------------
.. automodule:: test_TC_01_IASIL3_METOPC_CO
    :members:
    :undoc-members:
    :show-inheritance:

IASIL3_METOPC_HCOOH product
----------------------------
.. automodule:: test_TC_01_IASIL3_METOPC_HCOOH
    :members:
    :undoc-members:
    :show-inheritance:

IASIL3_METOPC_NH3 product
---------------------------
.. automodule:: test_TC_01_IASIL3_METOPC_NH3
    :members:
    :undoc-members:
    :show-inheritance:


ACDC.TC.01.TROPOMI: Tests on TROPOMI dataset
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. automodule:: test_TC_01_TROPOMI_5SP_NO2
    :members:
    :undoc-members:
    :show-inheritance:

Additional Test on Downloading Missing Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. automodule:: test_TC_01_download_missing_data
    :members:
    :undoc-members:
    :show-inheritance:
