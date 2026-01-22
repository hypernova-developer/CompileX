@echo off
setlocal enabledelayedexpansion

:: --- SMART PATH LOCK ---
set "BASE_DIR=%~dp0"

:: Load CompileX Config
if exist "%BASE_DIR%compilex_config.bat" (
    call "%BASE_DIR%compilex_config.bat"
) else (
    echo [CompileX] Critical Error: compilex_config.bat not found in %BASE_DIR%
    exit /b 1
)

:: --- ARGUMENT HANDLING ---
if "%~1" == "" goto :no_file
if /I "%~1" == "--version" goto :show_version
if /I "%~1" == "--help" goto :show_help
if /I "%~1" == "--clean" goto :do_clean
if /I "%~1" == "--log" goto :show_log

:: --- PREPARE VARIABLES ---
set "filename=%~1"
set "extension=%~x1"
set "exe_name=%~n1.exe"

:: --- LANGUAGE DETECTION ---
if /I "!extension!" == ".cpp" goto :lang_cpp
if /I "!extension!" == ".c" goto :lang_c
if /I "!extension!" == ".f90" goto :lang_f90
if /I "!extension!" == ".cs" goto :lang_cs

:lang_unknown
echo [CompileX] Error: Extension [!extension!] is not supported.
exit /b 1

:lang_cpp
set "COMPILER=%GXX_PATH%"
:: Performance Flags: -O3 (Optimization), -s (Strip symbols)
set "FLAGS=-std=c++23 -O3 -s -I"%SYNTAX_INCLUDE%" -o "!exe_name!""
set "LANG=C++"
goto :start_compilation

:lang_c
set "COMPILER=%GCC_PATH%"
set "FLAGS=-O3 -s -I"%SYNTAX_INCLUDE%" -o "!exe_name!""
set "LANG=C"
goto :start_compilation

:lang_f90
set "COMPILER=%GFORTRAN_PATH%"
set "FLAGS=-O3 -o "!exe_name!""
set "LANG=Fortran"
goto :start_compilation

:lang_cs
set "COMPILER=%CSC_PATH%"
set "FLAGS=/nologo /optimize+ /out:"!exe_name!""
set "LANG=C#"
goto :start_compilation

:start_compilation
echo [CompileX] Compiling !filename! (!LANG!)...

:: --- EXECUTE COMPILER ---
"!COMPILER!" !FLAGS! "!filename!"

:: Capture status
set "comp_status=!errorlevel!"

if !comp_status! equ 0 (
    echo ---------------------------------------------------
    echo [CompileX] Success: Build complete.
    
    :: Track for cleaning
    findstr /x "!exe_name!" .compilex_built >nul 2>&1
    if errorlevel 1 echo !exe_name! >> .compilex_built
    
    :: Log operation
    echo [%date% %time%] Compiled !exe_name! (!LANG!) >> compilex_history.log
    
    echo [CompileX] Executing binary...
    echo ---------------------------------------------------
    
    if exist "!exe_name!" "!exe_name!"
    exit /b 0
) else (
    echo.
    echo [CompileX] Error: Compilation failed. Check syntax.
    echo [%date% %time%] Failed to compile !filename! >> compilex_history.log
    exit /b 1
)

:: --- COMMAND HANDLERS ---

:show_version
echo ---------------------------------------------------
echo [CompileX Engine]
echo Version: 1.0.0 "Pure Performance Edition"
echo Developer: hypernova-developer
echo Focus: Raw Power, Speed and Minimalist Execution
echo ---------------------------------------------------
exit /b 0

:show_help
echo [CompileX] Usage: compilex filename.ext
echo Flags: --clean, --log, --version, --help
exit /b 0

:do_clean
echo [CompileX] Initializing targeted cleanup...
if exist ".compilex_built" (
    for /f "usebackq tokens=*" %%a in (".compilex_built") do (
        if exist "%%a" (
            del /q "%%a"
            echo [CompileX] Deleted: %%a
        )
    )
    del /q .compilex_built
    echo [CompileX] Cleanup finished.
) else (
    echo [CompileX] No build artifacts found.
)
exit /b 0

:show_log
echo [CompileX] Operation History:
echo ---------------------------------------------------
if exist "compilex_history.log" (
    type "compilex_history.log"
) else (
    echo [CompileX] Log file is empty.
)
echo ---------------------------------------------------
exit /b 0

:no_file
echo [CompileX] Error: No input file specified.
exit /b 1