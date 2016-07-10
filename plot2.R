# The purpose of this program is to take the data from "household_power_consumption.txt" 
# and build plot2
library(lubridate)

## Read in Data Table and convert Date and Time columns into Date and Time objects
data <- read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?", 
                   colClasses =c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Date <- dmy(data$Date)
data <- subset(data, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))

## Build up plot2, which is plot() with type = "l"
### Create new column
newcol <- paste(data$Date,data$Time)
newcol <- ymd_hms(newcol)
plot(newcol,data$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "n")
lines(newcol,data$Global_active_power,type = "l")
### Create Plot2 png
dev.copy(png,file = "plot2.png")
dev.off()