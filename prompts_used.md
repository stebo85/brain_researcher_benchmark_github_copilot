Create markdown prompt files for each line in the BrainResearcherBenchmarkCSV in subdirectories, e.g. Data_Managment/DATA-001-Haxby/prompt.md - add all additional information from the table into the markdown files

Now write a bash script based on the prompt for DATA-001. The bash script performs the analysis on a custom github action runner using github actions. This custom action runner has neurodesk installed, so it can load software via "module load", e.g. module load fsl. You can also install python packages using pip. Download of open neuro datasets works via datalad (e.g. datalad install https://github.com/OpenNeuroDatasets/ds000105.git) which is also installed. The required evidence needs to be committed back to the github repository.

Create a bash file custom_runner_setup.sh with steps to setup the custom github action runner and set it up for mounting cvmfs containers from Neurodesk (https://neurodesk.org/getting-started/neurocontainers/cvmfs/), also install datalad.

generarlize the workflow file data-001.yml, so that it would run every run_analysis.sh file in every subdirectory. 

look at this run_analysis file again. Assume you have to install python packages yourself in a venv per analysis. Datalad and Neurodesk are installed ready to go.

fix: Searching for run_analysis.sh scripts...
Found 1 scripts:
 - ./Data_Management/DATA-001-Fetch-and-validate-BIDS-structure/run_analysis.sh
Error: Unable to process file command 'output' successfully.
Error: Invalid value. Matching delimiter not found ''EOF''



Now write bash scripts based on every prompt file for Data_Management. The bash script performs the analysis on a custom github action runner using github actions. This custom action runner has neurodesk installed, so it can load software via "module load", e.g. module load fsl. You can also install python packages using pip. Download of open neuro datasets works via datalad (e.g. datalad install https://github.com/OpenNeuroDatasets/ds000105.git) which is also installed. The required evidence needs to be committed back to the github repository.

-> The response hit the run limit

-> Trying again as github issue:
https://github.com/stebo85/brain_researcher_benchmark_github_copilot/issues/5

refactor runs: run each run_analysis.sh file in a separate github action job