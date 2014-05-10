
plot1 <- function (){
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
  
  ##Plot1
  par(bg = NA)
  hist(data2$Global_active_power, col = "red", 
       main = "Global Active Power",  
       xlab = "Global Active Power (kilowatts)", cex.axis = .75, 
       bg = "transparent", cex.main = .9, cex.lab = .75)
  dev.copy(png, file = "plot1.png", width = 480, height = 480)
  dev.off()
  
}