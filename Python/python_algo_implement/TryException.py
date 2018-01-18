import pprint
import random
from matplotlib import pyplot as plt
import math
#
'''
for i in [1, 2, 3, 4, 5]:
	print i
	for j in [1, 2, 3, 4, 5]:
		print j
		print i + j
	print i
print "done looping"
#

'''
#
'''****************************************************************************

try:
	print 0 / 0
except ZeroDivisionError:
	print "cannot divide by zero"

#while True: print 10 * (1/0)

import sys

try:
    f = open('Documents/PythonScripts/myfile.txt')
    s = f.readline()
    i = int(s.strip())
except IOError as e:
    print "I/O error({0}): {1}".format(e.errno, e.strerror)
except ValueError:
    print "Could not convert data to an integer."
except:
    print "Unexpected error:", sys.exc_info()[0]
    raise

'''#****************************************************************************


long_winded_computation = (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 + 11 + 12 +
13, 14 + 15 + 16 + 17 + 18 + 19 + 20)

#print type(())
x = [4,1,2,3]
z = long_winded_computation
z = list(z)
#z = z.sort()
#print sorted(z)

unif_randoms = [random.random()*10 for z1 in range(9)]
#print unif_randoms

#PLOTTING GRAPHS
'''*****************************************************************************
years = [1950, 1960, 1970, 1980, 1990, 2000, 2010]
gdp = [300.2, 543.3, 1075.9, 2862.5, 5979.6, 10289.7, 14958.3]

plt.plot(years, gdp, color= 'blue', marker = 'o', linestyle = 'dotted')
plt.title('Nominal GDP')
plt.ylabel('Billions of $')
plt.show()

'''
#*******************************************************************************
#ENUMERATing
'''*****************************************************************************
documents = [(x*3)%5 for x in range(3,12)]
for i in range(len(documents)):
	document = documents[i]
	print(i, document)

for i, document in enumerate(documents):
	print(i, document)

'''#****************************************************************************

#zip :two or more lists together into a single list of tuples
'''*****************************************************************************
list1 = ['a', 'b', 'c']
list2 = [1, 2, 3]
zip12 =zip(list1, list2)
print zip12

#  unzip a list
pairs = [('a', 1), ('b', 2), ('c', 3)]
letters, numbers = zip(*pairs)
print letters, '\n', numbers
'''#****************************************************************************
#PLAYING WITH VECTORS


movies = ["Annie Hall", "Ben-Hur", "Casablanca", "Gandhi", "West Side Story"]
num_oscars = [5, 11, 3, 8, 10]

height_weight_age = [[70, # inches,
170, # pounds,
40 ],[3 ,4 ,5] ] # years

##pprint.pprint(height_weight_age)

def vector_add(v, w):
	"""adds corresponding elements"""
	return [v_i + w_i
		for v_i, w_i in zip(v, w)]
v1 = [2,4,6]
v2= [-3,5,8]
sum12 = vector_add(v1, v2)
##print sum12

def vector_sub(v,w):
	return [v_i- w_i 
		for v_i, w_i in zip(v,w)]

sub12 = vector_sub(v1,v2)
##print sub12

def dot(v, w):
	"""v_1 * w_1 + ... + v_n * w_n"""
	return sum(v_i * w_i
		for v_i, w_i in zip(v, w))
dot12 = dot(v1,v2)
##print dot12

def norm(v):
	return dot(v,v)
##print norm(v1) 

def vector_sum(vectors):
	"""sums all corresponding elements"""
	result = vectors[0]
	for vector in vectors[1:]:
		result = vector_add(result, vector)
	return result

A= [[1,5,-7],
	[2,-3,3],
	[-2,5,7],
	[2,4,-4]]

def shape(A):
	num_rows = len(A)
	num_cols = len(A[0]) if A else 0
	return num_rows, num_cols

#print shape(A)

def is_diagonal(i, j):
"""1's on the 'diagonal', 0's everywhere else"""
return 1 if i == j else 0