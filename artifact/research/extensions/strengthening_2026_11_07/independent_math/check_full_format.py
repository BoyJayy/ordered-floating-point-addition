"""Whole finite-format checks against an independently enumerated neighbour oracle."""
from bisect import bisect_left
from itertools import product
from pathlib import Path
import hashlib
import json
import random

from full_format_reference import BinaryFormat,FullFormatSummary,NEG_INF,POS_INF


class NeighbourOracle:
    def __init__(self,p,e):
        self.p=p
        n=1<<(p-1)
        positives=list(range(1,n))
        for j in range(e):
            positives.extend(v*(1<<j) for v in range(n,2*n))
        self.values=[-v for v in reversed(positives)]+[0]+positives
        self.virtual=2*n*(1<<(e-1))
        self.extended=[-self.virtual]+self.values+[self.virtual]

    def round(self,z):
        at=bisect_left(self.extended,z)
        candidates=self.extended[max(0,at-1):min(at+1,len(self.extended))]
        def key(v):
            absolute=abs(v)
            mantissa=absolute>>max(0,absolute.bit_length()-self.p)
            return abs(z-v),mantissa%2
        result=min(candidates,key=key)
        if result==-self.virtual:return NEG_INF
        if result==self.virtual:return POS_INF
        return result

    def add(self,x,a):
        return x if x in (NEG_INF,POS_INF) else self.round(x+a)


def check_one(p,e,block):
    oracle=NeighbourOracle(p,e);reference=FullFormatSummary(p,e)
    assert [reference.fmt.value_at(i) for i in range(reference.fmt.length)]==oracle.values
    outputs=oracle.values[:];prefixes=queries=0;max_parts=len(reference.pieces)
    for a in block:
        outputs=[oracle.add(y,a) for y in outputs]
        reference.append(a)
        actual=[reference.evaluate_index(i) for i in range(reference.fmt.length)]
        assert actual==outputs,(p,e,block,prefixes,a,reference.descriptor(),actual,outputs)
        assert reference.evaluate(NEG_INF)==NEG_INF
        assert reference.evaluate(POS_INF)==POS_INF
        max_parts=max(max_parts,len(reference.pieces))
        prefixes+=1;queries+=len(outputs)
    return prefixes,queries,max_parts


def exhaustive_checks():
    blocks=prefixes=queries=0;max_parts=0
    for p,e in ((2,1),(2,2),(3,1),(3,2)):
        oracle=NeighbourOracle(p,e)
        for length in range(3):
            for block in product(oracle.values,repeat=length):
                pre,q,mp=check_one(p,e,block)
                blocks+=1;prefixes+=pre;queries+=q;max_parts=max(max_parts,mp)
    return dict(status='PASS',blocks=blocks,prefixes=prefixes,all_input_queries=queries,
                maximum_piece_count=max_parts,formats=[[2,1],[2,2],[3,1],[3,2]],
                block_lengths='0..2; all representable finite operands')


def random_checks():
    rng=random.Random(2026110761)
    blocks=prefixes=queries=0;max_parts=0
    for p in (2,3,4,5,6):
        for e in (1,2,3,4,6):
            values=NeighbourOracle(p,e).values
            for length in (1,4,16,64):
                for trial in range(4):
                    block=[]
                    for step in range(length):
                        if trial==0:a=rng.choice(values)
                        elif trial==1:a=rng.choice([-1,0,1])
                        elif trial==2:a=values[-1] if step%2==0 else values[0]
                        else:a=rng.choice(values[:8]+values[-8:])
                        block.append(a)
                    pre,q,mp=check_one(p,e,block)
                    blocks+=1;prefixes+=pre;queries+=q;max_parts=max(max_parts,mp)
    return dict(status='PASS',seed=2026110761,blocks=blocks,prefixes=prefixes,
                all_input_queries=queries,maximum_piece_count=max_parts)


def local_checks():
    cases=0
    for p in range(2,7):
        for e in range(1,7):
            fmt=BinaryFormat(p,e);oracle=NeighbourOracle(p,e)
            for z in range(-2*fmt.maximum,2*fmt.maximum+1):
                assert fmt.round(z)==oracle.round(z),(p,e,z,fmt.round(z),oracle.round(z))
                cases+=1
            assert all(fmt.index_of(x)==i for i,x in enumerate(oracle.values))
    return dict(status='PASS',rounder_comparisons=cases,
                coverage='all integer exact sums in [-2M,2M], all finite input rank roundtrips')


def fixtures():
    fmt=BinaryFormat(2,2)
    assert fmt.maximum==6 and fmt.twice_overflow==14
    assert fmt.round(7)==POS_INF and fmt.round(-7)==NEG_INF
    summary=FullFormatSummary(2,2)
    summary.append(1)
    assert summary.evaluate(6)==POS_INF
    summary.append(-1)
    assert summary.evaluate(6)==POS_INF
    # Exact negative power-of-two boundaries must select the right-side lattice.
    summary=FullFormatSummary(3,3)
    summary.append(0)
    assert all(summary.evaluate_index(i)==summary.fmt.value_at(i) for i in range(summary.fmt.length))
    summary.append(-8)
    assert summary.evaluate(0)==-8 and summary.evaluate(1)==-7
    denied=0
    for a in (POS_INF,NEG_INF,summary.fmt.maximum+1,1.5):
        before=summary.descriptor()
        try:summary.append(a)
        except ValueError:pass
        else:raise AssertionError(('invalid operand',a))
        assert summary.descriptor()==before;denied+=1
    return dict(status='PASS',overflow_midpoints='p2,E2: +/-7 -> +/-infinity',
                absorbing_infinity=True,negative_boundary_identity=True,
                negative_boundary_piece='p3,E3, operand -8: inputs0,1 return -8,-7; coarse-side classification would return -8,-8',
                invalid_operand_rejections=denied)


if __name__=='__main__':
    result={'scope':'finite binary numerical semantics; gradual underflow; signed zeros identified; finite operands; no NaNs or flags'}
    for name,fn in [('local',local_checks),('exhaustive',exhaustive_checks),
                    ('random',random_checks),('fixtures',fixtures)]:
        result[name]=fn();print(name+': PASS',flush=True)
    result['status']='PASS'
    result['reference_sha256']=hashlib.sha256(Path(__file__).with_name('full_format_reference.py').read_bytes()).hexdigest()
    Path(__file__).with_name('full_format_results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
