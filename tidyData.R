    setwd("C:/Users/chink/Desktop/Data Science Material/R_workingdir") ## set the working directory
    library(lubridate)
    file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" ## url of the zip file
	## check whether the folder is created or not, if not create the folder
    if(!file.exists("source")){
      dir.create("source")
    }
	## check for the tidy data set is already present or not 
    if(!file.exists("source/pollution_data.txt")){

    file_name = "source/power_consumption.zip"
    download.file(file_url,destfile = file_name,mode="wb") ## download the file
    unzip("source/power_consumption.zip",exdir = "source",overwrite = TRUE) ## unzip the file 
	
	## load the data into R using read.table and na.strings char as "?"
    pollution_data <- read.table("source/household_power_consumption.txt",header = TRUE,colClasses = c(rep("character",2),rep("numeric",7)),
                                 sep=";",na.strings = "?") 
								 
	  ## filtering on the basis of dates
    pollution_data <- pollution_data[pollution_data$Date=='1/2/2007' | pollution_data$Date == '2/2/2007',]
    colnames(pollution_data) <- gsub("_","",names(pollution_data)) ## cleaning the raw data column names removing underscores
    
	## creating a new column so that the dataset gets rid of unnecessary columns
    pollution_data$DateTime <- dmy(pollution_data$Date)+hms(pollution_data$Time) 
    pollution_data <- select(pollution_data,DateTime,Globalactivepower:Submetering3) ## removing the unwanted columns
	## writing the tidy data set into new file 
    
    write.table(pollution_data,file="source/pollution_data.txt",row.names = FALSE,sep = "|")
    }else {
      ## if the tidy dataset is present then just load into R
      pollution_data<-read.table('source/pollution_data.txt',header=TRUE,sep='|')
	  ##convert into proper class before it was character
      pollution_data$DateTime <- as.POSIXlt(pollution_data$DateTime )
    }
    ## Freeing up the space by removing the unnecessary files
    if(file.exists("source/household_power_consumption.txt")){
      store <- file.remove("source/household_power_consumption.txt")
    }