
library(tidyverse)

library(dplyr)
library(ggplot2)
library(GGally)

load("lse.RData")
head(lse)

data =lse[,-(1:4)]
data

cor(data)
plot(lse[,(4:15)])
ggcorr(data,label = TRUE, label_size = 2)

library(leaps)


leaps1 <- leaps(lse[,-c(1,4:5)],lse$VOD, names =names(lse)[-c(1,4:5)], method = "adjr2", nbest = 5)

leaps_res <- data.frame(size = leaps1$size, adjr2 = leaps1$adjr2, leaps1$which)

head(leaps_res)

plot(adjr2~size, data=leaps_res)

leaps_res[leaps_res$size==14,]
leaps_res[leaps_res$size==15,]

leaps14 <- lm(VOD~Year+SVT+SMT+SPX+AUTO+AHT+ABDN+RMV+BATS+ANTO+BA+PRU+CPG , data = lse)
leaps15 <- lm(VOD~Year+SVT+STJ+SMT+SPX+AUTO+AHT+ABDN+RMV+BATS+ANTO+BA+PRU+CPG , data = lse)


par(mfrow=c(2,2), mar=c(4.5,4,2,2))
plot(leaps15)


newdata <- lse %>% select(VOD,SVT,STJ,SMT,SPX,AUTO,AHT,ABDN,RMV,BATS,ANTO,BA,PRU,CPG)
newdata

ggcorr(newdata,label = TRUE, label_size = 2)

 
y <- cor(newdata)
y
x <- y[1,2:14]
print(x)
x <- abs(x)
sort(x)


plot(VOD~ABDN, data=newdata)
plot(VOD~BATS, data=newdata)
plot(VOD~SPX, data=newdata)
plot(VOD~AHT, data=newdata)
plot(VOD~SVT, data=newdata)

summary(newdata)

model1 <- lm(VOD~ABDN+BATS+SPX+AHT+SVT, data= newdata)
summary(model1)
plot(model1)

summary(model1)


#box cox
library(MASS)
boxcox(model1, plotit= TRUE)







