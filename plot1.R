# The purpose of this program is to take the data from "household_power_consumption.txt" 
# and build plot1
library(lubridate)

## Read in Data Table and convert Date and Time columns into Date and Time objects
data <- read.table(file = "household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data <- subset(data, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))

## Construct first plot, which is a histogram of global active power
hist(data$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (killowats)")