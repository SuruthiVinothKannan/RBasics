getwd()
library(openxlsx)
data_oneway=read.xlsx("Testing of Hypothesis.xlsx", sheet="Oneway")

names(data_oneway)
dim(data_oneway)
str(data_oneway)

table(data_oneway$week)

summary(data_oneway)

model_oneway=aov(churners~week,data_oneway)
summary(model_oneway)
Oneway=TukeyHSD(model_oneway)
Oneway
boxplot(churners~week,data_oneway)

# Two Way
data_twoway=read.xlsx("Testing of Hypothesis.xlsx", sheet="Twoway")
summary(data_twoway)
names(data_twoway)

model_twoway=aov(avg_rev~Tenure+region,data_twoway)
summary(model_twoway)
Twoway=TukeyHSD(model_twoway)
Twoway
boxplot(avg_rev~Tenure+region,data_twoway)
