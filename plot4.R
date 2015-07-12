library(lubridate)
library(datasets)
## read titles of colums
titles<-read.table(
        file="household_power_consumption.txt",
        header=T,
        sep=";", 
        na.strings="?",
        nrows=1
        )
columnames<-c(names(titles))
##read the data required
consumtion<-read.table(
        file="household_power_consumption.txt",
        header=T,
        sep=";",
        na.strings="?",
        nrows=2880, 
        skip=66636
        )
##add colums names
names(consumtion)<-columnames
##merge date and time, then the format

datetime<-paste(
        consumtion$Date,
        consumtion$Time
        )
datetime<-dmy_hms(
        datetime
        )
## ploting situation
par(mfrow=c(2,2),mar= c(4,4,2,1))
plot(
        datetime,  
        consumtion$Global_active_power ,
        type="l",
        xlab="", 
        ylab="Global Active Power (killowatts)"
        )
plot(
        datetime,
        consumtion$Voltage ,
        type="l",
        ylab="Voltage"
        )
plot(
        datetime,
        consumtion$Sub_metering_1, 
        type="l",
        xlab="", 
        ylab="Energy sub metering"
        )
points(
        datetime,
        consumtion$Sub_metering_2, 
        type="l",
        col="Red",
        xlab="" ,
        ylab=""
        )
points(
        datetime,
        consumtion$Sub_metering_3, 
        type="l",
        col="Blue",
        xlab="", 
        ylab=""
        )

legend(
        "topright",
        lty = c(1,1,1),
        col=c("Black","Red","Blue"),
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        adj = 0,
        cex = 0.5,
        xjust = 0,
        yjust = -20,
        y.intersp = 0.3,
        text.width=50000,
        bty = "n",
        inset = 0
)

plot(
        datetime,  
        consumtion$Global_reactive_power ,
        type="l",
        ylab="Global_reactive_power"
        )
##Copy the plot to a PNG file
dev.copy(
        png,
        file="plot4.png",
        height=480,
        width=480,
        units="px"
)
dev.off()