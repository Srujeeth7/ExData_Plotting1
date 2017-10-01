setwd("C:/Users/chink/Desktop/Data Science Material/R_workingdir
 ## Calling the tidyData.R script to load the dataset
 
source("tidyData.R")

if(!file.exists("graphs")){
  dir.create("graphs")
}

png(filename = "graphs/plot3.png",width = 480, height = 480,units = "px")

## first plotting with submetering1 and later using lines function adding for submetering2 and submetering3
plot(pollution_data$DateTime,pollution_data$Submetering1,type="l",xlab = " ",ylab = "Energy Sub Metering")
lines(pollution_data$DateTime,pollution_data$Submetering2,col= "red")
lines(pollution_data$DateTime,pollution_data$Submetering3, col ="blue")

## legend 
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = "solid",col=c("black","red","blue"))

dev.off()