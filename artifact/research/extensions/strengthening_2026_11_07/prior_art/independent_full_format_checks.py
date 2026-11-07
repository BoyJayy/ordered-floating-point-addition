"""Independent enumerated-model check of the whole-format theorem.
No imports from the sparse builder or other validation code.
All finite values and operands are integers in least-subnormal units.
"""
from bisect import bisect_left, bisect_right
from itertools import product
from pathlib import Path
import hashlib
import json
import random

INF = float("inf")
rng = random.Random(20261108)
counts = dict(blocks=0, updates=0, rounded_additions=0, record_value_checks=0,
              positive_overflow_ties=0, negative_overflow_ties=0,
              interior_boundary_equalities=0, infinite_output_values=0)
maxima = dict(pieces=0, initial_pieces=0, inputs=0)

def setup(p, E):
    half = 2**(p-1)
    progs = []
    for j in range(E-1, -1, -1):
        progs.append(([-a*2**j for a in range(2*half-1, half-1, -1)], 2**j))
    progs.append((list(range(-half+1, half)), 1))
    for j in range(E):
        progs.append(([a*2**j for a in range(half, 2*half)], 2**j))
    grid, pieces = [], []
    for values, d in progs:
        start = len(grid)
        grid.extend(values)
        # tuple: start,end,initial spacing,twice maximum spacing
        pieces.append((start, len(grid), d, d))
    assert len(grid) == 2**p*(E+1)-1
    assert grid == sorted(set(grid))
    bounds = [-2**(p-1+j) for j in range(E-1, 0, -1)]
    bounds += [2**(p-1+j) for j in range(1, E)]
    hs = [2**j for j in range(E-1, 0, -1)] + [1]
    hs += [2**j for j in range(1, E)]
    tau2 = 2*grid[-1]+2**(E-1)
    return grid, pieces, bounds, hs, tau2

def is_even_significand(v, p):
    if v == 0:
        return True
    h = 2**max(0, abs(v).bit_length()-p)
    return (abs(v)//h) % 2 == 0

def rnd(z, grid, tau2, p):
    if z == INF or z == -INF:
        return z
    if 2*z >= tau2:
        if 2*z == tau2:
            counts["positive_overflow_ties"] += 1
        return INF
    if 2*z <= -tau2:
        if 2*z == -tau2:
            counts["negative_overflow_ties"] += 1
        return -INF
    k = bisect_left(grid, z)
    if k < len(grid) and grid[k] == z:
        return z
    if k == 0:
        return grid[0]
    if k == len(grid):
        return grid[-1]
    assert 0 < k < len(grid)
    left, right = grid[k-1], grid[k]
    if z-left < right-z:
        return left
    if z-left > right-z:
        return right
    return left if is_even_significand(left,p) else right

def verify_records(outputs, pieces, p):
    for start,end,d,twoh in pieces:
        assert 0 < end-start < 2**p
        c = outputs[start]
        if c == INF or c == -INF:
            assert all(x == c for x in outputs[start:end])
            counts["infinite_output_values"] += end-start
            continue
        P = twoh//d
        assert P >= 1 and P*d == twoh
        T = min(P, end-start)
        t1 = next((j for j in range(T) if 2*(outputs[start+j]-c) >= twoh), T)
        t2 = next((j for j in range(T) if 2*(outputs[start+j]-c) >= 2*twoh), T)
        assert 1 <= t1 <= t2 <= T
        for j,actual in enumerate(outputs[start:end]):
            q,r = divmod(j,P)
            predicted_twice = 2*c+2*twoh*q+twoh*((r>=t1)+(r>=t2))
            assert 2*actual == predicted_twice, (p,start,end,d,twoh,j,c,actual,t1,t2)
            counts["record_value_checks"] += 1

def one_block(p,E,ops):
    grid,pieces,bounds,hs,tau2 = setup(p,E)
    N = len(grid)
    outputs = grid[:]
    verify_records(outputs,pieces,p)
    maxima["inputs"] = max(maxima["inputs"],N)
    maxima["initial_pieces"] = max(maxima["initial_pieces"],len(pieces))
    for step,a in enumerate(ops,1):
        exact = [s+a for s in outputs]
        new = [rnd(z,grid,tau2,p) for z in exact]
        counts["rounded_additions"] += N
        # Global lower-bound / strict-upper-bound cuts as in the theorem.
        twice_exact = [2*z for z in exact]
        cuts = {bisect_right(twice_exact, -tau2), bisect_left(twice_exact, tau2)}
        cuts.update(bisect_left(exact,b) for b in bounds)
        cuts.discard(0)
        cuts.discard(N)
        assert len(cuts) <= 2*E
        all_starts = sorted(cuts | {s for s,_,_,_ in pieces} | {N})
        parent = 0
        updated = []
        for lo,hi in zip(all_starts,all_starts[1:]):
            while lo >= pieces[parent][1]:
                parent += 1
            ps,pe,d,twoh = pieces[parent]
            assert ps <= lo < hi <= pe
            if new[lo] == INF or new[lo] == -INF:
                assert all(v == new[lo] for v in new[lo:hi])
                updated.append((lo,hi,d,twoh))
            else:
                region = bisect_right(bounds,exact[lo])
                h = hs[region]
                assert all(bisect_right(bounds,z) == region for z in exact[lo:hi])
                updated.append((lo,hi,d,max(twoh,2*h)))
        assert len(updated) <= min(N,2*E+1+2*E*step)
        counts["interior_boundary_equalities"] += sum(z in bounds for z in exact)
        outputs,pieces = new,updated
        verify_records(outputs,pieces,p)
        assert outputs == sorted(outputs)
        maxima["pieces"] = max(maxima["pieces"],len(pieces))
        counts["updates"] += 1
    counts["blocks"] += 1

for p,E in [(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3)]:
    grid,_,_,_,_ = setup(p,E)
    for length in range(3):
        for ops in product(grid,repeat=length):
            one_block(p,E,ops)
# Complete length-three enumeration for the smallest format.
grid,_,_,_,_ = setup(2,1)
for ops in product(grid,repeat=3):
    one_block(2,1,ops)

for _ in range(500):
    p = rng.randrange(2,7)
    E = rng.randrange(1,9)
    grid,_,_,_,_ = setup(p,E)
    ops = [rng.choice(grid) for _ in range(rng.randrange(0,15))]
    one_block(p,E,ops)

path = Path(__file__).resolve()
result = dict(status="PASS",seed=20261108,counts=counts,maxima=maxima,
    script_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
    kind="independent exact integer finite-format model; no GPU/CPU floating-point benchmark",
    limits="Exhaustive only for the listed small-format lengths, plus seeded random blocks. Does not establish formal proof or validate sparse implementation complexity.")
(path.parent/"independent_full_format_checks.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
