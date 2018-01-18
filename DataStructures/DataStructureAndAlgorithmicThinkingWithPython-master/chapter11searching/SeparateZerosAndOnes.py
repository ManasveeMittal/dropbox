# Copyright (c) Dec 22, 2014 CareerMonk Publications and others.
# E-Mail           		: info@careermonk.com 
# Creation Date    		: 2014-01-10 06:15:46 
# Last modification		: 2008-10-31 
#               by		: Narasimha Karumanchi 
# Book Title			: Data Structures And Algorithmic Thinking With Python
# Warranty         		: This software is provided "as is" without any 
# 				   warranty; without even the implied warranty of 
# 				    merchantability or fitness for a particular purpose. 

def separateZerosAndOnes(A):
	left = 0; right = len(A) - 1
	while(left < right):
		while(A[left] == 0 and left < right):
			left += 1
		while(A[right] == 1 and left < right):
			right -= 1
		if(left < right):
			A[left], A[right] = A[right], A[left]
			left += 1
			right -= 1
A = [1, 1, 0, 0, 1, 0, 1]
separateZerosAndOnes(A)
print A
