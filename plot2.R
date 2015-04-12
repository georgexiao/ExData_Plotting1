## Coursera Course Exploratory Data Analysis Project 1
## Created by GEOX on 4/7/2015

library(lubridate)
library(dplyr)

## --- Read data then select only the tow days' data
powerData <- read.table("household_power_consumption.txt", header = T, sep = ";",
                        na.strings = "?", stringsAsFactors = F)
powerData$Date <- dmy(powerData$Date)              # convert from string to date
plotData <- filter(powerData, Date %in% c(ymd("2007-02-01"), ymd("2007-02-02")))

## --- Combine date and time in the source data for ploting time serious data
plotData$Date_time <- ymd_hms(paste(plotData$Date, plotData$Time))

## --- Create line plot
plot(plotData$Global_active_power ~ plotData$Date_time, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## --- Save to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
