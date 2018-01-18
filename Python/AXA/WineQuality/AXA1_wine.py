




# """pandas or PySpark
# Q1 : Chemically speaking, what types of wine are there? What predicts wine quality?
# Here is a dataset on the matter (http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/)
# Objective Q1 :
# §  Crunch the data and present your findings 
# with an interesting visualization of the data attributes , with limitations (if any)
# §  Produce a short (max 2 page) report with an interesting visualisation of your model or results,
#  to help a non-technical audience understand your results. Bonus points on model development.
# """ 

# """
# 1. Title of Database: Wine recognition data
# 	Updated Sept 21, 1998 by C.Blake : Added attribute information

# 2. Sources:
#    (a) Forina, M. et al, PARVUS - An Extendible Package for Data
#        Exploration, Classification and Correlation. Institute of Pharmaceutical
#        and Food Analysis and Technologies, Via Brigata Salerno, 
#        16147 Genoa, Italy.

#    (b) Stefan Aeberhard, email: stefan@coral.cs.jcu.edu.au
#    (c) July 1991
# 3. Past Usage:

#    (1)
#    S. Aeberhard, D. Coomans and O. de Vel,
#    Comparison of Classifiers in High Dimensional Settings,
#    Tech. Rep. no. 92-02, (1992), Dept. of Computer Science and Dept. of
#    Mathematics and Statistics, James Cook University of North Queensland.
#    (Also submitted to Technometrics).

#    The data was used with many others for comparing various 
#    classifiers. The classes are separable, though only RDA 
#    has achieved 100% correct classification.
#    (RDA : 100%, QDA 99.4%, LDA 98.9%, 1NN 96.1% (z-transformed data))
#    (All results using the leave-one-out technique)

#    In a classification context, this is a well posed problem 
#    with "well behaved" class structures. A good data set 
#    for first testing of a new classifier, but not very 
#    challenging.

#    (2) 
#    S. Aeberhard, D. Coomans and O. de Vel,
#    "THE CLASSIFICATION PERFORMANCE OF RDA"
#    Tech. Rep. no. 92-01, (1992), Dept. of Computer Science and Dept. of
#    Mathematics and Statistics, James Cook University of North Queensland.
#    (Also submitted to Journal of Chemometrics).

#    Here, the data was used to illustrate the superior performance of
#    the use of a new appreciation function with RDA. 

# 4. Relevant Information:

#    -- These data are the results of a chemical analysis of
#       wines grown in the same region in Italy but derived from three
#       different cultivars.
#       The analysis determined the quantities of 13 constituents
#       found in each of the three types of wines. 

#    -- I think that the initial data set had around 30 variables, but 
#       for some reason I only have the 13 dimensional version. 
#       I had a list of what the 30 or so variables were, but a.) 
#       I lost it, and b.), I would not know which 13 variables
#       are included in the set.

#    -- The attributes are (dontated by Riccardo Leardi, 
# 	riclea@anchem.unige.it )
#  	1) Alcohol
#  	2) Malic acid
#  	3) Ash
# 	4) Alcalinity of ash  
#  	5) Magnesium
# 	6) Total phenols
#  	7) Flavanoids
#  	8) Nonflavanoid phenols
#  	9) Proanthocyanins
# 	10)Color intensity
#  	11)Hue
#  	12)OD280/OD315 of diluted wines
#  	13)Proline            

# 5. Number of Instances

#       	class 1 59
# 	class 2 71
# 	class 3 48

# 6. Number of Attributes 
	
# 	13

# 7. For Each Attribute:

# 	All attributes are continuous
	
# 	No statistics available, but suggest to standardise
# 	variables for certain uses (e.g. for us with classifiers
# 	which are NOT scale invariant)

# 	NOTE: 1st attribute is class identifier (1-3)

# 8. Missing Attribute Values:

# 	None

# 9. Class Distribution: number of instances per class

#       	class 1 59
# 	class 2 71
# 	class 3 48
# """

# 2. Import libraries and modules
import time
time_zero=time.time()

import numpy as np
import pandas as pd
 
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
from sklearn.ensemble import RandomForestRegressor
from sklearn.pipeline import make_pipeline
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.externals import joblib

 
# 3. Load red wine data.
dataset_url_w = 'http://mlr.cs.umass.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv'
dataset_url_r = 'http://mlr.cs.umass.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv'

dataset_path_w = '/home/manavee/Dropbox/Python/AXA/WineQuality/winequality-white.csv'
dataset_path_r = '/home/manavee/Dropbox/Python/AXA/WineQuality/winequality-red.csv'

time_one=time.time()
data = pd.read_csv(dataset_path_w, sep=';')

time_read=time.time()
# 4. Split data into training and test sets
y = data.quality
X = data.drop('quality', axis=1)
X_train, X_test, y_train, y_test = train_test_split(X, y, 
                                                    test_size=0.2, 
                                                    random_state=123, 
                                                    stratify=y)
time_split=time.time()
# 5. Declare data preprocessing steps
pipeline = make_pipeline(preprocessing.StandardScaler(), 
                         RandomForestRegressor(n_estimators=100))
 
# 6. Declare hyperparameters to tune
hyperparameters = { 'randomforestregressor__max_features' : ['auto', 'sqrt', 'log2'],
                  'randomforestregressor__max_depth': [None, 5, 3, 1]}
 
time_model_zero=time.time()
# 7. Tune model using cross-validation pipeline
clf = GridSearchCV(pipeline, hyperparameters, cv=10)
 
clf.fit(X_train, y_train)
time_model_train=time.time()
 
# 8. Refit on the entire training set
# No additional code needed if clf.refit == True (default is True)
 
# 9. Evaluate model pipeline on test data
pred = clf.predict(X_test)
print(r2_score(y_test, pred))
print(mean_squared_error(y_test, pred))
 
time_model_eval=time.time()
 
# 10. Save model for future use
joblib.dump(clf, 'rf_regressor.pkl')

# To load: clf2 = joblib.load('rf_regressor.pkl')

time_end=time.time()



#DELETE________//////////////////////////----------------------
# HTTPS://ELITEDATASCIENCE.COM/PYTHON-MACHINE-LEARNING-TUTORIAL-SCIKIT-LEARN

time_list = [time_zero,time_one,time_read,time_split,time_model_zero,time_model_train,time_model_eval,time_end]
for i in range(len(time_list)-1):
   print(str(time_list[i+1]-time_list[i]))