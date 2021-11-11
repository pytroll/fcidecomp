.. _v&v_methods:

Verification and Validation Methods
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The following V&V methods are envisioned for the project:

-  *Inspection* (I): method using visual determination of
   physical characteristics (e.g., inspecting outputs with visualization tools).

-  *Analysis (A)*: method using analytical data or simulations under
   defined conditions to show theoretical compliance.

-  *Review of Design* (D): method using approved records or
   evidence that unambiguously show that the requirement is met, e.g.
   design documents.

-  *Test* (T): An action by which the operability, supportability, or
   performance capability of an item is verified and validated when subjected to
   controlled conditions that are real or simulated.


Review of Design Execution and Reporting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Review of design is executed during documentation reviews.
Anomalies are recorded as RIDs, which are tracked as issued in the project
space on EUMETSAT GitLab.

The successful closure of all the RIDs corresponds to the success of the verification
activity, which is then recorded in a minute of meeting.


Analysis Execution and Reporting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Analysis is used to measure the compliance with :ref:`quality metrics <[TSSQA]>`.

For the following metrics:

- Minimum comment density
- Maximum level of nested blocks
- Maximum file code length
- Maximum function code length
- Maximum parameter number
- Maximum number of return statements
- Maximum boolean expression complexity
- Maximum cyclomatic complexity
- Maximum number of methods per class

the measurement is performed as a step in the automated GitLab CI pipelines using standard industry tools,
in a similar fashion as for the assessment of quality for the :ref:`Data Tailor <[DATATAILOR]>`.
The associated report is directly viewable in GitLab and can be downloaded as a JSON file for the records.

As the Data Tailor plugin will be developed using a functional programming paradigm, the maximum depth
of the inheritance tree does not need to be measured.


Inspection and Test Execution and Reporting
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Planning
""""""""

Requirements in :ref:`[FCIDECOMP_WP] <[FCIDECOMP_WP]>` which are verified by test
are addressed during a dedicated test campaign
which typically follows the TRR/TRB process described in :ref:`[OPSTRR] <[OPSTRR]>`.

A Test Plan (:ref:`[FCIDECOMP_VP] <[FCIDECOMP_VP]>`) will be devised to identify which tests
will be executed in various stages of validation. Test sessions will be
executed at the foreseen check-points detailed in section `Strategy` of the
:ref:`Execution Plan <[FCIDECOMP_EXECPLAN]>`.

The full set of tests to meet the goals in section :ref:`v&v_goals` will be
delivered with the final project milestone.

Two execution approaches are envisioned: automatic and manual.


Automated Tests
"""""""""""""""

Automated tests provide a repeatable and fast verification tool
to verify compliance of the Data Cube against the requirements.

As the code is predominantly written in Python, the `pytest` testing framework is used.

Such tests are executed in the `test` step of continuous integration pipelines triggered from
within the project GitLab repository. This ensures testing repeatability.

Automated tests will be executed on a set of test data, one per each type of input products
(i.e. one per each entry in Table 5.1 in the :ref:`Methods Document <[PSDC_METHODS]>`),
stored in a location reachable from the pipelines.

On each pipeline, the Data Tailor is initially installed, together with its Data Cube plugin.
The test data is subsequently customized and resulting output analysed.

The procedure also ensures that the plugin code is implicitly validated throughout the process,
although this is not explicitly stated as a requirement.

The following table lists the test types, their scope and the event which triggers them.

.. list-table:: Automated test types and triggers.
    :header-rows: 1
    :widths: 10 15 14 11 50

    *   - Type
        - Scope
        - Position in the source code
        - Event
        - Notes
    *   - Low-level unit tests
        - Used internally by the development team to validate integration of the Data Tailor plugin.
          Also used to measure test coverage.
        - :code:`tests` in each package root folder
        - At each commit into the repository
        - \-
    *   - Validation tests
        - Tests used for the validation of the Data Cube.
        - In the root folder of the PSDC source code, in folder :code:`validation-tests`
        - At each code revision tag
        - The folder contains one file for each test procedure.
          Files are named :code:`test_<category>_TP_<subgroup>_<progressive_id>`,
          to allow the traceability to the corresponding test case (see
          :ref:`test_specification_design` for test case identification).
          Validation tests need the test data package to be downloaded on the runner machine.
    *   - Validation regression tests
        - Tests used to prevent from future regressions in validation tests.
        - In the root folder of the PSDC source code, in folder :code:`validation-tests`
        - On merge requests.
        - Regression tests are a subset of validation tests; they are marked with the
          :code:`@pytest.mark.regression` decorator inside test files.
          Regression tests need the test data package to be downloaded on the runner machine.


The reports for automated tests are accessed directly in GitLab, in the section "CI/CI->Pipelines",
clicking on the pipeline identifier, then on the "Tests" section.

They can be downloaded as Junit XML files as
artifacts from the "Artifacts" section of the test job ("CI/CI->Pipelines",
clicking on the pipeline identifier, then on "Jobs"), to be attached to test reports if needed.

Automated tests are used for the V&V of:

- TBD

.. note:: Performance is not measured in specific tests; rather, the execution time
  of tests is recorded at each test session in the test reports.

Individual automated tests can also be launched manually from the command line.
This allows in particular to access the
generated products, to validate them manually.


Manual Validation Tests and Inspection
""""""""""""""""""""""""""""""""""""""

Manual tests are conducted by executing the test procedure steps in a test case
in sequence, verifying the resulting behaviour with respect to the expected one for each step.

Inspection of the system or of the test results is also included in some test steps.

The outcome of each test is written in the test report.

Manual validation tests need the validation test data package.

We expect to use manual tests for the validation of:

- TBD

.. note:: Performance is not measured in specific tests; rather, the execution time
  of tests is recorded at each test session in the test reports.


Test Outcomes
^^^^^^^^^^^^^

The possible outcomes of a test procedure are classified as follows:

-  *passed*: the outcome of the test or of a procedure step conforms to
   the expected result.

-  *passed with limitations*:

   -  either the outcome conforms to the expected result, but some
      relevant observation has been made;

   -  or there is a minor discrepancy between expected and observed
      outcome, which does not however invalidate the test.

-  *failed*: the test or the test step have not produced the expected
   behaviour, and the discrepancy is significant. The test is considered
   "failed". However, the failure is not such to block the execution of
   the remaining tests.

-  *critically failed*: the test or the procedure step have failed; the
   test is considered failed, and failure is such to block the execution
   of the remaining tests.


Test Reports
^^^^^^^^^^^^^

A **test report** will detail:

-  the date of the execution of the tests

-  participants

-  software version under test

-  the objective of the tests

-  the overall outcome of the tests

-  for each test, its outcome and major observations resulting
   from the execution, if any

-  optionally, notes and comments.
