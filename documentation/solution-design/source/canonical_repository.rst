Creation of canonical repository
--------------------------------

The first step of the solution design consists in the creation of a single canonical repository, at EUMETSAT GitLab,
hosting the official version of the FCIDECOMP software. This repository will contain all the code necessary to build the
software and make it available as a HDF dynamically loaded filter.

Repository initialization
~~~~~~~~~~~~~~~~~~~~~~~~~

Initially, FCIDECOMP v1.0.2 (taken from :ref:`EUMETSAT sFTP repository <[FCIDECOMP_LATEST]>`) will be taken as blueprint
for the development of the solution codebase.

The repository will be put under configuration control. A new minor release adding README, BUILD, INSTALL, and LICENCE
files, starting the Changelog, codifying the use of semantic versioning for future versions and adding a standardised
build system will then be published.

Test suite
~~~~~~~~~~

An initial test suite (at least against nominal conditions) will be implemented following the V&V strategy defined in
[add reference]. As an initial proposal, we would implement most or all the tests as automated tests against the Python
interface.

Test data
~~~~~~~~~

A preliminary set of test data taken from the MTG FCI L1C test data will be added to ensure a consistent and permanent
dataset to execute tests.