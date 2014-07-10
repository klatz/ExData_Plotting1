## Read original data
EPC <- read.csv("household_power_consumption.txt",skip=66637,nrow=2880,header=FALSE,sep=";") 
        ## Electric Power Consumpsion

## Read first line to copy the col names to EPC
EPC_names <- read.csv("household_power_consumption.txt",nrow=1,header=TRUE,sep=";") 
names(EPC) <- names(EPC_names)

## turn off locale-specific
Sys.setlocale("LC_TIME","C") 

EPC$Date2 <- strptime(paste(EPC$Date,EPC$Time,sep="/"),"%d/%m/%Y/%H:%M:%S")

## draw the graph
plot(EPC$Date2,EPC$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(EPC$Date2,EPC$Sub_metering_2,type="l",col="red")
lines(EPC$Date2,EPC$Sub_metering_3,type="l",col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
                ,cex=0.9,y.intersp=0.7)

## save as PNG file
dev.copy(png,file="plot3.png")
dev.off()
