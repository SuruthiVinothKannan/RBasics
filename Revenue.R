# Basic Analysis of Revenue data

getwd()

reven=read.xlsx("Revenue_dataset.xlsx")

report_revenue=summary(reven)

report_revenue

write.csv(report_revenue,"Summay Stat of revenue")



str(reven)

mean(reven$May_Revenue)

sd(reven$May_Revenue)

View(reven)
names(reven)

table(reven$REGION)
summary(reven$June_Revenue)
