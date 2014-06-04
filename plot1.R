##This script contains R code for Plot1. 

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
##Generate Plot1
##Copy it to a PNG file.

with(hpc, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

##Close the PNG device
##Plot 1 END.

