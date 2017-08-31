## downloaded the zip file and put txt file under data folder
## only get 2 days of data
setwd("./R/Coursera/data")
dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
Febdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
## check Febdata structure & Global_active_power is chr type
str(Febdata) 
## change Global_active_power to number
gap <- as.numeric(Febdata$Global_active_power) 
png("plot1.png", width=500, height=500) 
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
## release the display device
dev.off() 
