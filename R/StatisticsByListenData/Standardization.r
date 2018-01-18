#R Code : Standardize a variable using Z-score
# Creating a sample data
set.seed(123)
X =data.frame(k1 = sample(100:1000,1000, replace=TRUE),
              k2 = sample(10:100,1000, replace=TRUE))
X.scaled = scale(X, center= TRUE, scale=TRUE)

#n scale() function, 
#center= TRUE implies subtracting the mean from its original variable. 
#The scale = TRUE implies dividing the centered column by its standard deviations.

colMeans(X.scaled)
var(X.scaled)

library(dplyr)
mins= as.integer(summarise_all(X, min))
rng = as.integer(summarise_all(X, function(x) diff(range(x))))
X_min_max_sclaed = data.frame(scale(X, center= mins, scale=rng))
summarise_all(X_min_max_sclaed, funs(min, max))
colMeans(X_Min_MaX)
var(X_Min_MaX)



X_stdev_scaled = data.frame(scale(X, center= FALSE , scale=apply(X, 2, sd, na.rm = TRUE)))
summarise_all(X_stdev_scaled, var)


#library(dplyr)
rng = as.integer(summarise_all(X, function(x) diff(range(x))))
X_range_scaled = data.frame(scale(X, center= FALSE, scale=rng))
summarise_all(X_range_scaled, var)



# Create Sample Data
set.seed(123)
train <- data.frame(X1=sample(1:100,1000, replace=TRUE),
                    X2=1e2*sample(1:500,1000, replace=TRUE),
                    X3=1e-2*sample(1:100,1000, replace=TRUE))
train$y <- with(train,2*X1 + 3*1e-2*X2 - 5*1e2*X3 + 1 + rnorm(1000,sd=10))

#Fit linear regression model
fit  <- lm(y~X1+X2+X3,train)
summary(fit)

# Standardize predictors
means   <- sapply(train[,1:3],mean)
stdev <- sapply(train[,1:3],sd)
train.scaled <- as.data.frame(scale(train[,1:3],center=means,scale=stdev))
head(train.scaled)
train.scaled$y <- train$y
#Fit Scaled Data
fit.scaled <- lm(y ~ X1 + X2 + X3, train.scaled)
summary(fit.scaled)