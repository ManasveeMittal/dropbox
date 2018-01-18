#App name on UI @ spark://master:7077
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("FP_growth").getOrCreate()

#Required Python Modules
import re
from time import time
from pprint import pprint
from datetime import datetime
from collections import Counter

#Required Pyspark modules
from pyspark.mllib.fpm import FPGrowth
from pyspark.sql.functions import trim,split,regexp_replace,trim,lower,col,collect_set,udf,struct
from pyspark.sql import Row,Column
from pyspark.sql.types import *


#config to be parsed from a Config object
datafile = '/home/test/Documents/dataset_5BCDE.csv'
num_obs=100
num_rep='\d{4,}'
comma_rep=',{1,}'
# datafile = '/home/triloq/Documents/dataset_5BCDE.csv'
# x = spark.read.csv(datafile,sep='|')

df= spark.read.load(datafile,format="text")
print(df.show())
print(df.printSchema())
print(df.columns)


head_10K_0 = df #spark.createDataFrame(df.head(100000))
split_col = split(head_10K_0['value'], '\|')
head_10K_0 = head_10K_0.withColumn('Date', split_col.getItem(0)).withColumn('Txn_description', split_col.getItem(1)).withColumn('User_ID', split_col.getItem(2)).drop('value')

print(head_10K_0.show())
print(head_10K_0.printSchema())
print(head_10K_0.columns)

head_10K_1 = head_10K_0.select('Txn_description')
head_10K_1 = head_10K_1.withColumn("Txn_description", trim(lower(col("Txn_description"))));
head_10K_2 = head_10K_1.select(regexp_replace('Txn_description', '[^A-Za-z0-9]', ',').alias('Txn_description'))
head_10K_3 = head_10K_2.select(regexp_replace('Txn_description', num_rep, 'NUM').alias('Txn_description'))
head_10K_4 = head_10K_3.select(regexp_replace('Txn_description', comma_rep, ',').alias('Txn_description'))


"""Temporary comment
head_10K_5 = head_10K_4.withColumn('Txn_description',split(col('Txn_description'),','))

udf_1 = udf(lambda line: [elem+'_P'+str(idx+1) for (elem,idx) in zip(line,range(len(line)))])
head_10K_6 =head_10K_5.withColumn('Txn_description',udf_1(col('Txn_description')))

print(datetime.now())
fpGrowth = FPGrowth(itemsCol="Txn_description", minSupport=0.1, minConfidence=0.1)
model = fpGrowth.fit(head_10K_6)
print(datetime.now())
# Display frequent itemsets.
model.freqItemsets.show()
print(datetime.now())
# Display generated association rules.
model.associationRules.show()
# transform examines the input items against all the association rules and summarize the
# consequents as prediction
model.transform(head_10K_6).show()
print(datetime.now())



from pyspark.ml.fpm import FPGrowth

df = spark.createDataFrame([
    (0, [1, 2, 5]),
    (1, [1, 2, 3, 5]),
    (2, [1, 2])
], ["id", "items"])
df.printSchema()
fpGrowth = FPGrowth(itemsCol="items", minSupport=0.1, minConfidence=0.1)
model = fpGrowth.fit(df)
# Display frequent itemsets.
model.freqItemsets.show()

# # Display generated association rules.
# model.associationRules.show()

Temporary comment"""




df_0= head_10K_4.withColumn(\
"Txn_description",\
split(col("Txn_description"), ",\s*").cast(ArrayType(StringType())).alias("Txn_description"))

print(df_0.printSchema())
print(df_0.show(2))
udf_1 = udf(lambda line: [elem+'_P'+str(idx+1) for (elem,idx) in zip(line,range(len(line)))][:3])

df_1 =df_0.withColumn('Txn_description',udf_1(col('Txn_description')))
print(df_1.printSchema())
print(df_1.show(2))


df_2 = df_1.withColumn("Txn_description", split(col("Txn_description"), ",").cast("array<string>"))
print(df_2.printSchema())
print(df_2.show(2))




from pyspark.ml.fpm import FPGrowth
print(datetime.now())
fpGrowth = FPGrowth(itemsCol="Txn_description", minSupport=0.0005, minConfidence=0.1)
model = fpGrowth.fit(df_2)
print(datetime.now())
# Display frequent itemsets.
freq_set = model.freqItemsets.collect()

print(len(freq_set))
pprint(freq_set)
print(datetime.now())
# Display generated association rules.
association_set = model.associationRules.collect()
pprint(association_set)
print(len(association_set))
# transform examines the input items against all the association rules and summarize the
# consequents as prediction
transformed_input = model.transform(df_2).take(1000)
pprint(transformed_input)
print(datetime.now())




# from pyspark.ml.fpm import FPGrowth
# datamodel = FPGrowth.train(df_2,minSupport=0.0003,numPartitions=10)
# print(datetime.now())
# result = datamodel.freqItemsets().collect()
# print(len(result))
# print(datetime.now())
# print('done')
