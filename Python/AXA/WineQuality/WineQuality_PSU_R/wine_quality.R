SAMPLE R CODE FOR EDA

attach(WhiteWine)
par(mfrow=c(2,2), oma = c(1,1,0,0) + 0.1, mar = c(3,3,1,1) + 0.1)
barplot((table(quality)), col=c("slateblue4", "slategray", "slategray1", "slategray2", "slategray3", "skyblue4"))
mtext("Quality", side=1, outer=F, line=2, cex=0.8)
truehist(fixed.acidity, h = 0.5, col="slategray3")
mtext("Fixed Acidity", side=1, outer=F, line=2, cex=0.8)
truehist(volatile.acidity, h = 0.05, col="slategray3")
mtext("Volatile Acidity", side=1, outer=F, line=2, cex=0.8)
truehist(citric.acid, h = 0.1, col="slategray3")
mtext("Citric Acid", side=1, outer=F, line=2, cex=0.8)
par(mfrow=c(1,5), oma = c(1,1,0,0) + 0.1,  mar = c(3,3,1,1) + 0.1)
boxplot(fixed.acidity, col="slategray2", pch=19)
mtext("Fixed Acidity", cex=0.8, side=1, line=2)
boxplot(volatile.acidity, col="slategray2", pch=19)
mtext("Volatile Acidity", cex=0.8, side=1, line=2)
boxplot(citric.acid, col="slategray2", pch=19)
mtext("Citric Acid", cex=0.8, side=1, line=2)
boxplot(residual.sugar, col="slategray2", pch=19)
mtext("Residual Sugar", cex=0.8, side=1, line=2)
boxplot(chlorides, col="slategray2", pch=19)
mtext("Chlorides", cex=0.8, side=1, line=2)


SAMPLE R CODE FOR SUMMARY STATISTICS & CORRELATIONS

summary(WhiteWine)
library("psych", lib.loc="C:/Users/sbasu/Documents/R/R-3.1.0/library")
describe(WhiteWine)
cor(WhiteWine[,-12])
cor(WhiteWine[,-12], method="spearman")
pairs(WhiteWine[,-12], gap=0, pch=19, cex=0.4, col="darkblue")
title(sub="Scatterplot of Chemical Attributes", cex=0.8)

Sample R code for Preparing Data

limout <- rep(0,11)
for (i in 1:11){
t1 <- quantile(WhiteWine[,i], 0.75)
t2 <- IQR(WhiteWine[,i], 0.75)
limout[i] <- t1 + 1.5*t2
}
WhiteWineIndex <- matrix(0, 4898, 11)
for (i in 1:4898)
for (j in 1:11){
if (WhiteWine[i,j] > limout[j]) WhiteWineIndex[i,j] <- 1
}
WWInd <- apply(WhiteWineIndex, 1, sum)
WhiteWineTemp <- cbind(WWInd, WhiteWine)
Indexes <- rep(0, 208)
j <- 1
for (i in 1:4898){
if (WWInd[i] > 0) {Indexes[j]<- i
j <- j + 1}
else j <- j
}
WhiteWineLib <-WhiteWine[-Indexes,]   # Inside of Q3+1.5IQR
indexes = sample(1:nrow(WhiteWineLib), size=0.5*nrow(WhiteWineLib))
WWTrain50 <- WhiteWineLib[indexes,]
WWTest50 <- WhiteWineLib[-indexes,]


//////////////////////////////////////////////////////////////////////////////////////////////






Sample R code for Multiple Regression

Qfit1 <- lm(quality ~ ., data=WWTrain50)
summary(Qfit1)
vif(Qfit1)
Qfit3 <- step(lm(quality ~ 1, WWTrain50), scope=list(lower=~1,  upper = ~fixed.acidity+volatile.acidity+citric.acid+residual.sugar+chlorides+free.sulfur.dioxide+total.sulfur.dioxide+pH+sulphates+alcohol), direction="forward")
Qfit4 <- lm(quality ~ alcohol + volatile.acidity + residual.sugar + free.sulfur.dioxide +
sulphates + chlorides + pH , data=WWTrain50)
summary(Qfit4)
vif(Qfit4)
Qfit5 <- lm(quality ~ alcohol + volatile.acidity + residual.sugar + rt.sulfur.dioxide +
sulphates + chlorides + pH , data=WWTrain50)
summary(Qfit5)
vif(Qfit5)
par(mfrow=c(1,2), oma = c(3,2,3,2) + 0.1, mar = c(1,1,1,1) + 0.1)
truehist(residuals(Qfit4), h = 0.25, col="slategray3")
qqPlot(residuals(Qfit4), pch=19, col="darkblue", cex=0.6)
mtext("Distribution of Residuals", outer=T, side=1, line = 2)
par(mfrow=c(1,1))
pred.val <- round(fitted(Qfit4))
plot(pred.val, residuals(Qfit4))
ts.plot(residuals(Qfit4))
residualPlots(Qfit4, pch=19, col="blue", cex=0.6)
influencePlot(Qfit4,  id.method="identify", main="Influence Plot", sub="Circle size is proportial to Cook's Distance" )
boxcox(lm(quality~alcohol), data=WWTrain50, lambda=seq(-0.2, 1.0, len=20), plotit=T)
std.del.res<-studres(Qfit4)
truehist(std.del.res, h = 0.25, col="slategray3")
mtext("Histigram of Studentized Deleted Residuals", side=1, line=2, cex=0.8)
d.fit <- dffits(Qfit4)
truehist(std.del.res, h = 0.25, col="slategray3")
truehist(d.fit, h = 0.25, col="slategray3")
mtext("Histigram of Studentized Deleted Residuals", side=1, line=2, cex=0.8)
cook.d <- cooks.distance(Qfit4)
ts.plot(cook.d)
par(mfrow=c(1,2), oma = c(3,2,3,2) + 0.1, mar = c(1,1,1,1) + 0.1)
truehist(std.del.res, h = 0.55, col="slategray3")
mtext("Studentized Deleted Residuals", side=1, line=2, cex=0.8)
truehist(d.fit, h = 0.05, col="slategray3")
mtext("DFITS", side=1, line=2, cex=0.8)
par(mfrow=c(1,1), oma = c(3,2,3,2) + 0.1, mar = c(1,1,1,1) + 0.1)
ts.plot(cook.d, col="dark blue")


Sample R code for Final Model

Qfit6 <- lm(quality ~ poly(alcohol,2) + poly(volatile.acidity,2) + residual.sugar + poly(free.sulfur.dioxide,2) + chlorides + sulphates + poly(pH,2), data=WWTrain50In)
summary(Qfit6)
residualPlots(Qfit6, pch=19, col="blue", cex=0.6)

//////////////////////////////////////////////////////////////////////////////////////////////
