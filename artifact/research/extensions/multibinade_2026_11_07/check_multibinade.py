"""Exact finite adversarial checks of the fixed-K extension.

No host floating-point arithmetic and no GPU measurements are used.
Quarter-unit operands exercise all rounding-cell phases for integral gaps.
All tested cases and the random seed are reported; finite tests do not prove
the universal statements. The adjacent-neighbour oracle is independent of
the significand-truncation rounding implementation.
"""
from bisect import bisect_left, bisect_right
from collections import Counter
from math import gcd
from pathlib import Path
import json
import random


def rn_integer_lattice(z, unit):
    q, r = divmod(z, unit)
    return unit * (q + (2*r > unit or (2*r == unit and q % 2)))


def rn_quarter(z4, p):
    """Correctly round signed z4/4 to p binary bits, returning 4*result."""
    if z4 < 0:
        return -rn_quarter(-z4, p)
    shift = max(0, z4.bit_length() - p)
    return rn_integer_lattice(z4, 1 << shift)


def representables(p, k):
    r = 1 << p
    vals = []
    for b in range(k):
        vals.extend(range((r//2) << b, r << b, 1 << b))
    vals.append((r//2) << k)  # Include upper endpoint to detect violations.
    return vals


def rn_neighbours(z4, vals, p):
    """Choose nearest listed value; on ties inspect significand parity."""
    at = bisect_left(vals, (z4+3)//4)
    choices = vals[max(0, at-1):at+1]
    assert choices
    def key(v):
        significand = v >> max(0, v.bit_length()-p)
        return abs(4*v-z4), significand & 1
    return min(choices, key=key)


def phi(g, q):
    return q-gcd(q, g)


def uniform_checks():
    count = 0
    for q in (4, 8, 16, 32, 64, 128):
        h = 1
        while 2*h <= q:
            for u4 in range(8*h):
                left = rn_integer_lattice(u4, 4*h)//4
                for g in range(2*q+1):
                    new = rn_integer_lattice(u4+4*g, 4*h)//4-left
                    charge = abs(new-g)+phi(new, q)-phi(g, q)
                    assert charge <= 0, (q,h,u4,g,new,charge)
                    if g % q == 0:
                        assert new == g
                    count += 1
            h *= 2
    return dict(cases=count, q_values=[4,8,16,32,64,128],
                phases='quarters over one complete ties-even period',
                gap_range='0..2Q inclusive', status='PASS')


def local_checks():
    rows = []
    counterexamples = []
    formats = [(p,k) for p in (4,5,6) for k in (2,3,4)] + [(4,5),(4,6)]
    for p,k in formats:
        r, q = 1 << p, 1 << k
        low, high = r//2, (1 << (k-1))*r
        vals = representables(p,k)
        rounded = {}
        for z4 in range(4*low, 4*high):
            direct4 = rn_quarter(z4,p)
            oracle = rn_neighbours(z4,vals,p)
            assert direct4 == 4*oracle, (p,k,z4,direct4,oracle)
            if oracle < high:
                rounded[z4] = oracle
        boundaries = [4*(r << j) for j in range(k-1)]
        counts, max_charge = Counter(), {}
        for phase in range(4):
            exacts = [z4 for z4 in range(4*low+phase,4*high,4) if z4 in rounded]
            for i,u4 in enumerate(exacts):
                for v4 in exacts[i:]:
                    g = (v4-u4)//4
                    new = rounded[v4]-rounded[u4]
                    cross = bisect_left(boundaries,v4)-bisect_right(boundaries,u4)
                    cross = max(0,cross)  # Equal endpoints on a boundary.
                    charge = abs(new-g)+phi(new,q)-phi(g,q)
                    assert charge <= q*cross, (p,k,u4,v4,g,new,cross,charge)
                    if cross == 0 and g % q == 0:
                        assert new == g
                    counts[cross] += 1
                    max_charge[cross] = max(charge,max_charge.get(cross,charge))
                    if charge > q and not any(e['k']==k for e in counterexamples):
                        counterexamples.append(dict(p=p,k=k,q=q,left_quarters=u4,
                            right_quarters=v4,old_gap=g,new_gap=new,
                            crossed_boundaries=cross,charge=charge))
        rows.append(dict(p=p,k=k,rounder_comparisons=4*(high-low),
                         pair_cases=sum(counts.values()), by_crossings=dict(counts),
                         max_charge=dict(max_charge)))
    return dict(status='PASS',formats=rows,
                pair_cases=sum(row['pair_cases'] for row in rows),
                rounder_comparisons=sum(row['rounder_comparisons'] for row in rows),
                counterexamples_to_charge_Q_without_crossing_count=counterexamples)


def fixture_checks():
    p,k,a = 8,3,386
    r,q = 1<<p,1<<k
    xs = list(range(r//2+8,3*r//4,4))
    assert rn_quarter(4*a,p) == 4*a
    ys = [rn_quarter(4*(x+a),p)//4 for x in xs]
    gaps = [b-a for a,b in zip(ys,ys[1:])]
    support = sum(g!=4 for g in gaps)
    variation = sum(abs(g-4) for g in gaps)
    assert support > 1 and variation > 4
    residue_deviations = {}
    for residue in sorted({x%q for x in xs}):
        out = [y for x,y in zip(xs,ys) if x%q==residue]
        residue_deviations[residue] = [b-a-q for a,b in zip(out,out[1:])]
        assert all(d==0 for d in residue_deviations[residue])
    u,v,p,k = 51,291,6,4
    q=1<<k
    ru,rv = rn_quarter(4*u,p)//4,rn_quarter(4*v,p)//4
    charge=abs((rv-ru)-(v-u))+phi(rv-ru,q)-phi(v-u,q)
    assert charge == 18 and charge > q
    return dict(status='PASS',old_step_four_bound_fails_in_three_binades=dict(
        p=8,k=3,operand=386,inputs=xs,outputs=ys,gaps=gaps,
        support=support,total_deviation=variation,residue_deviations=residue_deviations),
        unconditional_per_pair_Q_charge_fails=dict(p=p,k=k,u=u,v=v,
            rounded=[ru,rv],old_gap=v-u,new_gap=rv-ru,charge=charge,q=q))


def global_checks():
    seed=2026110721
    rng=random.Random(seed)
    blocks=prefixes=table_comparisons=0
    max_binade=0
    coverage=Counter()
    for p in (6,7,8,10):
        r=1<<p
        xs=list(range(r//2+8,3*r//4,4))
        for k in (2,3,4,5,6):
            q=1<<k
            low,high=r//2,(1<<(k-1))*r
            vals=representables(p,k)
            groups=[[i for i,x in enumerate(xs) if x%q==residue]
                    for residue in sorted({x%q for x in xs})]
            for length in (1,2,8,32,128):
                for trial in range(6):
                    ys=xs[:]
                    previous=[[q]*(len(indices)-1) for indices in groups]
                    history=[0]*len(groups)
                    for t in range(1,length+1):
                        for attempt in range(512):
                            amin,amax=4*(low-ys[0]),4*(high-ys[-1])-1
                            if trial%3==0:
                                desired=rng.randint(amin,amax)
                            elif trial%3==1:
                                desired=max(amin,min(amax,rng.randint(-2*r,2*r)))
                            else:
                                desired=max(amin,min(amax,rng.randint(-4*q,4*q)))
                            a4=rn_quarter(desired,p)
                            if not amin<=a4<=amax:
                                continue
                            if rn_quarter(4*ys[-1]+a4,p)>=4*high:
                                continue
                            break
                        else:
                            raise AssertionError('fixture search exhausted')
                        assert rn_quarter(a4,p)==a4
                        exacts=[4*y+a4 for y in ys]
                        new=[rn_quarter(z,p)//4 for z in exacts]
                        oracle=[rn_neighbours(z,vals,p) for z in exacts]
                        assert new==oracle
                        assert all(low*4<=z<high*4 for z in exacts)
                        assert all(low<=y<high for y in new)
                        for j,indices in enumerate(groups):
                            gaps=[new[b]-new[a] for a,b in zip(indices,indices[1:])]
                            history[j]+=sum(abs(g-old) for g,old in zip(gaps,previous[j]))
                            assert sum(g!=q for g in gaps)<=(k-1)*t
                            assert sum(abs(g-q) for g in gaps)<=q*(k-1)*t
                            assert history[j]<=q*(k-1)*t
                            previous[j]=gaps
                        ys=new
                        table_comparisons+=len(xs)
                        prefixes+=1
                        max_binade=max(max_binade,max(y.bit_length()-p for y in ys))
                        coverage[(p,k)]+=1
                    blocks+=1
    return dict(status='PASS',seed=seed,blocks=blocks,prefixes=prefixes,
                table_comparisons=table_comparisons,highest_binade_index=max_binade,
                prefixes_by_format={f'p{p}_K{k}':n for (p,k),n in coverage.items()},
                arithmetic='exact integer quarter units; representable operands only',
                scope='random valid blocks; every query and every prefix checked')


def main():
    results=dict(status='RUNNING',scope='exact finite mathematical checks; no timing or hardware claims')
    for name,fn in [('uniform',uniform_checks),('fixtures',fixture_checks),
                    ('local',local_checks),('global',global_checks)]:
        results[name]=fn()
        print(name+': PASS',flush=True)
    results['status']='PASS'
    target=Path(__file__).with_name('results.json')
    target.write_text(json.dumps(results,indent=2)+'\n')
    print(json.dumps({k:results[k] for k in ('status','scope','uniform','global')},indent=2))


if __name__=='__main__':
    main()
