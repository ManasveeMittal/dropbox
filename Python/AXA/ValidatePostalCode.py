# Q3 : Programming Assignment using Python : (https://www.hackerrank.com/challenges/validating-postalcode/problem)

#Importing python regular expression module
import re

def validate_postal_code(P):
	"""Objective : to validate whether P is a valid postal code or not."""

	#whether characters of P form an integer in range 100000-999999 or not
	format_check = bool(re.match(r'^[1-9][\d]{5}$',P))
	# P must not contain more than one alternating repetitive digit pair
	pattern_check = len(re.findall(r'(\d)(?=\d\1)',P))< 2
	# Combined constraints
	print(format_check and pattern_check)

# INPUT:single line containing the string
P=input()

validate_postal_code(P)
