# How to deal with NA values

x=c(9,10,11,12,13,14,15,NA)

x

sum(x)

sum(x,na.rm=TRUE)

max(x)

max(x,na.rm=TRUE)

mean(x,na.rm=TRUE)

x

x=x[!is.na(x)] # To create a new variable without NA
x

y=c(3,4,5,NA,8,NA,10)

sum(is.na(y))  # To count no.of NA in a variable

xy=data.frame(x,y)
dim(xy)
sum(is.na(xy$y))
