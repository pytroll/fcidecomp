
:: Get the module to build
set MODULE=%1

:: If the FCICOMP_ROOT environment variable is not set, set the default
:: one: the upper directory of this script
IF NOT DEFINED FCICOMP_COTS_ROOT (
    pushd %BASH_SOURCE%\..
    set FCICOMP_ROOT=%cd%
    popd
)

:: Define the build directory
set BUILD_DIR=%FCICOMP_ROOT%\build\%MODULE%

:: Move to the build directory
cd %BUILD_DIR%

echo Installing %MODULE% ...
:: Perform the install
cmake install .
if errorlevel 1 (
    echo "Error: cannot install %MODULE%."
    exit 1
)
:: Copy the install_manifest.txt file from the building directory to the install directory
rem Define the install_manifest.txt file
echo %BUILD_DIR%

set INSTALL_MANIFEST_FILE=%BUILD_DIR%\install_manifest.txt

if exist "%INSTALL_MANIFEST_FILE%" (
    :: Try to read the install_prefix in the CMakeCache.txt file
    set cmakecache_file=%BUILD_DIR%\CMakeCache.txt
    if exist "%cmakecache_file%" (
        :: Locate the CMAKE_INSTALL_PREFIX in the CMakeCache.txt file
        for /f "tokens=2 delims==" %%a in ('find "CMAKE_INSTALL_PREFIX:PATH=" "%cmakecache_file%"') do @set install_prefix=%%a
        if defined install_prefix (
	    :: Define the destination file and directory
	    set dest_dir=%install_prefix%\share\cmake
	    set dest=%dest_dir%\%MODULE%_install_manifest.txt
	    :: Create the destination directory if it does not exist
	    if not exist "%dest_dir%" (
	       echo "Creating directory %dest_dir%"
	       mkdir %dest_dir%
	    )
	    :: Append one line in the install_manifest.txt file
	    echo %dest%>>"%INSTALL_MANIFEST_FILE%"
	    :: Copy the install_manifest.txt file
	    echo "-- Copying: %INSTALL_MANIFEST_FILE% to %dest%"
	    copy /y %INSTALL_MANIFEST_FILE% %dest%
	)
    ) else (
	echo Error: Cannot find file: %cmakecache_file%.
    )
) else (
    echo "Warning: The file install_manifest.txt has not been found in the building directory %BUILD_DIR%."
)
