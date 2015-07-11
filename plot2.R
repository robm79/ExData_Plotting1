plot2 <- function(){
        power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        power$NewDate <- as.Date(power$Date, format = "%d/%m/%Y")
        power$Stamp <- paste(power$Date,"-",power$Time)
        power$Stamp <- strptime(power$Stamp, format="%d/%m/%Y - %H:%M:%S")
        power2 <- subset(power, power$NewDate == "2007/02/01" | power$NewDate == "2007/02/02")
        power <- power2
        rm(power2)
        png(filename = "plot2.png", width = 480, height = 480)
        with(power, plot(Stamp, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
        dev.off()
}