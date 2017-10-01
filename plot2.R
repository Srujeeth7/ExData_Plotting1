setwd("C:/Users/chink/Desktop/Data Science Material/R_workingdir")

 ## Calling the tidyData.R script to load the dataset

 source("tidyData.R")

 ## Creating new folder

if(!file.exists("graphs")){
  dir.create("graphs")
}
png(filename = "graphs/plot2.png",width = 480, height = 480,units = "px")

with(pollution_data,plot(DateTime,Globalactivepower,type="l",ylab = "Global Active Power (Kilowatts)",xlab = ""))

dev.off()
