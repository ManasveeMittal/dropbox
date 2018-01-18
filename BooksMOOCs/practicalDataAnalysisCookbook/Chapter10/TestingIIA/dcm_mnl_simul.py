from biogeme import *
from headers import *
from loglikelihood import *
from statistics import *

# Specify parameters to be estimated
#
# Arguments:
#   - 1  Name, typically, the same as the variable.
#   - 2  Starting value.
#   - 3  Lower bound.
#   - 4  Upper bound.
#   - 5  flag whether to estimate the parameter (0)
#        or keep it fixed (1).

# add the coefficients to be estimated
C_price = Beta('C_price',-7.29885,-10,10,0,'C price' )
V_price = Beta('V_price',-5.07495,-10,10,0,'V price' )
Y_price = Beta('Y_price',-4.40754,-10,10,0,'Y price' )
Z_price = Beta('Z_price',-8.70638,-10,10,0,'Z price' )

ASC = Beta('ASC',0,-10,10,1,'ASC' )
B_comp = Beta('B_comp',3.52571,-10,10,0,'compartment' )
B_refund = Beta('B_refund',-0.718748,-3,3,0,'refund' )

# Utility functions

# The data are associated with the alternative index
# compartment attributes
c = {}

c[1]  = AA777_1_C_compartment
c[2]  = AA777_2_Z_compartment
c[3]  = AA777_3_Y_compartment
c[4]  = AA777_4_V_compartment
c[5]  = AS666_1_C_compartment
c[6]  = AS666_2_Z_compartment
c[7]  = AS666_3_Y_compartment
c[8]  = AS666_4_V_compartment
c[9]  = DL001_1_C_compartment
c[10] = DL001_2_Z_compartment
c[11] = DL001_3_Y_compartment
c[12] = DL001_4_V_compartment
c[13] = UA110_1_C_compartment
c[14] = UA110_2_Z_compartment
c[15] = UA110_3_Y_compartment
c[16] = UA110_4_V_compartment

# price attributes
p = {}

p[1]  = AA777_1_C_price
p[2]  = AA777_2_Z_price
p[3]  = AA777_3_Y_price
p[4]  = AA777_4_V_price
p[5]  = AS666_1_C_price
p[6]  = AS666_2_Z_price
p[7]  = AS666_3_Y_price
p[8]  = AS666_4_V_price
p[9]  = DL001_1_C_price
p[10] = DL001_2_Z_price
p[11] = DL001_3_Y_price
p[12] = DL001_4_V_price
p[13] = UA110_1_C_price
p[14] = UA110_2_Z_price
p[15] = UA110_3_Y_price
p[16] = UA110_4_V_price

# refund attributes
r = {}

r[1]  = AA777_1_C_refund
r[2]  = AA777_2_Z_refund
r[3]  = AA777_3_Y_refund
r[4]  = AA777_4_V_refund
r[5]  = AS666_1_C_refund
r[6]  = AS666_2_Z_refund
r[7]  = AS666_3_Y_refund
r[8]  = AS666_4_V_refund
r[9]  = DL001_1_C_refund
r[10] = DL001_2_Z_refund
r[11] = DL001_3_Y_refund
r[12] = DL001_4_V_refund
r[13] = UA110_1_C_refund
r[14] = UA110_2_Z_refund
r[15] = UA110_3_Y_refund
r[16] = UA110_4_V_refund

# The dictionary of utilities is constructed. 
V = {}

V[1] = C_price * p[1] + B_refund * r[1] + B_comp * c[1]
V[2] = Z_price * p[2] + B_refund * r[2] + B_comp * c[2] + ASC
V[3] = Y_price * p[3] + B_refund * r[3] + B_comp * c[3]
V[4] = V_price * p[4] + B_refund * r[4] + B_comp * c[4]
V[5] = C_price * p[5] + B_refund * r[5] + B_comp * c[5]
V[6] = Z_price * p[6] + B_refund * r[6] + B_comp * c[6]
V[7] = Y_price * p[7] + B_refund * r[7] + B_comp * c[7]
V[8] = V_price * p[8] + B_refund * r[8] + B_comp * c[8]
V[9] = C_price * p[9] + B_refund * r[9] + B_comp * c[9]
V[10] = Z_price * p[10] + B_refund * r[10] + B_comp * c[10]
V[11] = Y_price * p[11] + B_refund * r[11] + B_comp * c[11]
V[12] = V_price * p[12] + B_refund * r[12] + B_comp * c[12]
V[13] = C_price * p[13] + B_refund * r[13] + B_comp * c[13]
V[14] = Z_price * p[14] + B_refund * r[14] + B_comp * c[14]
V[15] = Y_price * p[15] + B_refund * r[15] + B_comp * c[15]
V[16] = Y_price * p[16] + B_refund * r[16] + B_comp * c[16]

