# this is needed to load helper from the parent folder
import sys
sys.path.append('..')

# the rest of the imports
import helper as hlp
import pandas as pd
import numpy as np
import sklearn.decomposition as dc

@hlp.timeit
def reduce_PCA(x):
    '''
        Reduce the dimensions using Principal Component
        Analysis 
    '''
    # create the PCA object
    pca = dc.PCA(n_components=3, whiten=True)

    # learn the principal components from all the features
    return pca.fit(x)

# the file name of the dataset
r_filename = '../../Data/Chapter05/bank_contacts.csv'

# read the data
csv_read = pd.read_csv(r_filename)

# split into independent and dependent features
x = csv_read[csv_read.columns[:-1]]
y = csv_read[csv_read.columns[-1]]

# reduce the dimensionality
z = reduce_PCA(x)

# how much variance each component explains?
print(z.explained_variance_ratio_)

# and total variance accounted for
print(np.sum(z.explained_variance_ratio_))

# plot and save the chart
# vary the colors and markers for the points
color_marker = [('r','^'),('g','o')]

file_save_params = {
    'filename': '../../Data/Chapter05/charts/pca_3d_alt.png', 
    'dpi': 300
}

hlp.plot_components(z.transform(x), y, color_marker, 
    **file_save_params)