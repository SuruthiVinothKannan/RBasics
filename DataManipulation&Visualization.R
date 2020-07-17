install.packages("choroplethr")

library(dplyr)
library(ggplot2)
library(choroplethr)
library(choroplethrMaps)
library(openintro)
library(fiftystater)
library(colorplaner)

library(openxlsx)
getwd()
setwd("C://Users//Suruthi//Desktop//Data//Basics_R")

data<-read.xlsx("Revenue_dataset.xlsx")

# Filter

NE<-data %>%
  filter(REGION=='North' | REGION=='East')

EM<-data %>%
  filter(REGION=='East' , Gender=='M')

# Arrange

data %>%
  filter(REGION=='North' | REGION=='East') %>%
  arrange(desc(June_Revenue))

# Summarise

summary(data$June_Revenue)

data %>%
  summarise(Avg_June<-mean(June_Revenue),
            sd_June<-sd(June_Revenue),
            max_June<-max(June_Revenue),
            min_June<-min(June_Revenue),
            sum_June<-sum(June_Revenue),
            median_June<-median(June_Revenue),
            total<-n())

# Groupby

g<-data %>%
  group_by(REGION) %>%
  summarise(Avg_June=mean(June_Revenue),
            sd_June=sd(June_Revenue),
            max_June=max(June_Revenue),
            min_June=min(June_Revenue),
            sum_June=sum(June_Revenue),
            median_June=median(June_Revenue),
            total=n()) %>%
  arrange(desc(Avg_June))

# Mutate <- to create new column
data %>%
    group_by(REGION) %>%
    mutate(Discount=May_Revenue*10) %>%
    summarise(Avg_MayRev=mean(May_Revenue),
              Avg_Discount=mean(Discount)) %>%
  arrange(desc(Avg_MayRev))

# test <- MAx June Revenue in region North
data %>%
  filter(REGION=='North') %>%
  summarise(Rev=max(June_Revenue))

# test <- Region with higest standard deviation
data %>%
  group_by(REGION) %>%
  summarise(sd_June=sd(June_Revenue)) %>%
              filter(sd_June==max(sd_June))

# Visualization
# Histogram
data %>%
  ggplot(aes(x=May_Revenue, fill=REGION))+
  geom_histogram(alpha=0.8,color='darkblue',na.rm=TRUE)+
  ggtitle('May Revenue for all region')+
  facet_wrap(~REGION)

# Density
data %>%
  ggplot(aes(x=May_Revenue, fill=REGION))+
  geom_density(alpha=0.8,color='darkblue',na.rm=TRUE)+
  ggtitle('May Revenue for all region')
  
# Scatter
data %>%
  ggplot(aes(x=May_Revenue,y=June_Revenue))+
  geom_point(alpha=0.8,color='darkblue',na.rm=TRUE)+
  geom_smooth(se=0)+
  ggtitle('May Revenue Vs June')

# Bar plot
data %>%
  ggplot(aes(x=REGION,y=June_Revenue,fill=REGION))+
  geom_col()
data %>%
  ggplot(aes(x=REGION,y=May_Revenue,fill=REGION))+
  geom_col()

# Box plot
data %>%
  ggplot(aes(x=REGION,y=June_Revenue,fill=REGION))+
  geom_boxplot()

# GEOgraphic plot
p<-ggplot(data,aes(map_id= region))+
  geom_map(aes(fill=June_Revenue),map=fifty_states)+
  expand_limits(x=fifty_states$long, y=fifty_states$lat)+
  coord_map()+
  scale_x_continuous(breaks = NULL)+
  scale_y_continuous(breaks = NULL)+
  labs(x="",y="")+
  theme(legend.position = "bottom",
        panel.background = element_blank())

p+fifty_states_inset_boxes()
p+aes(fill2 = Gender) + scale_fill_colourplane()+
  theme(legend.position = 'right')+
  ggtitle('Geograph between June Rev and Gender')



# Goegraphic US map visual using state_choropleth()
# need to have state name in lower and full word
# can use abbr2state() & tolower() to change IA to iowa

# state_choropleth(data,
#                   title ="",
#                   legend = '')

