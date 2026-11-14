"""Independent neighbour-list oracle; bounded exhaustive and seeded tests.

Run: python3 -B check_radix.py
Only the output JSON in this directory is written. All compared values
are integers in subnormal-ulp units, never binary floating-point surrogates.
"""
import bisect
from collections import Counter
from datetime import datetime
from fractions import Fraction
import hashlib
import itertools
import json
from pathlib import Path
import random
from zoneinfo import ZoneInfo

from radix_indices import (RadixFormat, Piece, NEG_INF, POS_INF, balanced,
                          identity, merge, singleton)


class NeighbourOracle:
    def __init__(self,beta,p,e):
        # Independent definition: a set, not the constructor's region table.
        n = beta**(p-1)
        positive = set(range(1,n))
        positive.update(k*beta**j for j in range(e) for k in range(n,beta*n))
        self.values = sorted({0}|positive|{-x for x in positive})
        self.beta,self.p,self.e = beta,p,e
        self.virtual = beta**(p+e-1)

    def even_significand(self,value):
        v = abs(value)
        while v >= self.beta**self.p:
            assert v % self.beta == 0
            v //= self.beta
        return v % 2 == 0

    def rounded(self,z):
        if z in (NEG_INF,POS_INF):
            return z
        j = bisect.bisect_left(self.values,z)
        if j < len(self.values) and self.values[j] == z:
            return z
        low = self.values[j-1] if j else -self.virtual
        high = self.values[j] if j < len(self.values) else self.virtual
        lo_distance,hi_distance = z-low,high-z
        if lo_distance < hi_distance:
            answer = low
        elif hi_distance < lo_distance:
            answer = high
        else:
            answer = low if self.even_significand(low) else high
        return NEG_INF if answer == -self.virtual else POS_INF if answer == self.virtual else answer

    def fold(self,x,operands):
        for a in operands:
            if x in (NEG_INF,POS_INF):
                return x
            x = self.rounded(x+a)
        return x


COUNTS = Counter()
DETAILS = []


def assert_index(index,values,expected):
    assert len(values) == index.fmt.length == len(expected)
    actual = [index.at_rank(i) for i in range(len(values))]
    assert actual == expected, (index.fmt.__dict__,actual,expected)
    COUNTS['output_comparisons'] += len(values)
    COUNTS['indices_checked'] += 1
    for piece in index.pieces:
        if piece.c not in (NEG_INF,POS_INF) and piece.height is not None:
            assert len(piece.thresholds) == index.fmt.lam
            assert piece.height >= piece.d
            assert piece.height % piece.d == 0


def exhaustive(beta,p,e,triples):
    fmt,oracle = RadixFormat(beta,p,e),NeighbourOracle(beta,p,e)
    values = oracle.values
    assert values == [fmt.value_at(i) for i in range(fmt.length)]
    for x in values:
        for a in values:
            assert fmt.rounded(x+a) == oracle.rounded(x+a)
            if beta % 2:
                j = bisect.bisect_left(values,x+a)
                lo = values[j-1] if j else -oracle.virtual
                hi = values[j] if j<len(values) else oracle.virtual
                if lo != hi:
                    assert 2*(x+a) != lo+hi
                COUNTS['odd_additions_not_midpoints'] += 1
            COUNTS['single_round_oracle_comparisons'] += 1
    leaves = {a:singleton(fmt,a) for a in values}
    ident = identity(fmt)
    for a in values:
        expected = [oracle.fold(x,(a,)) for x in values]
        assert_index(leaves[a],values,expected)
        assert_index(merge(ident,leaves[a]),values,expected)
        assert_index(merge(leaves[a],ident),values,expected)
        COUNTS['identity_merges'] += 2
    pairs = {}
    for a,b in itertools.product(values,repeat=2):
        pairs[a,b] = merge(leaves[a],leaves[b])
        assert_index(pairs[a,b],values,[oracle.fold(x,(a,b)) for x in values])
        COUNTS['exhaustive_pairs'] += 1
    if triples:
        for a,b,c in itertools.product(values,repeat=3):
            expected = [oracle.fold(x,(a,b,c)) for x in values]
            assert_index(merge(pairs[a,b],leaves[c]),values,expected)
            assert_index(merge(leaves[a],pairs[b,c]),values,expected)
            COUNTS['exhaustive_triples'] += 1
    DETAILS.append({'beta':beta,'p':p,'E':e,'N':len(values),
                    'all_pairs':True,'all_triples':triples})


