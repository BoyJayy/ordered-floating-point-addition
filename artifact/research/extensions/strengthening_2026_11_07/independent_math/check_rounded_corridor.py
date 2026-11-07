"""Exact independent checks when only rounded states stay in the corridor.

Eighth-integer units cover both sides of the lower midpoint L-1/4.
The main rounder uses integer significand truncation. Its independent oracle
uses nearest neighbours in an explicitly enumerated floating-point set.
No hardware arithmetic or performance claims are made.
"""
from bisect import bisect_left, bisect_right
from collections import Counter
from math import gcd
from pathlib import Path
import json
import random


def round_units(z, p):
    if z < 0:
        return -round_units(-z, p)
    shift = max(0, z.bit_length() - p)
    unit = 1 << shift
    quotient, remainder = divmod(z, unit)
    if 2 * remainder > unit or (2 * remainder == unit and quotient & 1):
        quotient += 1
    return quotient * unit


def significand_parity(value8, p):
    return (value8 >> max(0, value8.bit_length() - p)) & 1


def representables8(p, k):
    r = 1 << p
    # One full binade below C and one representable point above it.
    values = list(range(2 * r, 4 * r, 4))
    for j in range(k):
        values.extend(range((4 * r) << j, (8 * r) << j, 8 << j))
    values.append((4 * r) << k)
    return values


def neighbour_round(z8, p, values):
    at = bisect_left(values, z8)
    candidates = values[max(0, at-1):at+1]
    return min(candidates,
               key=lambda v: (abs(v-z8), significand_parity(v, p)))


def psi(g, q):
    return q - gcd(q, g)


def local_checks():
    pair_count = fringe_count = oracle_count = 0
    rows = []
    for p in (4, 5, 6):
        for k in (2, 3, 4):
            r, q = 1 << p, 1 << k
            low, high, h = r // 2, r << (k-1), 1 << (k-1)
            lower8, upper8 = 8*low-2, 8*high-4*h
            vals = representables8(p, k)
            rounded = {}
            for z8 in range(lower8-2, upper8+3):
                actual = round_units(z8, p)
                oracle = neighbour_round(z8, p, vals)
                assert actual == oracle, (p, k, z8, actual, oracle)
                permitted = 8*low <= actual < 8*high
                assert permitted == (lower8 <= z8 < upper8), (p, k, z8)
                oracle_count += 1
                if permitted:
                    assert actual % 8 == 0
                    rounded[z8] = actual // 8
                    if z8 < 8*low:
                        assert actual == 8*low
            boundaries = [8*(r << j) for j in range(k-1)]
            local_pairs = local_fringe = 0
            charge_max = Counter()
            for phase in range(8):
                exacts = [z for z in rounded if z % 8 == phase]
                for i, u8 in enumerate(exacts):
                    for v8 in exacts[i:]:
                        g = (v8-u8)//8
                        new = rounded[v8]-rounded[u8]
                        crossings = max(0, bisect_left(boundaries, v8)
                                        - bisect_right(boundaries, u8))
                        charge = abs(new-g)+psi(new,q)-psi(g,q)
                        assert charge <= q*crossings, (p,k,u8,v8,g,new,crossings,charge)
                        if crossings == 0 and g % q == 0:
                            assert new == g
                        charge_max[crossings] = max(charge_max[crossings],charge)
                        local_pairs += 1
                        local_fringe += (u8 < 8*low)
            pair_count += local_pairs
            fringe_count += local_fringe
            rows.append(dict(p=p,k=k,pair_cases=local_pairs,lower_fringe_pairs=local_fringe,
                             max_charge_by_crossings=dict(charge_max)))
    return dict(status='PASS',pair_cases=pair_count,lower_fringe_pairs=fringe_count,
                independent_rounder_comparisons=oracle_count,formats=rows)


