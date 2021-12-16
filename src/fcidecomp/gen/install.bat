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
echo "Define the install_manifest.txt file..."
SET "INSTALL_MANIFEST=%BUILD_DIR%\install_manifest.txt"

IF EXIST "%INSTALL_MANIFEST%" (
    REM Try to read the install_prefix in the CMakeCache.txt file
    SET "CMAKECACHE_FILE=%BUILD_DIR%\CMakeCache.txt"
    IF EXIST "%CMAKECACHE_FILE%" (
        REM Locate the CMAKE_INSTALL_PREFIX in the CMakeCache.txt file
        FOR /f "tokens=2 delims==" %%a IN ('find "CMAKE_INSTALL_PREFIX:PATH=" "%CMAKECACHE_FILE%"') DO
            @set INSTALL_PREFIX=%%a
    ) ELSE (
	    echo Error: Cannot find file: %CMAKECACHE_FILE%.
	    goto :error
    )
	IF DEFINED INSTALL_PREFIX (
	    REM Define the destination file and directory
	    SET "DESTDIR=%INSTALL_PREFIX%\share\cmake"
	    set "DEST=%DESTDIR%\%MODULE%_install_manifest.txt"
	    REM Create the destination directory if it does not exist
	    IF NOT EXIST %DESTDIR% (
	       echo Creating directory %DESTDIR%
	       mkdir %DESTDIR%
	    )
	    REM Append one line in the install_manifest.txt file
	    echo %DEST%>>"%INSTALL_MANIFEST%"
	    REM Copy the install_manifest.txt file
	    echo -- Copying: %INSTALL_MANIFEST% to %DEST%
	    copy /y %INSTALL_MANIFEST% %DEST%
	) ELSE (
	    echo Warning: Cannot copy the install_manifest.txt file to the install directory: Install directory is not known.
    )
) ELSE (
	echo Warning: The file install_manifest.txt has not been found in the building directory %BUILD_DIR%.
)

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
