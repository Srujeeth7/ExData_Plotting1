setwd("C:/Users/chink/Desktop/Data Science Material/R_workingdir")
 ## Calling the tidyData.R script to load the dataset
source("tidyData.R")
 ## Creating new folder
if(!file.exists("graphs")){
  dir.create("graphs")
}
  png(filename = "graphs/plot1.png",width = 480 ,height = 480 ,units = "px")
  
  hist(pollution_data$Globalactivepower,col="red",xlab = "Global Active Power (Kilowatts)")
  
  dev.off() 
