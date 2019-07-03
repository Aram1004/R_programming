midwest <- as.data.frame(ggplot2::midwest)
midwest$ratio <-midwest$popasian/midwest$poptotal*100
hist(midwest$ratio)
mean(midwest$ratio)
midwest$group <- ifelse(midwest$ratio > 0.4872462, "large","small")
table(midwest$group)
library(ggplot2)
qplot(midwest$group)