def random_formats():
    rng = random.Random(2026111423)
    for beta,p,e in [(3,5,5),(5,3,4),(6,3,4),(10,4,4),(16,3,4)]:
        fmt,oracle = RadixFormat(beta,p,e),NeighbourOracle(beta,p,e)
        values = oracle.values
        for _ in range(100):
            m = rng.randrange(1,18)
            ops = [rng.choice(values) for _ in range(m)]
            k = rng.randrange(m+1)
            left,right = balanced(fmt,ops[:k]),balanced(fmt,ops[k:])
            joined = merge(left,right)
            full = balanced(fmt,ops)
            expected_ranks = {0,len(values)-1,len(values)//2}
            expected_ranks.update(rng.randrange(len(values)) for _ in range(50))
            expected_ranks.update(piece.start for piece in joined.pieces)
            expected_ranks.update(piece.stop-1 for piece in joined.pieces)
            for rank in expected_ranks:
                expect = oracle.fold(values[rank],ops)
                assert joined.at_rank(rank) == expect == full.at_rank(rank)
                COUNTS['sampled_output_comparisons'] += 2
            for piece in joined.pieces:
                targets2 = [2*rng.choice(values),2*rng.choice(values)+1]
                if piece.c not in (NEG_INF,POS_INF):
                    targets2 += [2*piece.c-1,2*piece.c,2*piece.c+1]
                for target2 in targets2:
                    lo,hi = piece.start,piece.stop
                    while lo < hi:
                        mid=(lo+hi)//2
                        v=piece.at(mid)
                        if v == POS_INF or (v != NEG_INF and 2*v>=target2):
                            hi=mid
                        else:
                            lo=mid+1
                    assert piece.inverse2(target2) == lo
                    COUNTS['explicit_inverse_vs_binary_search'] += 1
            COUNTS['random_blocks'] += 1
        DETAILS.append({'beta':beta,'p':p,'E':e,'N':len(values),
                        'random_blocks':100,'seed':2026111423})


def parity_counterexamples():
    fmt = RadixFormat(2,3,2)
    oracle = NeighbourOracle(2,3,2)
    binary_inputs = [4,5,6,7]
    binary_outputs = [oracle.fold(x,[4]) for x in binary_inputs]
    assert binary_outputs == [8,8,10,12]
    assert binary_outputs[3]-binary_outputs[1] != 2
    def rn_fraction(z,h):
        q,r=divmod(z,Fraction(h))
        return h*(q+int(2*r>h or (2*r==h and q%2)))
    rational_outputs=[rn_fraction(3*i+Fraction(3,2),3) for i in range(5)]
    assert rational_outputs == [0,6,6,12,12]
    assert rational_outputs[1]-rational_outputs[0] != 3
    return {'even_radix_one_threshold_refuted':{
        'beta':2,'p':3,'E':2,'operand':4,'inputs':binary_inputs,
        'outputs':binary_outputs,'asserted_period_increment':2,'observed':4},
        'odd_radix_arbitrary_real_operand_refuted':{
        'h':3,'operand':'3/2','input_spacing':3,
        'outputs':rational_outputs,'asserted_period_increment':3,'observed':6}}


def artificial_closure():
    """Records need not have any underlying operand history.

    Exhaust small threshold tuples, allow clipped records, unequal spacings,
    nonzero origins, constants and arbitrary anchors. Check the closure
    theorem independently by recovering its proposed normal form from values.
    """
    for beta in (2,3,4,5,6,10,16):
        lam=2 if beta%2==0 else 1
        for da in (1,beta):
            for length in (1,2,5,8):
                a_records=[Piece(0,length,da,-7,lam)]
                for ha in (da,da*beta):
                    horizon=min(length,lam*ha//da)
                    for ts in itertools.combinations_with_replacement(range(1,horizon+1),lam):
                        a_records.append(Piece(0,length,da,-7,lam,ha,ts))
                for a in a_records:
                    av=[a.at(i) for i in range(length)]
                    for db in (1,beta,beta*beta):
                        if any((y-av[0])%db for y in av):
                            continue
                        origin=av[0]-2*db
                        blength=(av[-1]-origin)//db+3
                        b_records=[Piece(0,blength,db,11,lam)]
                        for hb in (db,db*beta):
                            horizon=min(blength,lam*hb//db)
                            # Exhaust all small tuples, plus far-end thresholds.
                            choices=sorted({1,horizon,max(1,horizon-1)}|set(range(1,min(4,horizon)+1)))
                            for ts in itertools.combinations_with_replacement(choices,lam):
                                b_records.append(Piece(0,blength,db,11,lam,hb,ts))
                        for b in b_records:
                            expected=[b.at((y-origin)//db) for y in av]
                            if b.height is None:
                                h=a.height
                            elif a.height is None:
                                h=None if (da>b.height or (lam==1 and da==b.height)) else b.height
                            else:
                                h=max(a.height,b.height)
                            c=expected[0]
                            if h is None:
                                candidate=Piece(0,length,da,c,lam)
                            else:
                                horizon=min(length,lam*h//da)
                                ts=tuple(next((i for i in range(horizon) if expected[i]>=c+j*h),horizon)
                                         for j in range(1,lam+1))
                                candidate=Piece(0,length,da,c,lam,h,ts)
                            assert [candidate.at(i) for i in range(length)]==expected,(a,b,expected,candidate)
                            COUNTS['synthetic_record_compositions']+=1
                            COUNTS['synthetic_output_comparisons']+=length


def main():
    for beta,p,e,triples in [(2,2,1,True),(2,2,2,True),(3,2,1,True),
                             (3,2,2,True),(4,2,2,False),(5,2,2,False),
                             (6,2,2,False)]:
        exhaustive(beta,p,e,triples)
    random_formats()
    artificial_closure()
    counterexamples=parity_counterexamples()
    directory=Path(__file__).resolve().parent
    result={'status':'PASS','time_moscow':datetime.now(ZoneInfo('Europe/Moscow')).isoformat(),
            'counts':dict(COUNTS),'formats':DETAILS,'counterexamples':counterexamples,
            'limits':['exact integer software checks; no hardware timing',
                      'exhaustive only for listed small formats and block lengths',
                      'not proof-assistant certification or external review'],
            'sha256':{p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in
                      [directory/'radix_indices.py',directory/'check_radix.py']}}
    (directory/'radix_results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))


if __name__=='__main__':
    main()
