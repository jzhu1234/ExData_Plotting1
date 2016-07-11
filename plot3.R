# The purpose of this program is to take the data from "household_power_consumption.txt" 
# and build plot3
library(lubridate)

## Read in Data Table and convert Date and Time columns into Date and Time objects
data <- read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
data$Date <- dmy(data$Date)
data <- subset(data, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))

## Build up plot3
### Create new column
newcol <- paste(data$Date,data$Time)
newcol <- ymd_hms(newcol)
### Plot the sub metering lines
png("plot3.png") # Use this method since if we copied it, the legend would be cut off
plot(newcol,data$Sub_metering_1,xlab = "",ylab = "Energy sub metering",type = "n")
lines(newcol,data$Sub_metering_1,type = "l")
lines(newcol,data$Sub_metering_2,type = "l",col = "red")
lines(newcol,data$Sub_metering_3,type = "l",col = "blue")
### Add legend
legend("topright",legend = names(data)[7:9],col = c("black","red","blue"),lty = c(1,1,1))
dev.off()