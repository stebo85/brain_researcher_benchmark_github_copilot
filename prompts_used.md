Create markdown prompt files for each line in the BrainResearcherBenchmarkCSV in subdirectories, e.g. Data_Managment/DATA-001-Haxby/prompt.md - add all additional information from the table into the markdown files

Now write a bash script based on the prompt for DATA-001. The bash script performs the analysis on a custom github action runner using github actions. This custom action runner has neurodesk installed, so it can load software via "module load", e.g. module load fsl. You can also install python packages using pip. Download of open neuro datasets works via datalad (e.g. datalad install https://github.com/OpenNeuroDatasets/ds000105.git) which is also installed. The required evidence needs to be committed back to the github repository.

Create a bash file custom_runner_setup.sh with steps to setup the custom github action runner and set it up for mounting cvmfs containers from Neurodesk (https://neurodesk.org/getting-started/neurocontainers/cvmfs/), also install datalad.

generarlize the workflow file data-001.yml, so that it would run every run_analysis.sh file in every subdirectory. 