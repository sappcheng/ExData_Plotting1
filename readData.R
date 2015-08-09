readData<-function() {
  
      #download and unzip data, save the unzipped data folder electric to current working directory
      
      fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      if (!file.exists("Electric")) {
        if (!file.exists("data")) {
          dir.create("data")
        }
        download.file(fileUrl, destfile="data/electric.zip")
        unzip("data/electric.zip", exdir=".")
      }
      
      #read data
      
      df <- read.table("household_power_consumption.txt",
                       header=TRUE,
                       sep=";",
                       colClasses=c("character", "character", rep("numeric",7)),
                       na="?")
      
      #format Date and time
      df$Date <- as.Date(df$Date, format="%d/%m/%Y")
      df$Time <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")
      
      #subsetting data
      dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
      df <- subset(df, Date %in% dates)
      
      return(df)

}