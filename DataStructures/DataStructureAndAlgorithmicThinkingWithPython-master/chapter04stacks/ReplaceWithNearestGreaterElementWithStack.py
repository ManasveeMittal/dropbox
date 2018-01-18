# Copyright (c) Dec 22, 2014 CareerMonk Publications and others.
# E-Mail           		: info@careermonk.com 
# Creation Date    		: 2014-01-10 06:15:46 
# Last modification		: 2008-10-31 
#               by		: Narasimha Karumanchi 
# Book Title			: Data Structures And Algorithmic Thinking With Python
# Warranty         		: This software is provided "as is" without any 
# 				   warranty; without even the implied warranty of 
# 				    merchantability or fitness for a particular purpose. 

class Stack:
    def __init__(self):
        self.items = []
         
    # method for pushing an item on a stack
    def push(self, item):
        self.items.append(item)
         
    # method for popping an item from a stack
    def pop(self):
        return self.items.pop()
     
    # method to check whether the stack is empty or not
    def isEmpty(self):
        return (self.items == [])
     
    # method to get the top of the stack
    def peek(self):
        return self.items[-1]
     
    def __str__(self):
        return str(self.items)

def replaceWithNearestGreaterElementWithStack(A):
	i = 0
	S = Stack()
	S.push(A[0])
	for i in range(0, len(A)):
		nextNearestGreater = A[i]
		if not S.isEmpty():
			element = S.pop()
			while (element < nextNearestGreater):
				print("For the element " + str(element) + ", " + str(nextNearestGreater) + " is the nearest greater element")
				if S.isEmpty():
					break
				element = S.pop()
			if element > nextNearestGreater:
				S.push(element)
		S.push(nextNearestGreater)
	
	while (not S.isEmpty()):
		element = S.pop()
		nextNearestGreater = float("-inf")
		print("For the element " + str(element) + ", " + str(nextNearestGreater) + " is the nearest greater element")
replaceWithNearestGreaterElementWithStack([6, 12, 4, 1, 2, 111, 2, 2, 10])
