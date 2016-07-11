# The purpose of this program is to take the data from "household_power_consumption.txt" 
# and build plot4
library(lubridate)

## Read in Data Table and convert Date and Time columns into Date and Time objects
data <- read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
data$Date <- dmy(data$Date)
data <- subset(data, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))

## Build up plot4
### Create new column
newcol <- paste(data$Date,data$Time)
newcol <- ymd_hms(newcol)

### Start using png device
png("plot4.png")
par(mfcol = c(2,2))

### Create first plot of datetime vs global active power
plot(newcol,data$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "n")
lines(newcol,data$Global_active_power,type = "l")

### Create second plot of sub metering lines
plot(newcol,data$Sub_metering_1,xlab = "",ylab = "Energy sub metering",type = "n")
lines(newcol,data$Sub_metering_1,type = "l")
lines(newcol,data$Sub_metering_2,type = "l",col = "red")
lines(newcol,data$Sub_metering_3,type = "l",col = "blue")
legend("topright",legend = names(data)[7:9],col = c("black","red","blue"),lty = c(1,1,1))

### Create third plot of datetime vs Voltage
plot(newcol,data$Voltage,xlab = "datetime",ylab = "Voltage",type = "n")
lines(newcol,data$Voltage,type = "l")

### Create fourth plot of datetime vs global reactive power
plot(newcol,data$Global_reactive_power,xlab = "datetime",ylab = "Global_reactive_power",type = "n")
lines(newcol,data$Global_reactive_power,type = "l")

dev.off()