# forward selection
# intercept model
min_model <- lm(VOD~1,data=data)
add1(min_model, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min1 <- lm(VOD~ SVT,data=data)
add1(min1, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min2  <- lm(VOD~ SVT+STJ,data=data)
add1(min2, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min3 <- lm(VOD~ SVT+STJ+SMT,data=data)
add1(min3, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min4 <- lm(VOD~ SVT+STJ+SMT+MGGT,data=data)
add1(min4, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min5 <- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN,data=data)
add1(min5, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min6 <- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO,data=data)
add1(min6, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min7 <- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE,data=data)
add1(min7, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min8 <- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN,data=data)
add1(min8, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min9 <- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV,data=data)
add1(min9, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))
 
min10<- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT,data=data)
add1(min10, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min11<- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO,data=data)
add1(min11, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min12<- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO+CPG,data=data) 
add1(min12, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min13<- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO+CPG+PRU,data=data) 
add1(min13, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min14<- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO+CPG+PRU+SPX,data=data)
add1(min14, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min15<- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO+CPG+PRU+SPX+BA,data=data)
add1(min15, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min16<- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO+CPG+PRU+SPX+BA+SDR,data=data)
add1(min16, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min17 <- lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO+CPG+PRU+SPX+BA+SDR+BATS,data=data)
add1(min17, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min18 <-  lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO+CPG+PRU+SPX+BA+SDR+BATS+TSCO,data=data)
add1(min18, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min19  <-  lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO+CPG+PRU+SPX+BA+SDR+BATS+TSCO+RR,data=data)
add1(min19, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))

min20   <-  lm(VOD~ SVT+STJ+SMT+MGGT+EXPN+AUTO+SSE+ABDN+RMV+AHT+ANTO+CPG+PRU+SPX+BA+SDR+BATS+TSCO+RR+LLOY,data=data)
add1(min20, test = "F", scope = (~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB))



summary(min_model)
summary(min20)
#R squared value of fwd model
summary(min_model)$r.sq 
summary(min20)$r.sq
plot(min20)











# backward selection
# full model - so all stocks
colnames(data)

full_model <- lm(VOD~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB, data=data)
drop1(full_model, test = 'F' , scope = ~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB, data=data)

full1 <- lm(VOD~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS  +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB, data=data)
drop1(full1, test = 'F' , scope = ~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS  +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB, data=data)

full2 <- lm(VOD~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS  +RR + SMIN + ANTO + BA  + PRU + CCH + CPG + WTB, data=data)
drop1(full2, test = 'F' , scope = ~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS  +RR + SMIN + ANTO + BA  + PRU + CCH + CPG + WTB, data=data)

full3 <- lm(VOD~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU + CCH + CPG + WTB, data=data)
drop1(full3, test = 'F' , scope = ~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU + CCH + CPG + WTB, data=data)

full4 <- lm(VOD~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU + CCH + CPG + WTB, data=data)
drop1(full4, test = 'F' , scope = ~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU + CCH + CPG + WTB, data=data)

full5 <- lm(VOD~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU  + CPG + WTB, data=data)
drop1(full5, test = 'F' , scope = ~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU  + CPG + WTB, data=data)

full6 <- lm(VOD~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT  + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU  + CPG + WTB, data=data)
drop1(full6, test = 'F' , scope = ~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT  + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU  + CPG + WTB, data=data)

full7 <- lm(VOD~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT  + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU  + CPG , data=data)
drop1(full7, test = 'F' , scope = ~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT  + ABDN + RMV + LLOY + SDR  + BATS  +RR + SMIN + ANTO + BA  + PRU  + CPG , data=data)

full8 <- lm(VOD~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT  + ABDN + RMV + LLOY + SDR  + BATS  +RR  + ANTO + BA  + PRU  + CPG , data=data)
drop1(full8, test = 'F' , scope = ~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT  + ABDN + RMV + LLOY + SDR  + BATS  +RR  + ANTO + BA  + PRU  + CPG , data=data)

full9  <- lm(VOD~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT  + ABDN + RMV  + SDR  + BATS  +RR  + ANTO + BA  + PRU  + CPG , data=data)
drop1(full9, test = 'F' , scope = ~ SVT + STJ + SMT  + TSCO + EXPN + SPX + AUTO + SSE + AHT  + ABDN + RMV  + SDR  + BATS  +RR  + ANTO + BA  + PRU  + CPG , data=data)


summary(full_model)
summary(full9)
#using the step function we will eliminate under-performers

#R squared value of reduced model
summary(full_model)$r.sq 
summary(full9)$r.sq
plot(full9)











#stepwise selection

min_model <- lm(VOD~1,data=data)
step_model <-step(min_model, test = "F", scope = ~ SVT + STJ + SMT + MGGT + TSCO + EXPN + SPX + AUTO + SSE + AHT + RTO + ABDN + RMV + LLOY + SDR + ABF + BATS + ENT +RR + SMIN + ANTO + BA + PSN + PRU + CCH + CPG + WTB , direction = "both")




stepwise_model <- lm(VOD ~ ABDN + BATS + AHT + SSE + AUTO + BA + RMV + 
                     CPG + ANTO + PRU + SMIN + SPX + SMT + STJ + SVT + RR + SDR + 
                     LLOY + EXPN + TSCO, data = data)
plot(stepwise_model)
summary(stepwise_model)$r.sq
summary(step_model)$r.sq

anova(stepwise_model)








boxplot(lse$ABDN)# outliers
boxplot(lse$BATS) #no outliers 
boxplot(lse$AHT) #  outliers
boxplot(lse$SSE) #NO  outliers

boxplot(lse$AUTO) #NO  outliers
boxplot(lse$BA)#no outliers
boxplot(lse$RMV)#no outliers
boxplot(lse$CPG) # outliers

boxplot(lse$ANTO)#no outliers
boxplot(lse$PRU)#no outliers
boxplot(lse$SMIN)# lots of outliers
boxplot(lse$SPX)

boxplot(lse$SMT) #no outlier 
boxplot(lse$STJ) # outlier 
boxplot(lse$SVT)#no outliers
boxplot(lse$RR) #no outlier 

boxplot(lse$SDR) # outlier 
boxplot(lse$LLOY) # outlier 
boxplot(lse$EXPN) #no outlier 
boxplot(lse$TSCO) #no outlier 


# Function must be called predict_VOD and have these arguments
predict_VOD <- function (lse, newdata){
  
  # Make any transformations (either dependent or independent variables)
  # Tranfromations must be updated in both lse and newdata
  lse$STJ.sq <- lse$STJ^2
  newdata$STJ.sq <- newdata$STJ^2
  
  # Fit a model (note this is not a good model - just an example)
  VOD.lm <- lm(VOD ~ ABDN + BATS + AHT + SSE + AUTO  + RMV + 
                 CPG + ANTO + PRU + SMIN + SPX + SMT + STJ + SVT + RR + SDR + 
                 LLOY + EXPN + TSCO, data = data)
  # Extract and return the model predictions on the new data set
  predictions <- predict(VOD.lm, newdata = newdata)
  return(predictions)
}










































