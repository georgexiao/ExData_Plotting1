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

## --- Create multiple lines chart
with(plotData, {
    plot(Sub_metering_1 ~ Date_time, type="l",
         ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ Date_time, col = 'Red')
    lines(Sub_metering_3 ~ Date_time, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, cex = 0.7,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

## --- Save to file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()