install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)
getwd()
welfare = read.csv("welfare.csv")
welfare
welfare<-welfare%>%rename("gender"="sex")

welfare$gender <-ifelse(welfare$gender ==1, "male","female")
qplot(welfare$gender)

class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income)+xlim(0,1000)

summary(welfare$income)
welfare$income <-ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
table(is.na(welfare$income))

gender_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(gender) %>%  
  summarise(mean_income = mean(income)) 

gender_income

ggplot(data = gender_income, aes(x=gender, y=mean_income)) +geom_bar(stat = "identity")
