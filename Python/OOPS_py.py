#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 16 10:47:32 2017

@author: triloq
"""

try:
    x = 1 / 0
except ZeroDivisionError as err:
    print("Error class is: ", type(err))
    print("Error message is:", err)

class MySpecialError(ValueError):
    pass

raise MySpecialError('custom error message')


try:
    print("try something here")
except:
    print("this happens only if it fails")
else:
    print("this happens only if it succeeds")
finally:
    print("this happens no matter what")

'''ITERATORS'''
print(*range(10))
                                                
L1 = (1, 2, 3, 4)
L2 = ('a', 'b', 'c', 'd')
z = zip(L1, L2)
print(*z)


from itertools import permutations
p = permutations(range(4),2)
print(*p)


from itertools import combinations
c = combinations(range(4), 2)
print(*c)

from itertools import product
p = product('ab', range(3))

print(*p)

print(len(*p),len(*c)) '''len() takes exactly one argument (0 given)'''

     
''' [expr for var in iterable] is basic syntax, where
expr is any valid expression, 
var is a variable name, and 
iterable is any iterable Python object.'''    
s=[i**3 for i in range(20) if i % 3 > 0]

'''Conditionals on the Value'''

def absolute_value(val):
    return val if val>=0 else -val
absolute_value(-2.3)
     
sum(range(8))
     
     
def std_dev(list):
    mean = sum(list)/len(list)
    sum_dev = sum([(val-mean)**2 for val in list]) 
    return sum_dev/len(list)  

std_dev(range(7))  

def MeanAbsDev(list):
    num_obs=len(list)
    mean = sum(list)/num_obs
    sum_dev = sum([absolute_value(val-mean) for val in list])
    return sum_dev/num_obs
    
MeanAbsDev(range(8,-40,-4))

{val:abs(val) for val in range(8,-40,-4)}

from itertools import count
next(count())

factors = [2, 3, 5, 7]
res1=list((i for i in count() if all(i % n > 0 for n in factors)))
print(res1)







































