def strict_inclusion():
    cases = 0
    for p in range(6, 14):
        r = 1 << p
        xs = list(range(r//2+8,3*r//4,4))
        a8 = -66  # -33/4 = -8.25, six significant binary bits.
        assert round_units(a8,p) == a8
        exacts = [8*x+a8 for x in xs]
        ys = [round_units(z,p)//8 for z in exacts]
        assert exacts[0] == 8*(r//2)-2
        assert all(y == x-8 for x,y in zip(xs,ys))
        for k in range(2,9):
            assert exacts[0] < 8*(r//2)
            assert all(r//2 <= y < r << (k-1) for y in ys)
            cases += 1
    return dict(status='PASS',formats=cases,precisions=list(range(6,14)),
                operand='-33/4, then any number of zero operands',
                exact_minimum='2^(p-1)-1/4',rounded_output='x-8')


def trajectory_checks():
    seed = 2026110733
    rng = random.Random(seed)
    blocks = prefixes = queries = fringe_prefixes = 0
    max_fraction_numerator = 0
    for p in (6,7,8,10):
        r = 1 << p
        xs = list(range(r//2+8,3*r//4,4))
        for k in range(2,9):
            low, high, q = r//2, r << (k-1), 1 << k
            h = q//2
            vals = representables8(p,k)
            classes = [[i for i,x in enumerate(xs) if x%q == residue]
                       for residue in sorted({x%q for x in xs})]
            for length in (1,2,8,32,128):
                for trial in range(4):
                    ys = xs[:]
                    previous = [[q]*(len(indices)-1) for indices in classes]
                    history = [0]*len(classes)
                    for t in range(1,length+1):
                        amin = 8*low-2-8*ys[0]
                        amax = 8*high-4*h-1-8*ys[-1]
                        if t == 1:
                            a8 = -66
                        else:
                            for attempt in range(512):
                                if trial % 2:
                                    raw = rng.randint(max(amin,-8*r),min(amax,8*r))
                                else:
                                    raw = rng.randint(amin,amax)
                                a8 = round_units(raw,p)
                                if (a8 == 0 or abs(a8) >= 8) and amin <= a8 <= amax:
                                    break
                            else:
                                a8 = 0
                        assert round_units(a8,p) == a8
                        exacts = [8*y+a8 for y in ys]
                        out8 = [round_units(z,p) for z in exacts]
                        oracle = [neighbour_round(z,p,vals) for z in exacts]
                        assert out8 == oracle
                        assert all(8*low <= y < 8*high and y%8 == 0 for y in out8)
                        new = [y//8 for y in out8]
                        if min(exacts) < 8*low:
                            fringe_prefixes += 1
                        for j,indices in enumerate(classes):
                            gaps = [new[b]-new[a] for a,b in zip(indices,indices[1:])]
                            history[j] += sum(abs(a-b) for a,b in zip(gaps,previous[j]))
                            assert sum(g != q for g in gaps) <= (k-1)*t
                            assert sum(abs(g-q) for g in gaps) <= q*(k-1)*t
                            assert history[j] <= q*(k-1)*t
                            previous[j] = gaps
                        ys = new
                        prefixes += 1
                        queries += len(xs)
                    blocks += 1
    return dict(status='PASS',seed=seed,blocks=blocks,prefixes=prefixes,queries=queries,
                prefixes_with_exact_sum_outside_corridor=fringe_prefixes,
                operands='p-bit representable; all nonzero absolute operands >=1',
                domain='every X* marker, every tested prefix')


def main():
    result = {'scope':'exact mathematical finite checks, no device runs'}
    for name, fn in [('local',local_checks),('strict_inclusion',strict_inclusion),
                     ('trajectories',trajectory_checks)]:
        result[name] = fn()
        print(name+': PASS',flush=True)
    result['status'] = 'PASS'
    Path(__file__).with_name('results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({key:value for key,value in result.items() if key!='local'},indent=2))


if __name__ == '__main__':
    main()
