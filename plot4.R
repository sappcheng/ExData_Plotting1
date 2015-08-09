source("readData.R")

df<-readData()

png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))

#plot1
plot(x=df$Time, y=df$Global_active_power,
     xlab="",
     ylab="Global Active Power",    
     type="l")

#plot2
plot(x=df$Time, y=df$Voltage,
     xlab="datetime",
     ylab="Voltage",    
     type="l")

#plot3
plot(df$Time,df$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(df$Time,df$Sub_metering_2,col="red")
lines(df$Time,df$Sub_metering_3,col="blue")
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,
       bty="n")

#plot4
plot(x=df$Time, y=df$Global_reactive_power,
     xlab="datetime",
     ylab="Global_reactive_power",    
     type="l")

dev.off()
