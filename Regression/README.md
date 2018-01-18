Topics
regression_ann
regression_cart
regression_knn
regression_linear_alternative
regression_linear
regression_multicollinearity
regression_ols_alternative
regression_ols
regression_randomForest
regression_svm_alternative
regression_svm

BlogPosts






KeyWords:
	-leave one-out cross-validation:
	-Mean square error:
	-Maximum Likelihood estimate (MLE)(Logistic Regression) :
		-The MLE may not be unique.
		-The MLE may not be a turning point i.e. may not be a point at which the first derivative of the likelihood (and log-likelihood) function vanishes.
	-R-squared(Linear Regression):
	-Adjusted R square(Linear regression):
		-“R squared” individually can’t tell whether a variable is significant or not because each time when we add a feature, “R squared” can either increase or stay constant. But, it is not true in case of “Adjusted R squared” (increases when features found to be significant).
	-goodness of fit
	-residuals:
		-Sum and hence Mean of residuals is always zero
		-There should not be any relationship between predicted values and residuals
	-Heteroskedasticity:
		-The presence of non-constant variance in the error terms
		-Generally, non-constant variance arises because of presence of outliers or extreme leverage values
	-Correlation:
		-Range[-1,1]
		-signifies that the relationship between variables is fairly strong.
		-Correlated variables can have zero correlation coeffficient for non-linear relationship
	-t-statistics 
		measure how strong is the evidence that there is non zero association. Even a weak effect can be extremely significant given enough data
	--p-value
	-Linear regression assumptions:
		-The true relationship between dependent y and predictor x is linear
		-The model errors are statistically independent
		-The errors are normally distributed with a 0 mean and constant standard deviation
		-The predictor x is non-stochastic and is measured error-free
	-Scatter plot: test the linear relationship between continuous/quantative variables
	-Linear regression: predicts Continuous dependent variable
	-Logistic Regression: predicts Categorical dependent variable
	-least square line fit:
	-Vertical offset : least square line fit in Linear regression
	-Perpendicular offset:Principal Component analysis
	-Polynomial regression:
		-if polynomial of degree n(say n=3) perfectly fits the data
			=> Polynomial of degree EQUAL TO 3 will have low bias and Low variance
			=> Polynomial of degree LESS THAN 3 will have high bias and low variance
			=> Polynomial of degree MORE THAN 3 will have low bias and high variance
	-bias-variance trade-off
	-Overfitting:
		-Possible reasons:
			-With small training dataset, it’s easier to find a hypothesis to fit the training data exactly i.e. overfitting.
	-Underfitting:
		-Possible Reasons:
			 -When hypothesis space is small, it has higher bias and lower variance. So, it’s less likely to find a hypothesis to fit the data exactly i.e. underfitting
	-hypothesis space:
	-regularization parameter:
	-Lasso regression:
		-Lasso regression uses subset selection of features
		-Big feature values =⇒ smaller coefficients =⇒ less lasso penalty =⇒ more likely to have be kept
		-Lasso does not admit a closed-form solution 
	-Ridge regression:
		-use all predictors in final model
		-tuning parameter lambda to reduce model complexity
		-larger lambda -> less modelcomplexity
		-lambda = 0 -> linear regression
	-feature selection
	-Robustness
	- Evaluation Statistics:
		-Regression:
			-R Squared
			-Adjusted R Squared
			-F Statistics
			-RMSE / MSE / MAE
	-Normal Equation metod:
		-compute the coefficient of linear regression
		-We don’t have to choose the learning rate
		-It becomes slow when number of features is very large
		-No need to iterate
	-feature independece
		-zero interaction among Xi's
		-if Y_hat = β0 +  β1 X1 + β2 X2……+ βn X:
			-If Xi changes by an amount ∆Xi, holding other variables constant, then the expected value of Y changes by a proportional amount βi ∆Xi, for some constant βi (which in general could be a positive or negative number).
			-Given n( number of features) is contant,The value of βi is always the same, regardless of values of the other X’s.
			-The total effect of the X’s on the expected value of Y is the sum of their separate effects.
	-Feature addition:
		-Training accuracy always increases or remain same
		-testing accuracy increases if feature is found to be significant.
	-SSE (sum of the squared errors of prediction)
		-SummationOf [ (y_hat_i -y_i)**2 ]
			-y_hat_i -> predicted y value for observation i
			-y_i     -> actual y for observation i
	-Median
	-Quartiles
	-N-tiles
	-IQR
	-(Median - 1.5*IQR, Median + 1.5*IQR)
	-Regression vs Correlation:
		-Correlation -> symmetric realtion as Correlation is a statistic metric
		-regression -> not symmetric as regression  is setup to predict y from x
	-Anscombe's quartet: 
		- four datasets that have nearly identical simple descriptive statistics, yet appear very different when graphed
		- importance of graphing data before analyzing it 
		- effect of outliers on statistical properties
	-Simple linear regression model:
		-One independent variable
	-Sigmoid function:
		-f(x) = 1/(1+ exp(-x))
		-used to convert output probability between [0,1] in logistic regression
	-Probit:
	-One-vs-rest method:
		-n-class classification problem
		-n models
		-probability of each category is predicted over the rest of the categories combined 
	-Intercept: B0
	-Bi for 1<=i<=n(num features) are variable coefficients
	-E error-term




Budding Data Scientist |✔ R |✔ Python |✔ Machine Learning | ✔ NoSql |✔ S