# availability flags
availability = {
    1:  AA777_1_C_AV,
    2:  AA777_2_Z_AV,
    3:  AA777_3_Y_AV,
    4:  AA777_4_V_AV,
    5:  AS666_1_C_AV,
    6:  AS666_2_Z_AV,
    7:  AS666_3_Y_AV,
    8:  AS666_4_V_AV,
    9:  DL001_1_C_AV,
    10: DL001_2_Z_AV,
    11: DL001_3_Y_AV,
    12: DL001_4_V_AV,
    13: UA110_1_C_AV,
    14: UA110_2_Z_AV,
    15: UA110_3_Y_AV,
    16: UA110_4_V_AV
}

# The choice model is a logit, with availability conditions
probAA777_C = bioLogit(V, availability, 1)
probAA777_Z = bioLogit(V, availability, 2)
probAA777_Y = bioLogit(V, availability, 3)
probAA777_V = bioLogit(V, availability, 4)
probAS666_C = bioLogit(V, availability, 5)
probAS666_Z = bioLogit(V, availability, 6)
probAS666_Y = bioLogit(V, availability, 7)
probAS666_V = bioLogit(V, availability, 8)
probDL001_C = bioLogit(V, availability, 9)
probDL001_Z = bioLogit(V, availability, 10)
probDL001_Y = bioLogit(V, availability, 11)
probDL001_V = bioLogit(V, availability, 12)
probUA110_C = bioLogit(V, availability, 13)
probUA110_Z = bioLogit(V, availability, 14)
probUA110_Y = bioLogit(V, availability, 15)
probUA110_V = bioLogit(V, availability, 16)

# Defines an itertor on the data
rowIterator('obsIter') 

# exclude observations where AA777 C was selected
exclude = choice == 1
BIOGEME_OBJECT.EXCLUDE = exclude

# simulate
simulate = {
    'P_AA777_C': probAA777_C,
    'P_AA777_Z': probAA777_Z,
    'P_AA777_Y': probAA777_Y,
    'P_AA777_V': probAA777_V,
    'P_AS666_C': probAS666_C,
    'P_AS666_Z': probAS666_Z,
    'P_AS666_Y': probAS666_Y,
    'P_AS666_V': probAS666_V,
    'P_DL001_C': probDL001_C,
    'P_DL001_Z': probDL001_Z,
    'P_DL001_Y': probDL001_Y,
    'P_DL001_V': probDL001_V,
    'P_UA110_C': probUA110_C,
    'P_UA110_Z': probUA110_Z,
    'P_UA110_Y': probUA110_Y,
    'P_UA110_V': probUA110_V
}

## Code for the sensitivity analysis
names = ['B_comp','B_refund','C_price','V_price','Y_price','Z_price']
values = [[1.71083,-0.0398667,-1.67587,0.190499,0.209566,-2.13821],[-0.0398667,0.0188657,-0.00717013,-0.083915,-0.0941582,0.0155518],[-1.67587,-0.00717013,1.76813,0.0330621,0.0365816,2.18927],[0.190499,-0.083915,0.0330621,0.418485,0.452985,-0.0676863],[0.209566,-0.0941582,0.0365816,0.452985,0.498726,-0.0766095],[-2.13821,0.0155518,2.18927,-0.0676863,-0.0766095,2.74714]]
vc = bioMatrix(6, names, values)
BIOGEME_OBJECT.VARCOVAR = vc

BIOGEME_OBJECT.SIMULATE = Enumerate(simulate,'obsIter')

# Statistics
nullLoglikelihood(availability,'obsIter')
choiceSet = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
cteLoglikelihood(choiceSet, choice, 'obsIter')
availabilityStatistics(availability, 'obsIter')

# Parameters
BIOGEME_OBJECT.PARAMETERS['RandomDistribution'] ="MLHS"
BIOGEME_OBJECT.PARAMETERS['NbrOfDraws'] = "1"

BIOGEME_OBJECT.FORMULAS['AA777 C utility'] = V[1]
BIOGEME_OBJECT.FORMULAS['AA777 Z utility'] = V[2]
BIOGEME_OBJECT.FORMULAS['AA777 Y utility'] = V[3]
BIOGEME_OBJECT.FORMULAS['AA777 V utility'] = V[4]
BIOGEME_OBJECT.FORMULAS['AS666 C utility'] = V[5]
BIOGEME_OBJECT.FORMULAS['AS666 Z utility'] = V[6]
BIOGEME_OBJECT.FORMULAS['AS666 Y utility'] = V[7]
BIOGEME_OBJECT.FORMULAS['AS666 V utility'] = V[8]
BIOGEME_OBJECT.FORMULAS['DL001 C utility'] = V[9]
BIOGEME_OBJECT.FORMULAS['DL001 Z utility'] = V[10]
BIOGEME_OBJECT.FORMULAS['DL001 Y utility'] = V[11]
BIOGEME_OBJECT.FORMULAS['DL001 V utility'] = V[12]
BIOGEME_OBJECT.FORMULAS['UA110 C utility'] = V[13]
BIOGEME_OBJECT.FORMULAS['UA110 Z utility'] = V[14]
BIOGEME_OBJECT.FORMULAS['UA110 Y utility'] = V[15]
BIOGEME_OBJECT.FORMULAS['UA110 V utility'] = V[16]
