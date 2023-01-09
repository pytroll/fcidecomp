# Copyright 2021-2023, European Organisation for the Exploitation of Meteorological Satellites (EUMETSAT)
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
#
# Changelog
All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2023-01-09

### Added
- Inventory items
- Restructured FCIDECOMP software source code, for compilation in Linux and Windows (32/64-bit) environments
- Python package, to allow for the use of the FCIDECOMP decompression filter within Python
- Conda package build system including both the bare FCIDECOMP software and the associated Python package, supporting 
  Linux and Windows (32/64-bit) environments and Python versions 3.7 to 3.9 (extremes included)
- Automatic tests based on `pytest`
- Performance tests based on `pytest` and `pytest-benchmark`
- Instructions to build and install the software from the source code (Ubuntu 20.04 and RockyLinux 8) 

### Changed
- Adopts Apache License Version 2.0 for FCIDECOMP source code
- Update CharLS library from 1.0 to 2.1.0
