plot4 <- function(){
        power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        power$NewDate <- as.Date(power$Date, format = "%d/%m/%Y")
        power$Stamp <- paste(power$Date,"-",power$Time)
        power$Stamp <- strptime(power$Stamp, format="%d/%m/%Y - %H:%M:%S")
        power2 <- subset(power, power$NewDate == "2007/02/01" | power$NewDate == "2007/02/02")
        power <- power2
        rm(power2)
        png(filename = "plot4.png", width = 480, height = 480)
        par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
        with(power, {
                plot(Stamp, Global_active_power, type="l", ylab = "Global Active Power")
                plot(Stamp, Voltage, type="l", xlab = "datetime")
                with(power, {
                        plot(Stamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
                        lines(Stamp, Sub_metering_2, col="red")
                        lines(Stamp, Sub_metering_3, col="blue")
                })
                legend("topright", lwd=1, col = c("Black", "Red", "Blue"), 
                       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                plot(Stamp, Global_reactive_power, type="l", xlab = "datetime")
        })
        dev.off()
}