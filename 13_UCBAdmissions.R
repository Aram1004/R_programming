data(UCBAdmissions)
str(UCBAdmissions)
UCBAdmissions
UCBAdmissions.df=as.data.frame(UCBAdmissions)
UCBAdmissions.df
xtabs(Freq ~ Gender + Admit, data= UCBAdmissions.df )
mosaicplot(Freq~Gender + Admit, data = UCBAdmissions, col= c("blue","red"),main="Mosaic plot of UCB Admission vs. Gender")
