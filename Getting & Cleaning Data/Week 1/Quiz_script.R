if(!file.exists("data"))
{
    dir.create("data")
}
file.url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url=file.url, destfile = "./data/idaho.csv")

list.files("./data")
datedownloaded<-Date()

a<-read.csv("./data/idaho.csv",header = TRUE)

    
table(a$VAL>=24)

table(a$FES)


-----------------
library("xlsx")
file.url2<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url=file.url2, destfile = "./data/GAP.xlsx")


dat <- read.xlsx("./data/GAP.xlsx", 1, rowIndex = 18:23, colIndex = 7:15)
------------
library("XML")
file.url3<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(url=file.url3, destfile = "./data/rest.xml")

file_xml<-xmlTreeParse("./data/rest.xml", useInternal=TRUE)

rootNode<-xmlRoot(file_xml)
xmlName(rootNode)
names(rootNode[[1]][[1]])
sum(xpathSApply(rootNode,"//zipcode",xmlValue)==21231)

----------------
    
library(data.table)
file4.url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url=file4.url, destfile = "./data/ACS.csv")
list.files("./data")
datedownloaded<-Date()
DT <- fread("./data/ACS.csv")
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(rowMeans(DT)[DT$SEX==1])+system.time( rowMeans(DT)[DT$SEX==2])
system.time(mean(DT[DT$SEX==1,]$pwgtp15))+system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(DT[,mean(pwgtp15),by=SEX])