T_sales=c(210,110,400,550,700,130)
pie(T_sales, init.angle = 90,col=rainbow(length(T_sales)),
    main = "주간매출변동",
    lables=c("Mon","Tue","Wed","Thur","Fri","Sat"))

#erase.screen()
install.packages("plotrix")
library("plotrix")
week=c("Mon","Tue","Wed","Thur","Fri","Sat")
ratio=round(T_sales/sum(T_sales)*100,1)
label=paste(week,"\n",ratio,"%")
pie3D(T_sales, main="주간매출 동향",col=rainbow(length(T_salse)),cex=0.8, labels=label)
lengend(-0.8,1.0,c("Mon","Tue","Wed","Thur","Fri","Sat"),cex=0.8, fill=rainbow(length(T_sales)))
getwd()
