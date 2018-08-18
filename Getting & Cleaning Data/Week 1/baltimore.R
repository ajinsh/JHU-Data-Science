setwd("C:/Users/AJINKYA/Downloads/DSS/Getting & Cleaning Data/Week 1/data")

if(!file.exists("data")) {
    dir.create("data")
}
fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="cameras.csv",method="curl")
datedownloaded <- date()

cameradata<-read.table("cameras.csv") # gives u error since file is csv.

cameradata <-read.table("cameras.csv",sep=",",header=TRUE) # explicitly tell sep

cameradata<-read.csv("cameras.csv")
 ""