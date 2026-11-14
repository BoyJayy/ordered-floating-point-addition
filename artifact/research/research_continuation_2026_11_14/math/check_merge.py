"""Bounded exhaustive/adversarial tests against the old neighbour-list oracle.

Run: python3 check_merge.py
No GPU measurements; these are exact-integer numerical-semantic checks.
"""
from pathlib import Path
from itertools import product
import hashlib
import json
import random
import time
from fractions import Fraction

from merge_indices import (FullPiece, FullFormatSummary, BinaryFormat, NEG_INF,
                           POS_INF, inverse2, merge, singleton, balanced, from_pieces,
                           global_inverse2, preimage_interval2, at_least2)
from check_full_format import NeighbourOracle


def detach(summary):
    """JSON roundtrip removes object identity and any imagined operand access."""
    data = json.loads(json.dumps(summary.descriptor()))
    return from_pieces(BinaryFormat(data['p'], data['E']),
                       [FullPiece(**row) for row in data['pieces']], data['steps'])


def outputs(summary):
    return [summary.evaluate_index(i) for i in range(summary.fmt.length)]


def inverse_checks():
    records = probes = 0
    for d in (1, 2, 4, 8):
        for h2 in (1, 2, 4, 8, 16, 32):
            if h2 < d:
                continue
            period = h2//d
            for length in (1, 2, 5, 13):
                horizon = min(period, length)
                for a in range(1, horizon+1):
                    for b in range(a, horizon+1):
                        for anchor in (-7, 0, 11):
                            piece = FullPiece(5, 5+length, d, anchor, h2, a, b)
                            values = [piece.at(i) for i in range(piece.start, piece.stop)]
                            assert values == sorted(values)
                            for target2 in range(2*values[0]-3, 2*values[-1]+4):
                                expected = next((i for i in range(piece.start, piece.stop)
                                                 if 2*piece.at(i) >= target2), piece.stop)
                                assert inverse2(piece, target2) == expected
                                probes += 1
                            records += 1
    return dict(status='PASS', synthetic_records=records, inverse_probes=probes,
                covers='negative anchors; half-integer targets; coincident/clipped thresholds; period-one; nonzero start')


def exhaustive_checks():
    formats = [(2, 1), (2, 2), (3, 1), (3, 2)]
    triples = compositions = query_comparisons = singleton_checks = 0
    noncanonical_examples = []
    for p, e in formats:
        oracle = NeighbourOracle(p, e)
        values = oracle.values
        singles = {}
        pairs = {}
        identity = FullFormatSummary(p, e)
        for operand in values:
            new = singleton(p, e, operand)
            old = FullFormatSummary(p, e)
            old.append(operand)
            expected = [oracle.add(x, operand) for x in values]
            assert outputs(new) == expected == outputs(old)
            singles[operand] = detach(new)
            assert outputs(merge(identity, new)) == expected
            assert outputs(merge(new, identity)) == expected
            singleton_checks += 1
            compositions += 2
            query_comparisons += 3*len(values)
        for a, b in product(values, repeat=2):
            merged = merge(singles[a], singles[b])
            # Independently built right/left blocks, old sequential constructor.
            old = FullFormatSummary(p, e)
            old.append(a)
            old.append(b)
            expected = [oracle.add(oracle.add(x, a), b) for x in values]
            assert outputs(merged) == expected == outputs(old)
            pairs[a, b] = detach(merged)
            compositions += 1
            query_comparisons += 2*len(values)
        for a, b, c in product(values, repeat=3):
            left_assoc = merge(pairs[a, b], singles[c])
            right_assoc = merge(singles[a], pairs[b, c])
            expected = [oracle.add(oracle.add(oracle.add(x, a), b), c) for x in values]
            assert outputs(left_assoc) == expected == outputs(right_assoc), (p, e, a, b, c)
            assert left_assoc.evaluate(NEG_INF) == NEG_INF
            assert right_assoc.evaluate(POS_INF) == POS_INF
            if len(noncanonical_examples) < 3 and left_assoc.descriptor() != right_assoc.descriptor():
                noncanonical_examples.append(dict(p=p, E=e, operands=[a,b,c],
                    left_pieces=len(left_assoc.pieces), right_pieces=len(right_assoc.pieces)))
            triples += 1
            compositions += 2
            query_comparisons += 2*len(values)
    return dict(status='PASS', formats=formats, exhaustive_length_three_blocks=triples,
                singleton_checks=singleton_checks, compositions=compositions,
                full_input_query_comparisons=query_comparisons,
                different_serializations_same_function=noncanonical_examples)


