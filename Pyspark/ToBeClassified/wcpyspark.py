#! /bin/python
from pyspark import SparkContext
sc =SparkContext()

# coding: utf-8

# <a href="https://cognitiveclass.ai"><img src = "https://ibm.box.com/shared/static/fkoyfj9zjc6bv318jfdbg1dijpg4ml9e.png" width = 400> </a>

# <h1 align = "center"> Spark Fundamentals 1 - Introduction to Spark</h1>
# <h2 align = "center"> Lab 1. Getting Started</h2>
# <h4 align = "center"> June 08, 2017 </h4>
# <br align = "left">
# 
# **Related free online courses:**
# 
# Related courses can be found in the following learning paths:
# 
# - [Spark Fundamentals path](https://cognitiveclass.ai/learn/spark/)
# - [Big Data Fundamentals path](https://cognitiveclass.ai/learn/big-data/) 
# 
# <img src = "http://spark.apache.org/images/spark-logo.png", height = 100, align = 'left'>

# ## Welcome to Spark Fundamentals - Introduction to Spark. 
# 
# ## Spark is built around speed and the ease of use. In these labs you will see for yourself how easy it is to get started using Spark. 
# 
# Spark’s primary abstraction is a distributed collection of items called a Resilient Distributed Dataset or RDD. In a subsequent lab exercise, you will learn more about the details of RDD. RDDs have actions, which return values, and transformations, which return pointers to new RDD.
# 
# This set of labs uses Cognitive Class Labs (formerly known as BDU Labs) to provide an interactive environment to develop applications and analyze data. It is available in either Scala or Python shells. Scala runs on the Java VM and is thus a good way to use existing Java libraries. In this lab exercise, we will set up our environment in preparation for the later labs.
# 
# After completing this set of hands-on labs, you should be able to:
# 
# o Start the Spark shell with Scala and Python
# 
# o Perform basic RDD actions and transformations
# 
# o Use caching to speed up repeated operations
# 
# 
# ### Using this notebook
# 
# This is an interactive environment where you can show your code through cells, and documentation through markdown.
# 
# Look at the top right corner. Do you see "Python 2"? This indicates that you are running Python in this notebook.
# 
# **To run a cell:** Shift + Enter
# 
# ### Try creating a new cell below.
# 
# **To create a new cell:** In the menu, go to _"Insert" > "Insert Cell Below"_. Or, click outside of a cell, and press "a" (insert cell above) or "b" (insert cell below).

# # Lab Setup
# 
# Run the following cells to get the lab data.

# In[5]:

# download the data from the IBM server
# this may take ~30 seconds depending on your internet speed
#get_ipython().system(u'wget --quiet https://ibm.box.com/shared/static/1c65hfqjxyxpdkts42oab8i8mzxbpvc8.zip')
#print "Data Downloaded!"


# In[6]:

# unzip the folder's content into "resources" directory
# this may take ~30 seconds depending on your internet speed
#get_ipython().system(u'unzip -q -o -d /resources 1c65hfqjxyxpdkts42oab8i8mzxbpvc8.zip')
#print "Data Extracted!"


# In[9]:

# list the extracted files
#get_ipython().system(u'ls -1 /resources/LabData/')


# Should have:
#     
# * followers.txt
# * notebook.log
# * nyctaxi100.csv
# * nyctaxi.csv
# * nyctaxisub.csv
# * nycweather.csv
# * pom.xml
# * README.md
# * taxistreams.py
# * users.txt

# ### Starting with Spark
# 
# The notebooks provide code assist. For example, type in "sc." followed by the Tab key to get the list of options associated with the spark context:

# In[2]:

#sc.


# To run a command as code, simple select the cell you want to run and either:
# 
# * Click the play button in the toolbar above
# * Press "_Shift+Enter_"
# 
# Let's run a basic command and check the version of Spark running:

# In[10]:

print(sc.version)


# You can import files into your lab in three ways:
# 
# 1. Drag and drop a file from your file explorer onto the browser. This will upload the file to your lab.
# 2. Enter the url of a file on the internet into the text field in the upper right of the screen.
# 3. Run code (such as wget) to download a file into your notebook.

# Click on the left arrow, next to the **tags** icon on the top right. You should see **Recent Data** section.
# 
# Download the following file by pasting the link in the search field at the top right of the page and pressing ENTER:
# 
# https://raw.githubusercontent.com/apache/spark/master/README.md
# 
# You should see the file, "README.md", show up in under **Recent Data**. You can delete this file now by clicking the twistie on README.md and choosing delete.
# 
# Select the space between the double quotes in the cell below then, click the twistie next to the "README.md" in **Recent Data** and select _Insert Path_ to paste the path below. Then, run the code in the cell.
# 

