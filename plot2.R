## downloaded the zip file and put txt file under data folder
## only get 2 days of data
setwd("./R/Coursera/data")
dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
Febdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
## check Febdata structure -- Global_active_power and Date are chr type
str(Febdata) 
## change Global_active_power to number
gap <- as.numeric(Febdata$Global_active_power) 
## change Date chr type to date and time type 
datetime <- strptime(paste(Febdata$Date, Febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=500, height=500) 
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
## release the display device
dev.off() 