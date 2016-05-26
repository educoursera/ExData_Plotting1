rm(list = ls())
setwd(choose.dir())#It is optional
if(!file.exists("exdata_data_household_power_consumption.zip")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,destfile="./Data.zip")
} else{
  file.copy("./exdata_data_household_power_consumption.zip","./Data.zip",overwrite = TRUE)
}
unzip("./Data.zip")
data1 <- read.csv("household_power_consumption.txt",stringsAsFactors = FALSE,header = T, sep = ';',  na.strings = "?", check.names = FALSE, comment.char = "", quote = '\"')
data2 <- data1[data1$Date %in% c("1/2/2007","2/2/2007"),]
STime <-strptime(paste(data2$Date, data2$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data2 <- cbind(STime, data2)
dev.off()
par(bg='transparent')
plot(data2$STime, data2$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
plot(data2$STime, data2$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data2$STime, data2$Sub_metering_2, col="red")
lines(data2$STime, data2$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty="solid")
dev.copy(png,"plot32.png",width = 480, height = 480)
dev.off()

