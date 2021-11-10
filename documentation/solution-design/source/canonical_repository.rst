Creation of canonical repository
--------------------------------

Introduction
~~~~~~~~~~~~

A canonical repository is established on the EUMETSAT GitLab service at https://gitlab.eumetsat.int/sepdssme/fcidecomp
for development purposes. Each time a new release is produced, the corresponding code is synchronized to the public
EUMETSAT Open Source repository at XXX [TODO: add reference].

.. _repository_initialization:

Repository initialization
~~~~~~~~~~~~~~~~~~~~~~~~~

:ref:`FCIDECOMP v1.0.2 <[FCIDECOMP_LATEST]>` is taken as blueprint for the development of the solution codebase.

The repository is put under configuration control. A new minor release adding README, BUILD, INSTALL, and LICENCE
files, starting the Changelog, codifying the use of semantic versioning for future versions and adding a standardised
build system is published.

Test suite
~~~~~~~~~~

An initial test suite (at least against nominal conditions) is implemented following the V&V strategy defined in
[TODO: add reference]. Most tests are implemented as automated tests against the Python interface.

Test data
~~~~~~~~~

A preliminary set of test data taken from the :ref:`MTG FCI L1C test data <[FCIDECOMP_TEST_DATA]>` is added to ensure a
consistent and permanent dataset to execute tests.