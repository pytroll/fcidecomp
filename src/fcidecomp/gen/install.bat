
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

echo
echo "Installing %MODULE% ..."
:: Perform the install
call make install
if errorlevel 1 (
    echo "Error: cannot install %MODULE%."
    exit 1
)
:: Copy the install_manifest.txt file from the building directory to the install directory
:: Define the install_manifest.txt file
set install_manifest_file=%BUILD_DIR%\install_manifest.txt
if exist "%install_manifest_file%" (
    :: Try to read the install_prefix in the CMakeCache.txt file
    cmakecache_file=%BUILD_DIR%\CMakeCache.txt
    if exist "%cmakecache_file%" (
        :: Locate the CMAKE_INSTALL_PREFIX in the CMakeCache.txt file
        for /f "tokens=2 delims==" %%a in ('find "CMAKE_INSTALL_PREFIX:PATH=" "%cmakecache_file%"') do @set install_prefix=%%a
    ) else (
	    echo "Error: Cannot find file: %cmakecache_file%."
    )
	if defined install_prefix (

	    :: Define the destination file and directory
	    set dest_dir=%install_prefix%\share\cmake
	    set dest=%dest_dir%\%MODULE%_install_manifest.txt
	    :: Create the destination directory if it does not exist
	    if not exist %dest_dir% (
	       echo "Creating directory %dest_dir%"
	       mkdir %dest_dir%
	    )

	    :: Append one line in the install_manifest.txt file
	    echo %dest%>>"%install_manifest_file%"

	    :: Copy the install_manifest.txt file
	    echo "-- Copying: %install_manifest_file% to %dest%"
	    copy /y %install_manifest_file% %dest%
	) else (
	    echo "Warning: Cannot copy the install_manifest.txt file to the install directory: Install directory is not known."

) else (
	echo "Warning: The file install_manifest.txt has not been found in the building directory %BUILD_DIR%."
