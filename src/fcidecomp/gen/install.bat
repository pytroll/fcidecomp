@echo on
:: Get the module to build
SET MODULE=%1

:: If the FCICOMP_ROOT environment variable is not set, set the default one: the upper directory of this script
IF NOT DEFINED FCICOMP_COTS_ROOT (
    pushd %BASH_SOURCE%\..
    SET "FCICOMP_ROOT=%cd%"
    popd
)

:: Define the build directory
SET "BUILD_DIR=%FCICOMP_ROOT%\build\%MODULE%"

:: Move to the build directory
cd %BUILD_DIR%

echo "Installing %MODULE% ..."
:: Perform the install
CALL cmake --install . || goto :error

:: Copy the install_manifest.txt file from the building directory to the install directory
SET "INSTALL_MANIFEST=%BUILD_DIR%\install_manifest.txt"
SET "CMAKECACHE_FILE=%BUILD_DIR%\CMakeCache.txt"
echo manifest: "%INSTALL_MANIFEST%" , cmakecache: "%CMAKECACHE_FILE%"

IF NOT EXIST "%INSTALL_MANIFEST%" (
    echo Warning: The file install_manifest.txt has not been found in the building directory %BUILD_DIR%.
    goto :EOF
)
:: here exists the install manifest
IF NOT EXIST "%CMAKECACHE_FILE%" (
    echo Error: Cannot find file: %CMAKECACHE_FILE%.
	goto :error
)
:: here exists the cmake cache file
FOR /f "tokens=2 delims==" %%a IN ('find "CMAKE_INSTALL_PREFIX:PATH=" "%CMAKECACHE_FILE%"') DO @set cmakeinstallprefixraw=%%a

IF NOT DEFINED cmakeinstallprefixraw (
    echo Warning: Cannot copy the install_manifest.txt file to the install directory: Install directory is not known.
    goto :EOF
)
:: here cmakeinstallprefixraw is defined
SET "cmakeinstallprefix=%cmakeinstallprefixraw:/=\%"
SET "DESTDIR=%cmakeinstallprefix%\share\cmake"
SET "DEST=%DESTDIR%\%MODULE%_install_manifest.txt"
echo destdir: "%DESTDIR%", dest: "%DEST%"
IF NOT EXIST %DESTDIR% (
   echo Creating directory %DESTDIR%
   mkdir %DESTDIR%
)
echo %DEST%>>"%INSTALL_MANIFEST%"
echo -- Copying: %INSTALL_MANIFEST% to %DEST%
:: problems with '/' in the path taken from cmakecache file!
copy /y %INSTALL_MANIFEST% %DEST%

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
