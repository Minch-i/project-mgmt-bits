@echo off
setlocal

echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo Create project folder and populate with approrpiate folders
echo Authored by Minch ^| github.com/Minch-i ^| ^@Minch_me twitter
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

REM Store the current directory path in a variable, as instructed this should be the "Projects" folder
set "defaultDirectory=%CD%"

REM Check last 14 characters of path
set "pathChecker=%defaultDirectory:~-14%"
echo Checking current directory

if "%pathChecker%"==".projectsAdmin" (
    echo Pushing to parent directory
    pushd ..
)
    
set defaultDirectory=%CD%
echo Current Directory: %defaultDirectory%
echo.

REM Enter project details
set /p projectTag=Enter project tag (make it short, letters and/or numbers, capatilised):
set /p projectTitle=Enter project title:
set /p projectAuthor=Enter project Author/s (lastName, intial): 
set /p startDate=Enter start date (YYMM):

:chooseProjectType
echo Enter project type (R-Research, C-Creative, O-Other):
set /p projectType=

REM Check the input against valid choices
if /i "%projectType:~0,1%"=="R" (
    set "projectType=Research"
) else if /i "%projectType:~0,1%"=="C" (
    set "projectType=Creative"
) else if /i "%projectType:~0,1%"=="O" (
    set "projectType=Other"
) else (
    goto chooseProjectType
)

REM Display the selected project type
echo Selected project type: %projectType%

set /p projectDescription=Enter short description about the project:
echo.

REM Create projectsAdmin folder for easy management going forward
mkdir "%defaultDirectory%\.projectsAdmin"

set folderName=%startDate%_%projectTag%
mkdir "%folderName%\01_Admin"
mkdir "%folderName%\02_Research"
mkdir "%folderName%\03_Work"
mkdir "%folderName%\03_Work\Data"
mkdir "%folderName%\04_Outputs"

cd .\%folderName%

REM Extract year and month from startDate
set "year=20%startDate:~0,2%"
set "month=%startDate:~2,2%"

rem Map the numeric month to the corresponding month name
if %month% equ 01 set "monthName=January"
if %month% equ 02 set "monthName=February"
if %month% equ 03 set "monthName=March"
if %month% equ 04 set "monthName=April"
if %month% equ 05 set "monthName=May"
if %month% equ 06 set "monthName=June"
if %month% equ 07 set "monthName=July"
if %month% equ 08 set "monthName=August"
if %month% equ 09 set "monthName=September"
if %month% equ 10 set "monthName=October"
if %month% equ 11 set "monthName=November"
if %month% equ 12 set "monthName=December"

REM create README.txt file for project
echo Project Title: %projectTitle% >> "01_Admin\README.txt"
echo Project Author(s): %projectAuthor% >> "01_Admin\README.txt"
echo Start Date: %monthName% %year% >> "01_Admin\README.txt"
echo Project Tag: %projectTag% > "01_Admin\README.txt"
echo Project Type: %projectType% >> "01_Admin\README.txt"
echo Description: %projectDescription% >> "01_Admin\README.txt"
echo Created project README.txt file

REM Move program/language specific templates
move "%defaultDirectory%\rTemplate.bat" "%defaultDirectory%\.projectsAdmin\rTemplate.bat" 
move "%defaultDirectory%\namingConventions.txt" "%defaultDirectory%\.projectsAdmin\namingConventions.txt" 
move "%defaultDirectory%\README.txt" "%defaultDirectory%\.projectsAdmin\README.txt"

REM Copy Template for creating R projects
copy "%defaultDirectory%\.projectsAdmin\rTemplate.bat" ".\03_Work\rTemplate.bat"

REM Last step, move the create projects batch file to projectsAdmin folder for future application.
move "%defaultDirectory%\createProject.bat" "%defaultDirectory%\.projectsAdmin\createProject.bat"

echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo Project folder created and process complete!
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
endlocal
pause