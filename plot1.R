## Read original data
EPC <- read.csv("household_power_consumption.txt",skip=66637,nrow=2880,header=FALSE,sep=";") 
        ## Electric Power Consumpsion

## Read first line to copy the col names to EPC
EPC_names <- read.csv("household_power_consumption.txt",nrow=1,header=TRUE,sep=";") 
names(EPC) <- names(EPC_names)

## draw the graph
hist(EPC$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

## save as PNG file
dev.copy(png,file="plot1.png")
dev.off()
