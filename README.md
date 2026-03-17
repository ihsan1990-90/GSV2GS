# GSV2GS
Grid-scale V2G simulator (KAUST)
Initial release, version 1.0

1. Required .csv files must be located in a folder named “input_data” located within the directory of the source-file (Matlab) / application (macOS) or .exe (windows)
2. Sample .csv input files are provided in the "input_data" folder within this repo
3. Information about the .csv input files' formats can be found in "input_formatting_guide.pdf" guide within this repo
4. Installers for Windows and intel based macOS devices are provided in the releases section
5. Allow the installer to download and install Matlab runtime library (2025 or newer) - requires internet connection
6. The installer will NOT install a copy of the input_files folder. The user must manually copy the folder to the directory (the supplied folder can be used as a starting point)
7. If matlab is already installed, the application may be run by running the "LEVIS_exported.m" script. The "input_data" folder and the two scripts "multi_cycle_func.m" and "simulation_main_func.m" must be in the same directory
