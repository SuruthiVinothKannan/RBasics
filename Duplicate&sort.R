# Sampling

install.packages("dplyr")
library("dplyr")
new=sample_n(test,10)
new
new1=sample_frac(test,0.1)
new1
rm(new,new1)

names(test)
table(test$REGION)
table(test$Model_Type)
table(test$Gender)
id=c(1:8,2,3)
f_name=c("a","b","c","d","e","f","g","a","b","c")
l_name=c("w","x","y","z","s","t","u","v","x","y")
sal=(501:510)
gen=c("f","m","f","m","m","m","m","m","f","f")
test_case=data_frame(id,f_name,l_name,sal,gen)
class(test_case)
distinct(test_case)
distinct(test_case,id,.keep_all = TRUE)
distinct(test_case,l_name,id,.keep_all = TRUE) #gives all obs that have the unique key

#arrange(test_case,id,f_name)
arrange(test_case,gen)
table(gen)
sor_sal=arrange(test_case,desc(sal))
sor_sal
head(sor_sal,5)

distinct(arrange(test_case,gen,desc(sal)),id,.keep_all = TRUE)
