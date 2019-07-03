#Q1 - 구동방식별 고속도로 연비
head(mpg)
library(dplyr)
library(ggplot2)
mpg_4 = mpg%>%filter(drv==4)
mpg_f=mpg%>%filter(drv=='f')
mpg_r=mpg%>%filter(drv=='r')

boxplot(mpg_4$hwy, mpg_f$hwy ,mpg_r$hwy, col=c("yellow","cyan","green"), names=c("4","f","r"))

plot.new()

#Q2 - 평균 cty(도시연비)가 가장높은회사다섯곳을막대그래프로표현해보시오.

#mpg데이터 불러오기
library(dplyr)
head(mpg)
mpg%>%filter(class=="suv")%>%mean(cty)%>%arrange(desc(hwy))

df_mpg = mpg%>%group_by(manufacturer)%>%filter(class=="suv")%>%summarise(mean_cty=mean(cty))%>%arrange(desc(mean_cty))%>%head(5)
df_mpg
ggplot(data=df_mpg, aes(x=manufacturer,y=mean_cty))+geom_col()

