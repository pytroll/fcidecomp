@echo ON
setlocal enabledelayedexpansion

set PATH_TO_DELIVERY=%cd%
set FCIDECOMP_BUILD_PATH=%PATH_TO_DELIVERY%\build
if not exist "%FCIDECOMP_BUILD_PATH%" mkdir "%FCIDECOMP_BUILD_PATH%"
cd %FCIDECOMP_BUILD_PATH%


rem Install CharLS
cmake -LAH -G "Ninja"                                                     ^
    -DCMAKE_BUILD_TYPE="Release"                                          ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%                               ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%                                  ^
    -DOPENCV_BIN_INSTALL_PATH=bin                                         ^
    -DOPENCV_LIB_INSTALL_PATH=lib                                         ^
    -DBUILD_SHARED_LIBS=1                                                 ^
    -DCHARLS_BUILD_TESTS=1                                                ^
    -DCHARLS_BUILD_SAMPLES=0                                              ^
    -DCHARLS_INSTALL=1                                                    ^
    ..

cmake --build . --target install --config Release
if errorlevel 1 exit 1

rem Build FCIDECMP
xcopy /E %PATH_TO_DELIVERY%\fcidecomp\* %FCIDECOMP_BUILD_PATH%

rem Build fcicomp-jpegls
call gen\build.bat fcicomp-jpegls release                                 ^
    -DCMAKE_PREFIX_PATH=%CONDA_PREFIX%                                    ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%                               ^
    -DCHARLS_ROOT=%CONDA_PREFIX%                                          ^
    -DCMAKE_INCLUDE_PATH=%SRC_DIR%\src
if errorlevel 1 exit 1

call gen\build.bat fcicomp-jpegls test
if errorlevel 1 exit 1

@echo off
goto :end

call gen\install.bat fcicomp-jpegls
if errorlevel 1 exit 1

rem Build fcicomp-H5Zjpegls
call gen\build.bat fcicomp-H5Zjpegls release                              ^
    -DCMAKE_PREFIX_PATH=${CONDA_PREFIX}                                   ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%
if errorlevel 1 exit 1

:: Fails
:: ./gen/build.sh fcicomp-H5Zjpegls test
call gen\install.bat fcicomp-H5Zjpegls
if errorlevel 1 exit 1

:end