# In[15]:

readme = sc.textFile("/home/triloq/spark-2.2.0-bin-hadoop2.7/README.md")


# Let’s perform some RDD actions on this text file. Count the number of items in the RDD using this command:

# In[16]:

readme.count()


# You should see that this RDD action returned a value of 103.
# 
# Let’s run another action. Run this command to find the first item in the RDD:

# In[17]:

readme.first()


# Now let’s try a transformation. Use the filter transformation to return a new RDD with a subset of the items in the file. Type in this command:

# In[19]:

linesWithSpark = readme.filter(lambda line: "Spark" in line)


# You can even chain together transformations and actions. To find out how many lines contains the word “Spark”, type in:

# In[20]:

linesWithSpark = readme.filter(lambda line: "Spark" in line)
readme.filter(lambda line: "Spark" in line).count()


# # More on RDD Operations
# 
# This section builds upon the previous section. In this section, you will see that RDD can be used for more complex computations. You will find the line from that "README.md" file with the most words in it.
# 
# Run the following cell.

# In[21]:

readme.map(lambda line: len(line.split())).reduce(lambda a, b: a if (a > b) else b)


# There are two parts to this. The first maps a line to an integer value, the number of words in that line. In the second part reduce is called to find the line with the most words in it. The arguments to map and reduce are Python anonymous functions (lambdas), but you can use any top level Python functions. In the next step, you’ll define a max function to illustrate this feature.
# 
# Define the max function. You will need to type this in:

# In[22]:

def max(a, b):
 if a > b:
    return a
 else:
    return b


# Now run the following with the max function:

# In[23]:

readme.map(lambda line: len(line.split())).reduce(max)


# Spark has a MapReduce data flow pattern. We can use this to do a word count on the readme file.

# In[35]:

#wordCounts = readme.flatMap(lambda line: line.split()).map(lambda word: (word, 1))
#wordCounts.collect()


# Here we combined the flatMap, map, and the reduceByKey functions to do a word count of each word in the readme file.
# 
# To collect the word counts, use the _collect_ action.
# 
# #### It should be noted that the collect function brings all of the data into the driver node. For a small dataset, this is acceptable but, for a large dataset this can cause an Out Of Memory error. It is recommended to use collect() for testing only. The safer approach is to use the take() function e.g. print take(n)

# In[39]:

#w=wordCounts.reduceByKey(lambda a, b: a+b).reduce(lambda a,b : a if (a>b) else b)

#w


# ### <span style="color: red">YOUR TURN:</span> 
# 
# #### In the cell below, determine what is the most frequent word in the README, and how many times was it used?

# In[48]:

# WRITE YOUR CODE BELOW
wordCount = readme.flatMap(lambda line: line.split()).map(lambda word : (word,1)).reduceByKey(lambda a,b : a+b).map(lambda a,b:(b,a)).sortByKey(ascending = False)
wordCount.first()


# Highlight text field for answer: (24, u'the')

# ## Using Spark caching
# 
# In this short section, you’ll see how Spark caching can be used to pull data sets into a cluster-wide in-memory cache. This is very useful for accessing repeated data, such as querying a small “hot” dataset or when running an iterative algorithm. Both Python and Scala use the same commands.
# 
# As a simple example, let’s mark our linesWithSpark dataset to be cached and then invoke the first count operation to tell Spark to cache it. Remember that transformation operations such as cache does not get processed until some action like count() is called. Once you run the second count() operation, you should notice a small increase in speed.
# 

# In[49]:

print (linesWithSpark.count())


# In[50]:

from timeit import Timer
def count():
    return linesWithSpark.count()
t = Timer(lambda: count())


# In[51]:

print (t.timeit(number=50))


# In[52]:

linesWithSpark.cache()
print (t.timeit(number=50))


# It may seem silly to cache such a small file, but for larger data sets across tens or hundreds of nodes, this would still work. The second linesWithSpark.count() action runs against the cache and would perform significantly better for large datasets.
# 
# ### Summary
# Having completed this exercise, you should now be able to log in to your environment and use the Spark shell to run simple actions and transformations for Scala and/or Python. You understand that Spark caching can be used to cache large datasets and subsequent operations on it will utilize the data in the cache rather than re-fetching it from HDFS.

# This notebook is part of the free course on **Cognitive Class** called *Spark Fundamentals I*. If you accessed this notebook outside the course, you can take this free self-paced course, online by going to: https://cognitiveclass.ai/courses/what-is-spark/

# ### About the Authors:  
# Hi! It's [Alex Aklson](https://www.linkedin.com/in/aklson/), one of the authors of this notebook. I hope you found this lab educational! There is much more to learn about Spark but you are well on your way. Feel free to connect with me if you have any questions.
# <hr>


