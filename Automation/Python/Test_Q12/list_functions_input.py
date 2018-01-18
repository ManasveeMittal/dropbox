f = lambda x, y : x + y
x=2

import sys
sys.path.append('')

from inspect import getmembers, isfunction
import list_functions_input

functions_list = [o for o in getmembers(list_functions_input) if isfunction(o[1])]

print(functions_list)