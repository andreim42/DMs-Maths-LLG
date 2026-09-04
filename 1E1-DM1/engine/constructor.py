from itertools import product
from engine.utils import *

def construct_table(logic, variables, assertions, filename):
    init(filename)

    for i in range(len(variables)):
        add(i, 0, variables[i], filename)

    loop = 0
    for combi in product(logic.vals(), repeat=len(variables)):
        for i in range(len(variables)):
            add(i, loop + 1, combi[i], filename)
        
        i = 0
        for assertion, nom in assertions:
            resultat = assertion(*combi)
            add(len(variables) + i, 0, nom, filename)
            add(len(variables) + i, loop + 1, resultat, filename)
            i += 1
        loop += 1