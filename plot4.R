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
par(mfrow = c(2,2))
with(EPC,{
        ## top left
        plot(Date2,Global_active_power,type="l",xlab="",ylab="Global Active Power")
        
        ## top right
        plot(Date2,Voltage,type="l",xlab="datetime",ylab="Voltage")

        ## bottom left
        plot(Date2,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        lines(Date2,Sub_metering_2,type="l",col="red")
        lines(Date2,Sub_metering_3,type="l",col="blue")
        legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
                        ,box.lwd=0,cex=0.7,y.intersp=0.7,yjust=0)
 
        ## bottom right
        plot(Date2,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")       
})

## save as PNG file
dev.copy(png,file="plot4.png")
dev.off()
