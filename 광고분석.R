
#TV
ad = read.csv("ad.csv")
head(ad)
cor(ad$sales,ad$TV)# 0.7822 <--둘이 양적 상관관계가 높음
model1=lm(ad$sales~ad$TV)
model1
plot(ad$sales~ad$TV, data=ad)
abline(model1, col="red")
par(mfrow=c(2,2))
plot(model1)
par(mfrow=c(1,1))
summary(model1)

#Radio
cor(ad$sales,ad$radio)# 0.5762 <--둘이 양적 상관관계가 있음
model2=lm(ad$sales~ad$radio)
plot(ad$sales~ad$radio, data=ad)
abline(model2, col="red")
par(mfrow=c(2,2))
plot(model2)
par(mfrow=c(1,1))
summary(model2)

#newspaper
cor(ad$sales,ad$newspaper)# 0.2282 <--둘이 양적 상관관계가 있음
model3=lm(ad$sales~ad$newspaper)
model3
plot(ad$sales~ad$newspaper, data=ad)
abline(model3, col="blue")
par(mfrow=c(2,2))
plot(model3)
par(mfrow=c(1,1))
summary(model3)


#TV, Radio
model4=lm(ad$sales~ad$TV+ad$radio)
model4
par(mfrow=c(2,2))
plot(model4)
par(mfrow=c(1,1))
summary(model4)


#Radio, newspaper
model5=lm(ad$sales~ad$radio+ad$newspaper)
par(mfrow=c(2,2))
plot(model5)
par(mfrow=c(1,1))
model5
summary(model5)


#TV와 newspaper
model6=lm(ad$sales~ad$TV+ad$newspaper)
par(mfrow=c(2,2))
plot(model6)
par(mfrow=c(1,1))
model6
summary(model6)
#TV,Radio, newspaper
model7=lm(sales~TV+newspaper+radio, data=ad)
par(mfrow=c(2,2))
plot(model7)
par(mfrow=c(1,1))
summary(model7)

install.packages("dplyr")
library(dplyr)
ad%>%select(-newspaper)

set.seed(100)
trainingRowIndex = sample(1:nrow(ad),0.6*nrow(ad))
trainingData=ad[trainingRowIndex,]
testData = ad[-trainingRowIndex,]

lmMod = lm(sales~TV+radio, data=trainingData)
summary(lmMod)

adpred = predict(lmMod, testData)
actuals_preds = data.frame(cbind(actuals=testData$sales,
                                 predict=adpred))
head(actuals_preds)
correlation_accuracy = cor(actuals_preds)
correlation_accuracy
#predict수치 결과를 보고 선형관계이며 관계성이 높다고 말할수 있다.
#