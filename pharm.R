# Basics R analysis for Pharmacy data

getwd()
install.packages("openxlsx")
library(openxlsx)
pharma=read.xlsx("Pharma.xlsx")
summary(pharma)

cor(pharma)
plot(pharma)

sd(pharma$Cooling)
sd(pharma$Com_1)
sd(pharma$Com_2)
sd(pharma$Yield_KG)
