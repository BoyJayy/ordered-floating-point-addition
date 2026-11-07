"""A targeted check of the factorial manuscript's zero-start quantifier."""
from fractions import Fraction
from itertools import permutations
import json
import struct

from independent_audit import FiniteFormat


def native_half_fold(operands):
    state = 0.0
    for value in operands:
        state = struct.unpack('e', struct.pack('e', state+value))[0]
    return state


p,k = 11,5
R = 2**p
shifts = [R//16+4*i for i in range(k)]
radii = [R+(1 if j%2 == 0 else 4)-(13*R//16+4*k*(j+1)) for j in range(k)]
unrestricted_order = shifts+radii+[-x for x in shifts+radii]
oracle = FiniteFormat(p,0,p+2)
state = '+0'
for value in unrestricted_order:
    state = oracle.add(state,value)
assert state == 1 and native_half_fold(unrestricted_order) == 1

witness_count = 0
for order in permutations(range(k)):
    operands = []
    for j,index in enumerate(order):
        operands.extend((shifts[index],radii[j],-radii[j],-shifts[index]))
    state = '+0'
    for value in operands:
        state = oracle.add(state,value)
    assert state == '+0' and native_half_fold(operands) == 0
    witness_count += 1

print(json.dumps({'p':p,'k':k,'precision_condition':R >= 64*k*k,
                  'unrestricted_permutation':unrestricted_order,
                  'unrestricted_exact_oracle_result':1,
                  'unrestricted_native_binary16_result':1,
                  'constructed_witnesses_checked':witness_count,
                  'all_constructed_witnesses_return_zero':True},indent=2))
