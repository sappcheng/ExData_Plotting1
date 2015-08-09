source("readData.R")

df<-readData()

png("plot2.png", width=480, height=480)
plot(x=df$Time, y=df$Global_active_power,
     xlab="",
     ylab="Global Active Power(kilowatts)",    
     type="l")

dev.off()

