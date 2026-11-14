#!/usr/bin/env python3
"""Independent enumerated nearest-even oracle for bounded tiny formats.

Does not call BinaryFormat.round/add or use the piece normal form to determine
the expected answer. The representable set is constructed from significands.
The adjacent-value tie decision uses parity at their actual local separation.
Virtual powers of two beyond the finite extrema implement overflow ties.
"""
from bisect import bisect_left
import json
from pathlib import Path
import random
import sys

HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE.parent/'math'))
from merge_indices import balanced, NEG_INF, POS_INF
from benchmark import sequential
from query_cache import NumericQueryCache


def format_values(p,e):
    positive=set(range(1,1<<(p-1)))
    positive.update(s<<j for j in range(e) for s in range(1<<(p-1),1<<p))
    values=sorted({0}|positive|{-v for v in positive})
    virtual=1<<(p+e-1)
    return values,[-virtual]+values+[virtual]


def oracle(z,extended):
    if z<=extended[0]:return NEG_INF
    if z>=extended[-1]:return POS_INF
    i=bisect_left(extended,z)
    if extended[i]==z:return z
    lo,hi=extended[i-1:i+1]
    gap=hi-lo
    left,right=z-lo,hi-z
    answer=lo if left<right or (left==right and (lo//gap)%2==0) else hi
    if answer==extended[0]:return NEG_INF
    if answer==extended[-1]:return POS_INF
    return answer


def run():
    rng=random.Random(2026111451)
    cases=comparisons=0
    formats=[]
    for p,e in [(2,1),(2,4),(3,3),(4,5),(6,4)]:
        values,extended=format_values(p,e)
        for m in [0,1,2,8,31]:
            for repeat in range(4):
                operands=[rng.choice(values) for _ in range(m)]
                old=sequential(p,e,operands)
                new=balanced(p,e,operands)
                cache=NumericQueryCache(new)
                assert values==[new.fmt.value_at(i) for i in range(new.fmt.length)]
                for x in values:
                    expected=x
                    for operand in operands:
                        if expected in (NEG_INF,POS_INF):break
                        expected=oracle(expected+operand,extended)
                    for evaluate in [old.evaluate,new.evaluate,cache.evaluate]:
                        assert evaluate(x)==expected,(p,e,operands,x,expected,evaluate(x))
                        comparisons+=1
                cases+=1
        formats.append(dict(p=p,E=e,number_of_values=len(values)))
    result=dict(status='PASS',seed=2026111451,blocks=cases,comparisons=comparisons,
                formats=formats,oracle='enumerated neighboring representable values; independent of round/add/piece formula',
                limits='bounded toy-format exhaustive input domains and random blocks; not a proof or exhaustive operand-space verification')
    (HERE/'independent_correctness.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result))


if __name__=='__main__':run()
