rm(list = ls())
setwd(choose.dir())#It is optional
if(!file.exists("exdata_data_household_power_consumption.zip")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,destfile="./Data.zip")
} else{
  file.copy("./exdata_data_household_power_consumption.zip","./Data.zip",overwrite = TRUE)
}
unzip("./Data.zip")
data1 <- file("household_power_consumption.txt")
newdata <- read.table(text = grep("^[1,2]/2/2007", readLines(data1), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
head(newdata)
dev.off()
hist(newdata$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")

png(filename = "plot1.png",width = 480, height = 480, bg = "transparent")
hist(newdata$Global_active_power, col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)");
dev.off()

