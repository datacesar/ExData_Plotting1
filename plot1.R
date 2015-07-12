library(datasets)
## read titles of colums
titles<-read.table(
        file="household_power_consumption.txt",
        header=T,sep=";",
        na.strings="?",
        nrows=1
        )
columnames<-c(names(titles))
##read the data required
consumtion<-read.table(
        file="household_power_consumption.txt",
        header=T,sep=";",
        na.strings="?",
        nrows=2880,
        skip=66636
        )
##add colums names
names(consumtion)<-columnames
##plot histogram
hist(
        consumtion$Global_active_power,
        col="red",
        main="Global Active Power",
        xlab="Global Active Power (kilowatts)"
       )
##Copy the plot to a PNG file
dev.copy(
        png,
        file="plot1.png",
        height=480,
        width=480,
        units="px"
        )
dev.off()
