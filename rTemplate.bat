REM Template for creating R projects 
@echo off 
mkdir "R" 
mkdir ".\Images"

echo # Please run the R programs in order > "03_Work\integrate.r" 
echo source("./R/loadData.R") >> "03_Work\integrate.r" 
REM Template for creating R projects 

@echo off

REM Get the current directory
set "currentDir=%cd%"

REM Get the parent of the parent directory name
for %%I in ("%cd%\..") do set "grandParentDir=%%~nxI"

REM Create the text file
@echo off
(
echo Version: 1.0
echo.
echo RestoreWorkspace: Default
echo SaveWorkspace: Default
echo AlwaysSaveHistory: Default
echo.
echo EnableCodeIndexing: Yes
echo UseSpacesForTab: Yes
echo NumSpacesForTab: 2
echo Encoding: UTF-8
echo.
echo RnwWeave: Sweave
echo LaTeX: pdfLaTeX
) > "%currentDir%\%grandParentDir%.Rproj"
