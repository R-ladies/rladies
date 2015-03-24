##R ladies meetup

#Getting started with the Shiny app

Download datasets from https://www.its-rde.net/showdf?dataSetNumber=10146

1. BusLocations_Oct.csv
2. BusStops.csv

Start with clean.R which loads the data, cleans it, then writes the clean data to csv.

Your shiny app will use 3 files

1. global.R
2. ui.R
3. server.R

#global.R
Load libraries, data, and perfom any final data manipulation

#ui.R
Describe the user interface with side and main panels

#server.R
Link the user interface to the underlying dataset


