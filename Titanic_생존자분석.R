titanic=read.csv("titanic_clean.csv", header = TRUE, sep = ",")
str(titanic)
library(ggplot2)
ggplot(titanic,aes(x=factor(pclass),fill=factor(sex)))+
  geom_bar(position = "dodge")

ggplot(titanic,aes(x=factor(pclass),fill=factor(sex)))+
  geom_bar(position = "dodge")+
  facet_grid(".~survived")

posn.j =position_jitter(0.5, 0)
ggplot(titanic, aes(x=factor(pclass),y=age, col=factor(sex)))+
  geom_jitter(size=3, alpha=0.5,position = posn.j)+
  facet_grid(".~survived")


install.packages("caret")
library(caret)
set.seed(100)
test_idx = createDataPartition(titanic$survived, p=0.8)$Resample1
titanic.train = titanic[test_idx, ]
titanic.test = titanic[-test_idx, ]
str(titanic.train)  
str(titanic.test)  

table(titanic.train$survived) #살아남은사람 수
prop.table(table(titanic.train$survived)) #살아남은 사람 비율예측

table(titanic.train$sex, titanic.train$survived)
prop.table(table(titanic.train$sex, titanic.train$survived),1)

titanic.train$child <- NA
titanic.train$child[titanic.train$age <18] <-1
titanic.train$child[titanic.train$age >=18] <-0
prop.table(table(titanic.train$child,titanic.train$survived),1)
titanic.test_one = titanic.test
titanic.test_one$survived <-0
titanic.test_one$survived[titanic.test_one$sex=='female'] <-1

install.packages("rpart")
library(rpart)
train_surv = rpart(survived ~ pclass + sex + age + sibsp + parch + fare + embarked, data = titanic.train, method = "class")
train_surv
library(rpart.plot)
prp(train_surv, type = 4, extra = 2, digits = 3)

install.packages("rpart.plot")
library(rpart.plot)
prp(train_surv ,type=4, extra =2, digits = 3)

head(predict(train_surv,newdata = titanic.test, type="class" ))
tail(predict(train_surv, newdata = titanic.test, type = "class"))

install.packages("rattle")
library(rattle)
library(RColorBrewer)
fancyRpartPlot(train_surv)

plot(train_surv)
text(train_surv)

NROW(titanic.train)
NROW(titanic.test)
prop.table(table(titanic.train$survived))
prop.table(table(titanic.test$survived))

# train data와 train test데이터 를 통해 예측한 정확도가 
#0.6666667-0.605916 = 0.0607507
#0.394084-0.3333333 = 0.0607507
#100-0.0607507 = 99.9392493 입니다.