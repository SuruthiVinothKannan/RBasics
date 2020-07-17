a=1:4

a

b=c(1,3,3,NA)

b

cor(a,b)

cor(a,b,use='complete.obs')

# Type of objects Vector, Factor, Matix, Dataframe, List
#Vector
x<-c(1,2,3,4,5)
x
y<-c(2,3,4,5,6)
y
z<-c(5,6,7,8,9)
z
area<-c("OR","AZ","MD","CA","NY")
area
class(x)
mode(x)
class(area)
mode(area)

#Factor

people<-c(1,2,1,1,2)
class(people)
people=factor(people)
class(people)
mode(people)

#Matrix

matrx<-cbind(x,y,z)
matrx
class(matrx)
mode(matrx)
dim(matrx)

#Dataframe

sample<-data.frame(x,y,z,area)
class(sample)
mode(sample)
mode(sample$area)
View(sample)
str(sample)
sample$area=as.character(sample$area)
mode(sample$area)
str(sample)

#List

old=list(x,y,z,people,matrx,sample)
old
old[4]
