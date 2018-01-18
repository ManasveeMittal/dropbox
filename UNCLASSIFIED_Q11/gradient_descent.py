"""#def gadientDescentMulti(X, y, theta=[], alpha, num_iters =10): #theta as series
    # GRADIENT DESCENT FOR NEURAL NETWORKS
    # ADIENTDESCENTMULTI Performs gradient descent to predict best theta
    
    # X  := features represented as a pandas dataframe | convert non numeric categorical and ordinal featuires into numeric features
    # y  := output labels vector as a pandas series
    # theta := define  initial theta
    # I := num of observations = len(X)
    # J := number of features 
    # i = 1,2,...I 
    # j = 1,2,...J
    # num_iters = max num of interation to get appropriate output theta
    # alpha := (positive float value) determine rate of converge, can be from  [...,0.01,0.03,0.1,0.3,..]
    
    
    # X_scaled := X scaled by (X-mean(X))/(max(X)-min(X)) such that each X[:,j] feature
    # y_scaled : y scaled as above
    # generally 1 < max(X_scaled[:,J]) < 3 and -3 < min(X_scaled[:,J]) < -1 represent  
    
    # make a temp list: feature_classify = []
    # len(feature_classify) = num of features = J
    # len(test each feature X[:,j] is 
    
    # simple algorithm for theta initialization
    # theta = panda series similar to X_scaled.mean(axis=1)  #good for linear approximation
     
    # define cost function #assuming linear

    return theta #best prediction

    """

# INBUILT SCIKIT STOCHASTIC GRADIENT DESCENT
# HTTP://SCIKIT-LEARN.ORG/STABLE/MODULES/SGD.HTML

import pandas as pd
import matplotlib as plt
import numpy as np

raw_data = pd.read_csv('/home/triloq/Dropbox/life_guide/ML/ML_andrew_ng/machine-learning-ex1/ex1/ex1data1.txt',header=None,names=['xi','yi'])

# print(raw_data.head(10))
# print(raw_data.dtypes)  


#write an algo to transform non_numeric features to numeric and ignore certain feature not needed

cost=0
num_obs=len(raw_data)
# print(num_obs)
# isinstance(raw_data, pd.DataFrame)

X = raw_data.iloc[:,0:-1]
Y = raw_data.iloc[:,-1]
# print(X.head())
# print(Y.head())

X['x0'] = pd.DataFrame(np.ones(num_obs))
# print(X)

theta =np.matrix([0.5,0.5])
# print(theta)

X=np.matrix(X.values)
Y=np.matrix(Y.values)

# print(X.shape, theta.shape, Y.shape)

# function J = computeCost(X, y, theta)
# %COMPUTECOST Compute cost for linear regression
# %   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
# %   parameter for linear regression to fit the data points in X and y

# % Initialize some useful values
# m = length(y); % number of training examples

# % You need to return the following variables correctly 
# J = 0;

# % ====================== YOUR CODE HERE ======================
# % Instructions: Compute the cost of a particular choice of theta
# %               You should set J to the cost.

# predictions = X * theta;
# sqrErrors = (predictions - y).^2;

# J = 1 / (2*m) * sum(sqrErrors);



# % =========================================================================

# end

def computeCostMulti(X_scaled, y_scaled, theta, num_obs):
    error_squared = np.power(((X_scaled * theta.T) - y_scaled), 2)
    return  np.sum(error_squared)/ (2 * num_obs)

# print(computeCostMulti(np.ones(4),np.ones(4),np.array([0.5]),4))
    

# computeCostMulti(X,Y,theta,num_obs)
# print(theta.shape[1])
# print(theta.ravel())
# print(theta.ravel().shape[1])

def gradientDescent(X, Y, theta, alpha, iters):  
    temp = np.matrix(np.zeros(theta.shape))
    print(temp)
    parameters = int(theta.ravel().shape[1])
    print(parameters)
    cost = np.zeros(iters)
    print(cost)

    for i in range(iters):
        error = (X * theta.T) - Y
        print(error)

        for j in range(parameters):
            term = np.multiply(error, X[:,j])
            temp[0,j] = theta[0,j] - ((alpha / len(X)) * np.sum(term))

        theta = temp
        cost[i] = computeCostMulti(X, Y, theta, len(X))

    return theta, 


iters=10

alpha =0.01

print(gradientDescent(X,Y,theta,alpha,1))
"""

cost = np.zeros(iters)

for i in range(iters):
        error = (X * theta.T) - Y
        # print(error)
        for j in range(parameters):
            term = np.multiply(error, X[:,j])
            # print(temp)
            temp[0,j] = theta[0,j] - ((alpha / len(X)) * np.sum(term))
        theta = temp
        cost[i] = computeCostMulti(X, Y, theta, num_obs)
"""

#print(theta,cost)


# function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
# %GRADIENTDESCENT Performs gradient descent to learn theta
# %   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
# %   taking num_iters gradient steps with learning rate alpha

# % Initialize some useful values
# m = length(y); % number of training examples
# J_history = zeros(num_iters, 1);

# for iter = 1:num_iters

#     % ====================== YOUR CODE HERE ======================
#     % Instructions: Perform a single gradient step on the parameter vector
#     %               theta. 
#     %
#     % Hint: While debugging, it can be useful to print out the values
#     %       of the cost function (computeCost) and gradient here.
#     %


#     htheta = X * theta;
#     theta0 = theta(1) - alpha / m * sum((htheta - y) .* X(:,1));
#     theta1 = theta(2) - alpha / m * sum((htheta - y) .* X(:,2)); 
#     theta = [theta0; theta1];




#     % ============================================================

#     % Save the cost J in every iteration    
#     J_history(iter) = computeCost(X, y, theta);

# end

# end

