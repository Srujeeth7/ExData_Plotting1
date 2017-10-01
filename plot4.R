setwd("C:/Users/chink/Desktop/Data Science Material/R_workingdir")

 ## Calling the tidyData.R script to load the dataset

source("tidyData.R")
if(!file.exists("graphs")){
  dir.create("graphs")
}

png(filename = "graphs/plot4.png",width = 480, height = 480,units = "px")

## Setting the parameter 
par(mfrow=c(2,2))

## first graph
with(pollution_data,plot(DateTime,Globalactivepower,type="l",ylab = "Global Active Power",xlab = ""))

## Second graph
with(pollution_data,plot(DateTime,Voltage,type="l",ylab = "Voltage",xlab = "datetime"))

## Third graph
plot(pollution_data$DateTime,pollution_data$Submetering1,type="l",xlab = " ",ylab = "Energy Sub Metering")
lines(pollution_data$DateTime,pollution_data$Submetering2,col= "red")
lines(pollution_data$DateTime,pollution_data$Submetering3, col ="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = "solid",col=c("black","red","blue"),fill = 1:6,cex = 0.75,bty="n")

## fourth graph
with(pollution_data,plot(DateTime,Globalreactivepower,type="l",ylab = "Global_reactive_power",xlab="datetime"))
dev.off()