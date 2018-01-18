
# coding: utf-8

# In[1]:
from pyspark.sql import SparkSession
# $example on$
if __name__ == "__main__":
    spark = SparkSession\
        .builder\
        .appName("BinarizerExample")\
        .getOrCreate()


import pandas as pd
import re
from time import time
from pprint import pprint


# In[2]:

from pyspark.mllib.fpm import FPGrowth


# In[51]:

#config
datafile = '/home/triloq/Documents/Transaction Classification Problem/dataset_5BCDE.csv'
processed_data_out='/home/triloq/Documents/Transaction Classification Problem/Processed_1M.csv'
fp_tree_1M = '/home/triloq/Documents/Transaction Classification Problem/fp_tree_1M.csv'

parts = 10
num_obs=10


# In[7]:

num_rep='\d{4,}'


# In[52]:

data = spark.textFile(datafile,minPartitions=parts)
data = data.cache()

header = data.first()
data = data.filter(lambda line: line != header)
# print(data.take(num_obs),'\n')
data = data.map(lambda x: x.split("|"))
# print(data.take(num_obs),'\n')
data = data.map(lambda x: x[1])
# print(data.take(num_obs),'\n')
data = data.map(lambda line:re.sub('[^A-Za-z0-9]+', ',', line))
print(data.take(num_obs),'\n')
data = data.map(lambda line:re.sub(num_rep, 'NUM', line))
print(data.take(num_obs),'\n')
data = data.map(lambda line: line.lower().strip().split(',')[:3])
print(data.take(num_obs),'\n')
data = data.map(lambda line: [elem+'_P'+str(idx+1) for (elem,idx) in zip(line,range(len(line)))])
print(data.take(num_obs),'\n')


# In[53]:

datamodel = FPGrowth.train(data,minSupport=0.001,numPartitions=10)


# In[9]:

# data.saveAsTextFile(processed_data_out)


# In[10]:

#df=data.toDF()
# data.take(100)
#data.getNumPartitions()


# In[15]:

#df.head(4),df.first()


# In[54]:

result = datamodel.freqItemsets().collect()
print(len(result))
print(result[:10],result[-10:])


# In[55]:

data_length = data.count()
print(data_length)


# In[56]:

#creating list of fp_tree
fp_tree_list =[[item[0],item[1],round(100*item[1]/data_length,3)] for item in result]
len(fp_tree_list)
pprint(fp_tree_list[:5])


# In[20]:

#create dictionary of Fp tree
# fp_tree_dict = {}
# i=0
# for elem in result:
#     i+=1
#     fp_tree_dict[str(elem[0])]=[elem[1],round(100*elem[1]/data_length,2)]
# result[0][1]
# print(fp_tree_dict.items())


# In[62]:

#creating dataframe of FP tree
import pandas as pd
fp_df = pd.DataFrame(fp_tree_list,columns=['tree_map', 'absolute_support', 'support_ratio'])
print(fp_df.head())


# In[63]:

fp_df['num_Ps']=fp_df['tree_map'].apply(lambda x:len(x))


# In[64]:

fp_df.head(20)


# In[65]:

fp_df.num_Ps.value_counts()


# In[61]:

fp_df.groupby('num_Ps').agg('mean')


# In[66]:

def create_elem(l,i):
    if len(l) > i:
        return l[i]
    else:
        return ''


# In[67]:

fp_df['Key_1'] = fp_df['tree_map'].apply(lambda l:l[0])
fp_df['Key_2'] = fp_df['tree_map'].apply(create_elem,args=(1,))
fp_df['Key_3'] = fp_df['tree_map'].apply(create_elem,args=(2,))

print(len(fp_df[fp_df['Key_3'] != '']))
print(fp_df[fp_df['Key_3'] != ''])


# In[68]:


fp_df.to_csv(fp_tree_1M,sep = '|')

