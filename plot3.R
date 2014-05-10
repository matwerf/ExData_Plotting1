
plot3 <- function (){
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
  
 
  ##Plot3
  data3 <- strptime(paste(data2$Date[], data2$Time[]), 
                    format = "%d/%m/%Y %H:%M:%S")
  par(bg = NA)
  plot(data3, data2$Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab ="",
       cex.axis = 0.75, cex.lab = 0.75)
  lines(data3, data2$Sub_metering_2, col = "red")
  lines(data3, data2$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         lwd = 1, cex = 0.65)
  dev.copy(png, file = "plot3.png", width = 480, height = 480)
  dev.off()
 
}