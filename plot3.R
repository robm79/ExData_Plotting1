plot3 <- function(){
        power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        power$NewDate <- as.Date(power$Date, format = "%d/%m/%Y")
        power$Stamp <- paste(power$Date,"-",power$Time)
        power$Stamp <- strptime(power$Stamp, format="%d/%m/%Y - %H:%M:%S")
        power2 <- subset(power, power$NewDate == "2007/02/01" | power$NewDate == "2007/02/02")
        power <- power2
        rm(power2)
        png(filename = "plot3.png", width = 480, height = 480)
        with(power, {
                plot(Stamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
                lines(Stamp, Sub_metering_2, col="red")
                lines(Stamp, Sub_metering_3, col="blue")
                })
        legend("topright", lwd=1, col = c("Black", "Red", "Blue"), 
                                          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
}