def randomized_checks():
    rng = random.Random(2026111401)
    cases = comparisons = 0
    maximum_pieces = 0
    for p, e in [(2,6),(3,5),(5,1),(5,6),(8,8)]:
        oracle = NeighbourOracle(p,e)
        values = oracle.values
        for length in (0,1,2,7,16,33,65):
            for kind in range(4):
                if kind == 0:
                    block = [rng.choice(values) for _ in range(length)]
                elif kind == 1:
                    block = [rng.choice([-1,0,1]) for _ in range(length)]
                elif kind == 2:
                    block = [values[-1] if j%2 == 0 else values[0] for j in range(length)]
                else:
                    block = [rng.choice(values[:8]+values[-8:]) for _ in range(length)]
                summary = balanced(p,e,block)
                expected = values[:]
                for operand in block:
                    expected = [oracle.add(y,operand) for y in expected]
                assert outputs(summary) == expected, (p,e,block)
                for cut in sorted({0, length//3, max(0,length-1), length}):
                    left = FullFormatSummary(p,e)
                    right = FullFormatSummary(p,e)
                    for operand in block[:cut]: left.append(operand)
                    for operand in block[cut:]: right.append(operand)
                    result = merge(detach(left),detach(right))
                    assert outputs(result) == expected, (p,e,block,cut)
                    comparisons += len(values)
                    maximum_pieces = max(maximum_pieces,len(result.pieces))
                assert len(summary.pieces) <= (2*e+1 if not length else min(len(values),4*e*length+1))
                cases += 1
                comparisons += len(values)
    return dict(status='PASS',seed=2026111401,blocks=cases,
                full_input_query_comparisons=comparisons,maximum_piece_count=maximum_pieces,
                coverage='empty blocks; very unequal lengths; random and adversarial operands; absorbing overflow; zeros; gradual underflow')


def large_domain_checks():
    rng=random.Random(2026111402)
    cases=[]
    for p,e,length in [(24,254,32),(53,2046,8)]:
        fmt=BinaryFormat(p,e)
        # Rank sampling requires no enumeration of N values.
        block=[fmt.value_at(rng.randrange(fmt.length)) for _ in range(length)]
        started=time.perf_counter()
        summary=balanced(p,e,block)
        elapsed=time.perf_counter()-started
        ranks=sorted(set([0,1,fmt.length//2,fmt.length-2,fmt.length-1]+
                         [rng.randrange(fmt.length) for _ in range(200)]))
        for rank in ranks:
            value=fmt.value_at(rank)
            for operand in block: value=fmt.add(value,operand)
            assert summary.evaluate_index(rank)==value
        cases.append(dict(p=p,E=e,block_length=length,finite_input_count=fmt.length,
                          pieces=len(summary.pieces),sampled_queries=len(ranks),
                          construction_seconds=elapsed,
                          oracle='exact scalar integer rounder; not native hardware measurement'))
    return dict(status='PASS',seed=2026111402,cases=cases)


def corridor_counterexample():
    # Import the old exact rational binary rounder without modifying it.
    import sys
    sys.path.insert(0,str(Path(__file__).resolve().parents[2] /
                        'extensions/strengthening_2026_11_07'))
    from staircase_summary import binary_round
    checks=0
    cases=[]
    for p in range(6,13):
        r=1<<p
        xs=list(range(r//2+8,3*r//4-4+1,4))
        def block(x,operands):
            for a in operands:
                z=x+a
                assert r//2 <= z < 2*r
                x=binary_round(z,p)
                assert r//2 <= x < 2*r
            return x
        b=(Fraction(3,2),Fraction(-3,2))
        for x in xs:
            assert block(x,b)==x==block(x,(0,0))
            assert block(block(x,(1,)),b)==x
            assert block(block(x,(1,)),(0,0))==x+1
            checks+=1
        cases.append(dict(p=p,grid_length=len(xs),first_input=xs[0],
                          B_after_A=int(block(block(xs[0],(1,)),b)),
                          C_after_A=int(block(block(xs[0],(1,)),(0,0)))))
    return dict(status='PASS',kind='counterexample to closure of restricted-transfer maps',
                A=['1'],B=['3/2','-3/2'],C=['0','0'],checked_grid_inputs=checks,cases=cases,
                meaning='B and C induce identical maps on X*, but B after A and C after A differ on every X* input')


def inverse_query_checks():
    rng=random.Random(2026111403)
    comparisons=intervals=0
    for p,e in [(2,2),(3,3),(5,5)]:
        fmt=BinaryFormat(p,e)
        for _ in range(30):
            block=[fmt.value_at(rng.randrange(fmt.length)) for _ in range(rng.randrange(16))]
            summary=balanced(p,e,block)
            values=outputs(summary)
            for target2 in range(-2*fmt.maximum-1,2*fmt.maximum+2):
                for strict in (False,True):
                    expected=next((i for i,y in enumerate(values)
                                   if at_least2(y,target2+int(strict))),len(values))
                    assert global_inverse2(summary,target2,strict)==expected
                    comparisons+=1
            for _ in range(40):
                lo,hi=sorted(rng.sample(range(-2*fmt.maximum-2,2*fmt.maximum+3),2))
                start,stop=preimage_interval2(summary,lo,hi)
                expected=[i for i,y in enumerate(values)
                          if y not in (NEG_INF,POS_INF) and lo<=2*y<=hi]
                assert list(range(start,stop))==expected
                intervals+=1
    return dict(status='PASS',seed=2026111403,lower_upper_bound_comparisons=comparisons,
                exact_interval_preimages=intervals,scope='finite half-integer targets; absorbing infinities excluded from finite output intervals')


if __name__=='__main__':
    result={'scope':'Exact numerical binary format; finite operands; RN-even; gradual underflow; absorbing infinity; signed zeros identified; no NaN/flags',
            'new_result':'Operand-free whole-format composition and balanced construction; no world-novelty claim',
            'tests':{}}
    for name, function in [('inverse',inverse_checks),('exhaustive',exhaustive_checks),
                           ('randomized',randomized_checks),('large_domains',large_domain_checks),
                           ('corridor_counterexample',corridor_counterexample),
                           ('inverse_queries',inverse_query_checks)]:
        started=time.perf_counter()
        result['tests'][name]=function()
        result['tests'][name]['elapsed_seconds']=time.perf_counter()-started
        print(name+': PASS',flush=True)
    result['status']='PASS'
    result['source_sha256']={p.name:hashlib.sha256(p.read_bytes()).hexdigest()
                            for p in (Path(__file__),Path(__file__).with_name('merge_indices.py'))}
    Path(__file__).with_name('merge_results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
