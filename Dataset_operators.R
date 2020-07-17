# Creating Subset of data

getwd()
install.packages("openxlsx")
library(openxlsx)
test=read.xlsx("Revenue_dataset.xlsx") 
dim(test)


head(test,10)  #default of head()& tail() 6 records
tail(test,15) 

subset=test[100:105,]
dim(subset)
names(subset)
str(subset)

rm(may_subset) # To remove a dataset

?save
may_subset=test[1:10,c(1,4)]
#save(may_subset,file="May_subset.R")

#Selecting ROWS from dataset

test[1:10,]
test[10,]
test[c(1:3,5,10:15),]

#Selecting Columns from dataset

test[1:5,1:3]
test[1:5,5]
test[1:5,c(1,3,5)]

nrow(test)
colSums(is.na(test))
