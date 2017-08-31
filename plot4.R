## downloaded the zip file and put txt file under data folder
## only get 2 days of data
setwd("./R/Coursera/data")
dataFile <- "./household_power_consumption.txt" 
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
Febdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 
## check Febdata structure 
str(Febdata) 
## change Global_active_power and subMeteringx to number
gap <- as.numeric(Febdata$Global_active_power) 
sm1 <- as.numeric(Febdata$Sub_metering_1) 
sm2 <- as.numeric(Febdata$Sub_metering_2) 
sm3 <- as.numeric(Febdata$Sub_metering_3) 
grp <- as.numeric(Febdata$Global_reactive_power) 
vt <- as.numeric(Febdata$Voltage) 

## change Date chr type to date and time type 
datetime <- strptime(paste(Febdata$Date, Febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=600, height=600) 
## 4 charts in 2 rows and 2 columns
par(mfrow = c(2, 2)) 

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power") 
 
plot(datetime, vt, type="l", xlab="datetime", ylab="Voltage") 

plot(datetime, sm1, type="l", ylab="Energy Sub metering", xlab="") 
lines(datetime, sm2, type="l", col="red") 
lines(datetime, sm3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1, col=c("black", "red", "blue")) 

plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
## release the display device
dev.off() 