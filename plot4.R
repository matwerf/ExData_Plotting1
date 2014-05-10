
plot4 <- function (){
  ##Following can be uncommented to download the data
  #if(!file.exists("./data")){dir.create("./data")}
  #fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  #download.file(fileUrl, destfile="./data/datafile.zip", method="curl")
  #unzip("./data/datafile.zip")
  
  #reads in the file and subsets to the requested dates
  data <- read.table("household_power_consumption.txt", sep = ";", 
                     header = TRUE, na.strings = "?",
                     colClasses = c("character", "character", "numeric",
                                    "numeric", "numeric","numeric", 
                                    "numeric", "numeric", "numeric" ))
  datasub <- (data$Date[] == "2/2/2007")|(data$Date[] == "1/2/2007")
  data2 <- data[datasub,]
  data3 <- strptime(paste(data2$Date[], data2$Time[]), 
                    format = "%d/%m/%Y %H:%M:%S")
     
  ##Plot4
  png(file = "plot4.png", width = 480, height = 480)
  par(mfrow = c(2,2), mar = c(5,4,4,2), cex.axis = .9, cex.lab = 1, bg = NA)
  plot(data3, data2$Global_active_power, type = "l", 
       ylab = "Global Active Power", xlab ="")
  plot(data3, data2$Voltage, type = "l", 
       ylab = "Voltage", xlab ="datetime")
  plot(data3, data2$Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab ="")
  lines(data3, data2$Sub_metering_2, col = "red")
  lines(data3, data2$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), 
                 legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                 lwd = 1, bty = "n", cex = 1, yjust = 0)
  plot(data3, data2$Global_reactive_power, type = "l", 
       ylab = "Global_reactive_power", xlab ="datetime")
  #dev.copy(png, file = "plot4.png", width = 504, height = 504)
  dev.off()
}