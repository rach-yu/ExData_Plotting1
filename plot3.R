##This script contains R code for Plot3. 

##First all the previous objects are cleared up.
rm(list=ls())

##Set the working directory to the location of the data.
work.directory <- "C:\\Users\\rach-yu\\Desktop\\EDA\\WEEK1"
setwd(work.directory)

##Read the first 100 lines as a sample to figure out an outline of the data
file.name <- "household_power_consumption.txt"
initial <- read.table(file.name, header = TRUE, na.strings = "?", nrow = 100, sep = ";")

##In the first line  "2006/12/16 17:24:00"
##Record it as time.initial
##We need it for working out how many lines to skip.
time.initial <- as.POSIXlt("2006-12-16 17:24:00")
time.start <- as.POSIXlt("2007-02-01 00:00:00")
time.start - time.initial
##Time difference of 46.275 days

time.skip <- 46.275
line.skip <- time.skip*24*60   ##lines we skip
line.use <- 2*24*60            ##lines we use for this assignment

hpc <- read.table(file.name, header = TRUE, na.strings = "?", skip = line.skip, nrow = line.use, sep = ";")
colnames(hpc) <- colnames(initial)

##Finish reading the data.
############################################################
##Generate Plot3
##Copy it to a PNG file.

Weekdays <- strptime(paste(hpc$Date, hpc$Time), format='%d/%m/%Y %H:%M:%S')
with(hpc, plot(Weekdays, Sub_metering_1, main = "", type = "l", xlab = "", ylab = "Energy sub metering")) 
lines(Weekdays, hpc$Sub_metering_2, col = "red")
lines(Weekdays, hpc$Sub_metering_3, col = "blue")
leg.txt <-  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty = 1, col = c("black","red","blue"), legend = leg.txt)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()

##Close the PNG device
##Plot 3 END.
