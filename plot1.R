## Coursera Course Exploratory Data Analysis Project 1
## Created by GEOX on 4/6/2015

library(lubridate)
library(dplyr)

## --- Read data then select only the tow days' data
powerData <- read.table("household_power_consumption.txt", header = T, sep = ";",
                        na.strings = "?", stringsAsFactors=F)
powerData$Date <- dmy(powerData$Date)  # convert from string to date
plotData <- filter(powerData, Date %in% c(ymd("2007-02-01"), ymd("2007-02-02")))

## --- Create histogram
hist(plotData$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## --- Save to file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
