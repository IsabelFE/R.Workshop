library(knitr)
library(data.table)
library(tidyverse)
library(filesstrings)

###### SET UP ######

# Setting up the working directory

syncfolder <- '/Users/isabelfernandezescapa/Desktop/GitHub/R.Workshop/'


###### PROCESSING ###### 

# Listing all the '_sequencer_run.csv' files in the data_input folder and looping through the file list to run the fixing script

filelist <- list.files(file.path(syncfolder,"data_input"), pattern = '_input.csv', full.names=FALSE)

for (file in filelist) {
  file_id <- gsub("_input.csv", "", file) #grep file_id name from the file name
  print(paste("Processing file",file_id))
  
  # Saving full paths for all needed input files
  fileDataPath <- paste(syncfolder,"data_input/", file, sep="")

  # Saving input files as objects
  table <- fread(fileDataPath)
  
  # Rendering '05_BasicNotebook.Rmd':
  rmarkdown::render(input = "05_BasicNotebook.Rmd",
                    output_format = "html_document",
                    output_file = paste0(file_id, "_Report.html"),
                    output_dir = file.path(syncfolder,"output", file_id),
                    params = list(folder = syncfolder))
  
  # Moving input files into 'data_archive'
  file.move(fileDataPath, file.path(paste(syncfolder,"/output/", file_id, sep="")), overwrite = TRUE)
}
