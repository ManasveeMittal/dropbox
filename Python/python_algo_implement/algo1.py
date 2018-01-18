
n =10
s=[3,4,21,36,10,28,35,5,24,42]

#!/bin/python

import sys

def getRecord(s):
	min_s,max_s = s[0], s[0]	
	best_count ,worst_count= 0,0
	
	for i in range(n-1):
		#print i, s[i]
		#print max_s, best_count    
		#print min_s, worst_count
		if( s[i+1] > max_s):
			best_count +=1
			max_s = s[i+1]
		if( s[i+1] < min_s):
			worst_count +=1
			min_s = s[i+1]	
	return best_count,worst_count    

result = getRecord(s)
print " ".join(map(str, result))

'''
Maria plays games of college basketball in a season. Because she wants to go pro, she tracks her points scored per game sequentially in an array defined as score = [s0, s1,.., s(n-1)]. After each game i , she checks to see if score s(i) breaks her record for most or least points scored so far during that season.
Given Maria's array of for a season of n games, find and print the number of times she breaks her record for most and least points scored during the season.
Note: Assume her records for most and least points at the start of the season are the number of points scored during the first game of the season.
Input Format
The first line contains an integer denoting (the number of games).
The second line contains space-separated integers describing the respective values of s0, s1,.., s(n-1).
Constraints
1 <= n <= 100
0<= s(i) <= 10^8
Output Format
Print two space-seperated integers describing the respective numbers of times her best (highest) score increased and her worst (lowest) score decreased.
Sample Input 0
9
10 5 20 20 4 5 2 25 1
Sample Output 0
2 4
Explanation 0
The diagram below depicts the number of times Maria broke her best and worst records throughout the season:
image
She broke her best record twice (after games and ) and her worst record four times (after games , , , and ), so we print 2 4 as our answer. Note that she did not break her record for best score during game , as her score during that game was not strictly greater than her best record at the time.
Sample Input 1
10
3 4 21 36 10 28 35 5 24 42
Sample Output 1
4 0
Explanation 1
The diagram below depicts the number of times Maria broke her best and worst records throughout the season:
image
She broke her best record four times (after games , , , and ) and her worst record zero times (no score during the season was lower than the one she earned during her first game), so we print 4 0 as our answer.

#!/bin/python

import sys

def getRecord(s):
    # Complete this function
n = int(raw_input().strip())
s = map(int, raw_input().strip().split(' '))

sorted_s = sorted(s)

result = getRecord(s)

print " ".join(map(str, result))
'''