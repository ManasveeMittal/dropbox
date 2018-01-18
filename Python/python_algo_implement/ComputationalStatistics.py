from thinkbayes import Pmf
'''
pmf1 =Pmf()
for x in [1,2,3,4,5,6]:
	pmf1.Set(x, 1/6.0)

#print pmf1.Normalize()
#print pmf1.Prob(1)
'''
pmf2 = Pmf()
pmf2.Set('Bowl1', 0.5)
pmf2.Set('Bowl2', 0.5)

pmf2.Mult('Bowl1', 0.75)
pmf2.Mult('Bowl2', 0.5)

pmf2.Normalize()
print pmf2.Prob('Bowl1')
print pmf2.Prob('Bowl2')
