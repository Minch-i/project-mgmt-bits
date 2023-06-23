# project-mgmt-bits
Here I want to upload tools to create and better manage projects. The intial idea is to automate project folder creation, and to make naming conventions consistent across projects. 

##The Projects Folder convention
From my research into folder management conventions, I've resulted in a concise approach that allows for flexibility to address projects of different natures. Here I'll explain my convention:

**Parent directory:**
_.\Projects_ | A place to house all projects, Research, Creative, or Other projects (soon to come, there will be different layouts depending on which opition you choose). 

**Subdirectories:**
_\01_Admin_ | Where you can store briefing documents, contracts, proposals, budgets, and any other components associated with the administration of the project. 
_\02_Research_ | For research materials, relevant literature, comparable or appropriate methodologies, moodboards, etc.
_\03_Work_ | A folder for all active components that convert materials into outputs, this includes data, program scripts, and drafted materials.
_\04_Outputs_ | A folder for deliverable items or outputs of the project, i.e., the final elements, reports, and publishable content.

##Instructions for _createProjects.bat_
1. Create a "Projects" folder in which ever directory you prefer, i.e., _C:\Users\Minch\Projects_
2. Download and move _createProjects.bat_ file and which ever program templates you are interested in (e.g., rTemplate.bat) to "_Projects_" directory
3. Click to operate the _createProjects.bat_ file and follow the cmd prompts
NOTE: the files you pasted in "Projects" will be moved to a new directory _.\Projects\.projectsAdmin_. In the future, you can run the _createProjects.bat_ from there with no difference in operation.

##Instructions for _rTemplate.bat_
1. Use _createProjects.bat_ to set up project folder structure
2. Navigate to _.\Projects\%folderName%\03_Work_ and click to operate the _rTemplate.bat_ file.
