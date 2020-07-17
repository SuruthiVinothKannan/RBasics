# Iris data

data("iris")
str(iris)

summary(iris)

# Data Partition
set.seed(123)
d<-sample(2, nrow(iris),
       replace = TRUE,
       prob=c(0.8,0.2))

training<-iris[d==1,]
testing<-iris[d==2,]

# Scatter Plot & Correlations
library(psych)
pairs.panels(training[,-5],
             gap=0,
             bg=c("red","yellow","blue")[training$Species],
             pch=21)
cor(training[,-5])
# High correlations among independent variables lead to "Multicollinearity" problem.

#**************************************
# Principal Component Analysis#
#***************************************
# prcomp()-> performs PCA on given data matrix
# center makes sures the average of all variables is 0
# scale. it make sures before PCA all the variables are normalised

pc<-prcomp(training[,-5],
           center = TRUE,
           scale. = TRUE)
names(pc)
pc$center # gives the average of each of the four variables
pc$scale  # gives the standard deviation of the variables

print(pc) # we get Rotations also known as loadings, got 4 PC's for 4 variables

#Each PC is a normalised linear combination of original variables and lies b/w -1 to 1

summary(pc)
# First 2 Pc captures the majority of the variability

#Orthogonality of PC's
pairs.panels(pc$x,
             gap=0,
             bg=c("red","yellow","blue")[training$Species],
             pch=21)

# Predict with Principal Components

trg<-predict(pc,training)
trg<-data.frame(trg,training[5])

tst<-predict(pc,testing)
tst<-data.frame(tst,testing[5])

# Multinomial logistic regression with first two PC's
library(nnet)
names(trg)
model<-multinom(Species~PC1+PC2, data=trg)
summary(model)

# Confusion Matrix & Misclassification error - training
p<-predict(model,trg)
t<-table(p,trg$Species)
t # Confusion matrix
1-sum(diag(t))/sum(t) # Misclassification is 1-(sum of correct pred)/(sum of Pred) 

# Testing Data
p1<-predict(model,tst)
t<-table(p1,tst$Species)
t 
1-sum(diag(t))/sum(t) 
  