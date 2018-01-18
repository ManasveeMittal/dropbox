
# coding: utf-8

# In[1]:

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# In[2]:

get_ipython().magic('matplotlib inline')


# In[3]:

wqr = pd.read_csv("winequality-red.csv",sep=';')
wqw = pd.read_csv("winequality-white.csv",sep=';')
f = open('winequality.names', "r")
# names = pd.read_csv("winequality.names",sep='')


# In[4]:

f.readline(5)


# In[5]:

# f = open('')
for line in iter(f):
    print(line)
f.close()


# In[6]:

print(wqr.head())
# print(wqw.head())


# In[ ]:




# In[ ]:




# In[8]:

wqr.head()


# In[9]:

wqr.info()


# In[11]:

wqr.describe()


# In[13]:

wqr_cols = list(wqr.columns)
wqr_cols


# In[ ]:




# In[ ]:



