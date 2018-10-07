setwd("/home/gab/EDA")
library("data.table")
powerDT <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
powerDT[, dateandtime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
powerDT <- powerDT[(dateandtime >= "2007-02-01") & (dateandtime < "2007-02-03")]

png("plot2.png", width=480, height=480)

plot(x = powerDT[, dateandtime]
     , y = powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
