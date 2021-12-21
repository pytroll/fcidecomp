
:: get module to build, mode and following cmake options
@echo off
for /f "tokens=1-2*" %%a in ("%*") do (
    set module=%%a
    set mode=%%b
    set cmake_options=%%c
)
@echo on

:: If the FCICOMP_ROOT environment variable is not set, set the default one: the upper directory of this script
IF NOT DEFINED FCICOMP_COTS_ROOT (
    pushd %BASH_SOURCE%\..
    set FCICOMP_ROOT=%cd%
    popd
)

:: Define the build directory
set BUILD_DIR=%FCICOMP_ROOT%\build\%module%

:: Test only
if "%mode%"=="test" if exist %BUILD_DIR% (
    :: If the building directory already exists
    :: do not build but run the unit tests
    cd %BUILD_DIR%
    ctest --output-on-failure
    if errorlevel 1 (exit 1) else ( goto :end2 )
)

:: Check that the building folder does not already exists
if exist %BUILD_DIR% (
    echo "Remove the %BUILD_DIR% folder first!"
    exit 1
)
:: Create the building folder and move into it
if not exist %BUILD_DIR% (
    mkdir %BUILD_DIR%
    if errorlevel 1 (
        echo "Error: cannot create the building directory: %BUILD_DIR%."
        exit 1
    )
)
cd %BUILD_DIR%

:: Message
echo "Building %module% ..."
set modevalid=nn
if "%mode%"=="test" (
    set modevalid=yy
    :: Build in release mode with tests enable
    cmake -G "Ninja" %cmake_options% -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=ON %FCICOMP_ROOT%\%module%
	if errorlevel 1 (
        echo "Error configuring %module%."
        exit 1 
    )
    cmake --build .
	if errorlevel 1 (
        echo "Error building %module%."
        exit 1 
    )
    ctest --output-on-failure
    if errorlevel 1 (
        echo "Error during the test of %module%."
        exit 1
    )
)
if "%mode%"=="debug" (
    set modevalid=yy
    :: Build in debug mode
    cmake -G "Ninja" %cmake_options% -DCMAKE_BUILD_TYPE=Debug %FCICOMP_ROOT%\%module%
	if errorlevel 1 (
        echo "Error configuring %module%."
        exit 1 
    )
    cmake --build .
	if errorlevel 1 (
        echo "Error building %module%."
        exit 1 
    )
    ctest --output-on-failure
    if errorlevel 1 (
        echo "Error during the test of %module%."
        exit 1
    )
)
if "%mode%"=="memcheck" (
    set modevalid=yy
    :: Build in debug mode with test enable and memory check
    cmake -G "Ninja" %cmake_options% -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTING=ON -DMEMORY_CHECK=ON %FCICOMP_ROOT%\%module%
	if errorlevel 1 (
        echo "Error configuring %module%."
        exit 1 
    )
    cmake --build .
	if errorlevel 1 (
        echo "Error building %module%."
        exit 1 
    )
    ctest --output-on-failure  -T memcheck
    if errorlevel 1 (
        echo "Error during the test of %module%."
        exit 1
    )
)
if "%mode%"=="coverage" (
    set modevalid=yy
    :: Build in debug mode with test enable and test coverage
    cmake -G "Ninja" %cmake_options% -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTING=ON -DCOVERAGE_TESTING=ON %FCICOMP_ROOT%\%module%
	if errorlevel 1 (
        echo "Error configuring %module%."
        exit 1
    )
    cmake --build .
	if errorlevel 1 (
        echo "Error building %module%."
        exit 1
    )
    ctest --output-on-failure
    if errorlevel 1 (
        echo "Error during the test of %module%."
        exit 1
    )
    ctest -T coverage
    if errorlevel 1 (
        echo "Error during the test of %module%."
        exit 1
    )
)
if "%mode%"=="release" (
    set modevalid=yy
    :: Build in release mode
    echo cmake %cmake_options% -DCMAKE_BUILD_TYPE=Release %FCICOMP_ROOT%\%module%
    cmake -G "Ninja" %cmake_options% -DCMAKE_BUILD_TYPE=Release %FCICOMP_ROOT%\%module%
	if errorlevel 1 (
        echo "Error configuring %module%."
        exit 1
    )
    cmake --build .
	if errorlevel 1 (
        echo "Error building %module%."
        exit 1
    )
)
if "%modevalid%"=="nn" (
    echo "%BASH_SOURCE%: Unknown building mode: %mode%."
    rmdir /s/q "%BUILD_DIR%"
    exit 1
)

:end2