'''

Given an array of integers, find and print the maximum number of integers you can select from the array such
that the absolute difference between any two of the chosen integers is <= 1.

Input Format

The first line contains a single integer, n, denoting the size of the array.
The second line contains space-separated integers describing the respective values of a(0), .... ,a(n-1).

Constraints
2<= n <= 100
0<a(i)<100

    The answer will be .>= 2

Output Format

A single integer denoting the maximum number of integers you can choose from the array such that the 
absolute difference between any two of the chosen integers is <= 1.

Sample Input 0

6
4 6 5 3 3 1

Sample Output 0

3

Explanation 0

We choose the following multiset of integers from the array:{4,3,3} . Each pair in the multiset has an absolute difference <=1 (i.e., |4-3| =1 and |3-3| =0 ),
so we print the number of chosen integers, 3, as our answer.

Sample Input 1

6
1 2 2 3 1 2

Sample Output 1

5

Explanation 1

We choose the following multiset of integers from the array:{1,2,2,1,2} . 
Each pair in the multiset has an absolute difference <=1 (i.e.,|1-2| =1 ,|1-1|=0 , and |2-2| =0), so we 
print the number of chosen integers, 5, as our answer.
'''
#!/bin/python

import sys
from operator import itemgetter
#n = int(raw_input().strip())
#a = map(int,raw_input().strip().split(' '))
a=[4,6,6,5,3,8,4,3,1]

unique_a = list(set(a))
count_a = [a.count(_) for _ in unique_a]
len_set = len(count_a)-1

pair_a = [[unique_a[i], unique_a[i+1], count_a[i]*count_a[i+1]] for i in range(len_set) if (unique_a[i+1]-unique_a[i])==1]
max_pair =  
print unique_a
print count_a
print pair_a
print result_a
#for i in range(len_set):
#	print unique_a(i), unique_a(i+1), count_a(i)*count_a(i+1)
