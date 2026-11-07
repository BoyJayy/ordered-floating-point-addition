"""Independent exact checks of the claims in strengthening.tex.
No imports from the implementation or other verification code.
"""
from fractions import Fraction as F
from itertools import product
from bisect import bisect_left
from pathlib import Path
import hashlib
import json
import random

def pow2(e):
    return F(2**e) if e >= 0 else F(1, 2**(-e))

def nearest_even(z, h):
    q, r = divmod(z / h, 1)
    q = int(q)
    if r > F(1, 2) or (r == F(1, 2) and q % 2):
        q += 1
    return q * h

def evaluate(x0, d, ops, i):
    x = x0 + d * i
    for a, h in ops:
        x = nearest_even(x + a, h)
    return x

def lower_bound(predicate, hi):
    lo = 1
    while lo < hi:
        md = (lo + hi) // 2
        if predicate(md):
            hi = md
        else:
            lo = md + 1
    return lo

checks = {"uniform_cases": 0, "uniform_values": 0,
          "clipped_rebased_values": 0, "fringe_values": 0,
          "strict_inclusion_queries": 0}
rng = random.Random(20261107)

def check_uniform(x0, d, ops, exhaustive):
    h = max([d/2] + [q for _, q in ops])
    period = int(2*h/d)
    assert F(period) == 2*h/d and period >= 1
    g = lambda i: evaluate(x0, d, ops, i)
    c = g(0)
    t1 = lower_bound(lambda i: g(i) >= c+h, period)
    t2 = lower_bound(lambda i: g(i) >= c+2*h, period)
    assert 1 <= t1 <= t2 <= period
    indices = range(-2*period-1, 2*period+2) if exhaustive else (
        [-period-1, -period, -1, 0, 1, period-1, period, period+1,
         t1-1, t1, t2-1, t2] +
        [rng.randrange(-3*period, 3*period+1) for _ in range(12)])
    for i in indices:
        q, r = divmod(i, period)
        actual = g(i)
        predicted = c + 2*h*q + h*((r >= t1) + (r >= t2))
        assert actual == predicted, (x0, d, ops, i, actual, predicted)
        checks["uniform_values"] += 1
    # Independently test a restriction starting at a negative or positive index.
    start = rng.randrange(-10, 11)
    n = rng.randrange(1, 18)
    c2 = g(start)
    cap = min(period, n)
    u1 = lower_bound(lambda i: g(start+i) >= c2+h, cap)
    u2 = lower_bound(lambda i: g(start+i) >= c2+2*h, cap)
    for j in range(n):
        q, r = divmod(j, period)
        expected = c2 + 2*h*q + h*((r >= u1) + (r >= u2))
        assert expected == g(start+j), (start, n, period, u1, u2)
        checks["clipped_rebased_values"] += 1
    checks["uniform_cases"] += 1

alphabet = list(product([F(-1,2), F(0), F(1,2)], [F(1,2), F(1), F(2)]))
for length in range(4):
    for ops in product(alphabet, repeat=length):
        for d in [F(1,2), F(1), F(2), F(4)]:
            for x0 in [F(0), F(1,4), F(1,3)]:
                check_uniform(x0, d, ops, True)

for _ in range(1500):
    d = pow2(rng.randrange(-5, 6))
    x0 = F(rng.randrange(-31, 32), rng.choice([1, 3, 4, 8]))
    ops = [(F(rng.randrange(-31,32), rng.choice([1,3,4,8])),
            pow2(rng.randrange(-7, 8)))
           for _ in range(rng.randrange(0, 16))]
    check_uniform(x0, d, ops, False)

# Independently construct a finite FP grid, including subnormals.
# The tested positive corridor is well inside its finite upper boundary.
def positive_grid(p, emax):
    half = 2**(p-1)
    numbers = [F(j, half) for j in range(half)]
    numbers += [F(j) * pow2(e-p+1)
                for e in range(emax+1)
                for j in range(half, 2*half)]
    return numbers

def table_round(z, grid):
    k = bisect_left(grid, z)
    if k < len(grid) and z == grid[k]:
        return z
    assert 0 < k < len(grid)
    lo, hi = grid[k-1], grid[k]
    if z-lo < hi-z:
        return lo
    if z-lo > hi-z:
        return hi
    # Positive sorted rank parity equals the significand LSB in this grid.
    return lo if (k-1) % 2 == 0 else hi

for p in [6,7,8,9]:
    R = 2**p
    L = F(R,2)
    for K in [2,3,5,12]:
        H = pow2(K-1)
        U = H*R
        grid = positive_grid(p, p+K-1)
        # Check cell midpoints and points immediately to either side throughout
        # the corridor and at its lower/upper excluded fringes.
        left = bisect_left(grid, L) - 2
        right = bisect_left(grid, U) + 2
        probes = {L-F(1,4), U-H/2, L, U}
        for j in range(left, right):
            lo, hi = grid[j], grid[j+1]
            mid = (lo+hi)/2
            eps = (hi-lo)/8
            probes.update([lo, mid-eps, mid, mid+eps])
        for z in probes:
            r = table_round(z, grid)
            assert (L <= r < U) == (L-F(1,4) <= z < U-H/2), (p,K,z,r)
            if L-F(1,4) <= z <= R:
                assert r == nearest_even(z, F(1)), (p,K,z,r)
            checks["fringe_values"] += 1
        for x in range(R//2+8, 3*R//4, 4):
            r = table_round(F(x)-F(33,4), grid)
            assert r == x-8 and L <= r < U
            checks["strict_inclusion_queries"] += 1

path = Path(__file__).resolve()
result = {
    "status": "PASS",
    "kind": "exact rational mathematics; no hardware or GPU measurements",
    "seed": 20261107,
    "checks": checks,
    "script_sha256": hashlib.sha256(path.read_bytes()).hexdigest(),
    "limits": "finite counterexample search supplements the independent proof review; does not prove the general theorem or test the implementation"
}
(path.parent/"independent_section_checks.json").write_text(
    json.dumps(result, indent=2)+"\n")
print(json.dumps(result, indent=2))
