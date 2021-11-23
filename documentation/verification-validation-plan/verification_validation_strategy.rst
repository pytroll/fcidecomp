.. _v&v_strategy:

V&V Strategy
-------------

Introduction
^^^^^^^^^^^^

This section describes the V&V strategies devised to meet the goals. V&V methods referred in the
text are described in section :ref:`v&v_methods`.

As a general rule, for both validation and verification, tests are the method of choice, if applicable,
and automated tests are preferred to manual tests.

All test procedures are organized and designed to test functionalities so that they are reasonably
achieved on all the applicable platforms (MTG user stations that match the approved baseline). In case of
Python (VG2) and Java (VG3) the test procedures are actually executed to a restricted set of platforms,
delegating the requirement matching to the cross-platform nature of these programming languages.


Decompression of FC1 L1c NRT data via command line (VG1)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Decompression of FC1 L1c NRT data via command line is automatically tested.

Decompression of FC1 L1c NRT data via Python (VG2)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Decompression of FC1 L1c NRT data via Python is automatically tested.

Decompression of FC1 L1c NRT data via Java (VG3)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Decompression of FC1 L1c NRT data via Java is tested manually.

Decompression of FC1 L1c NRT data via the Data Tailor software (VG4)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Decompression of FC1 L1c NRT data via the Data Tailor software is tested manually.


Package licensed as free and open source software (VG5)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The FCIDECOMP software licensed as free and open source software is tested by code inspection.
