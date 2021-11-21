.. _test_specification_design:

Test Specification Design
~~~~~~~~~~~~~~~~~~~~~~~~~

Test Cases and Test Procedures
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Verification specifications in this document are designed at two levels:
test cases and test procedures.

**Test cases** are self-consistent test descriptions, which aim
at validating specific features or expected failures. In the design of
test cases, the following guidelines are considered:

-  streamline execution, i.e. avoid as much as possible the repetition
   of procedure steps across different test procedures;

-  validate the normal flow of operations before (dead-end) branches and
   response to errors.

Test cases are grouped in categories related to the feature, product or behaviour they
validate.

Each test case describes:

-  the input test data;

-  the reference output data, if applicable;

-  the pass/fail criteria the test case must satisfy to be considered as
   passed;

-  the specific test environment.

A **test procedure** contains the sequential list of operations
(“steps”) and the corresponding expected outputs, required to validate a
test case.

Test cases and test procedures are described in the :ref:`Verification & Verification Test Cases and Test Procedures
document <[FCIDECOMP_TP]>`.

The traceability between the test cases and the requirements which they
validate (see :ref:`FCIDECOMP_WP <[FCIDECOMP_WP]>`) is described in a
Verification Control Document (:ref:`FCIDECOMP_VCD <[FCIDECOMP_VCD]>`).

Traceability between test cases and test procedures is
ensured by the naming convention described in the following paragraph.


Identification of Test Cases and Test Procedures
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Test cases and test procedures are identified as follows.

- a test case is identified as FCIDECOMP.xxxx.TC.yy.zz, where:
  - `xxxx` is a category identifier (up to four characters)
  - `yy` is a two-digit progressive number within each category, to group test cases in homogeneous subcategories
  - zz being a two-digit progressive identifier within the subcategory.

- a test procedure for the test case FCIDECOMP.xxxx.TC.yy.zz is identified as FCIDECOMP.xxxx.TP.yy.zz.

Category identifiers are introduced in order to organize test cases in groups which may have e.g. common
pre-requisites, and to improve clarity and maintenance of the V&V plan.

The following categories are defined:

:CLI:
    Tests dealing with decompressing of FC1 L1c NRT data via a command line interface (VG1)

:PYTHON:
    Tests dealing with decompressing of FC1 L1c NRT data via python (VG2)

:JAVA:
    Tests dealing with decompressing of FC1 L1c NRT data via java (VG3)
