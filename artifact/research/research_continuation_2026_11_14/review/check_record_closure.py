"""Check the local closure lemma on records without operand histories.

This oracle uses Fraction and direct finite-domain enumeration. It does not
import the merge implementation or its inverse. The cases include arbitrary
clipped/coincident thresholds, half-input heights and a shifted restriction.
These finite checks complement, rather than prove, the closure lemma.
"""
from fractions import Fraction as F
from itertools import combinations_with_replacement
from pathlib import Path
import hashlib
import json
import random


def evaluate(i, c, d, h, t1, t2):
    period = 2*h/d
    assert period.denominator == 1
    q, r = divmod(i, int(period))
    return c+2*h*q+h*(int(r >= t1)+int(r >= t2))


def run():
    rng = random.Random(2026111421)
    counts = dict(base_records=0, compositions=0, comparisons=0,
                  constant_restrictions=0, half_height=0, rebased=0)
    for d in (1, 2, 4):
        for ratio in (1, 2, 4, 8):
            ha = F(d*ratio, 2)
            for length in (1, 2, 3, 7, 17):
                for ta in combinations_with_replacement(range(1, min(ratio, length)+1), 2):
                    for ca in (-3, 0, 5):
                        counts['base_records'] += 1
                        av = [evaluate(i, ca, d, ha, *ta) for i in range(length)]
                        assert av == sorted(av)
                        for left in range(min(2, length)):
                            aa = av[left:]
                            for db in (1, 2, 4, 8):
                                local = [(v-aa[0])/db for v in aa]
                                if any(v.denominator != 1 for v in local):
                                    continue
                                indices = [int(v) for v in local]
                                nb = indices[-1]+1
                                for rb in (1, 2, 4, 8):
                                    hb = F(db*rb, 2)
                                    cap = min(rb, nb)
                                    # Test clipped/period-end coincidence and an interior choice.
                                    choices = {(cap, cap), (1, cap)}
                                    choices.add(tuple(sorted((rng.randint(1, cap), rng.randint(1, cap)))))
                                    for tb in sorted(choices):
                                        cb = -11
                                        out = [evaluate(j, cb, db, hb, *tb) for j in indices]
                                        h = max(ha, hb)
                                        period = int(2*h/d)
                                        horizon = min(period, len(aa))
                                        threshold = [next((i for i in range(horizon)
                                                           if out[i] >= out[0]+j*h), horizon)
                                                     for j in (1, 2)]
                                        assert 1 <= threshold[0] <= threshold[1] <= horizon
                                        got = [evaluate(i, out[0], d, h, *threshold)
                                               for i in range(len(aa))]
                                        assert got == out, (d, ha, ta, db, hb, tb, left, got, out)
                                        counts['compositions'] += 1
                                        counts['comparisons'] += len(aa)
                                        counts['constant_restrictions'] += len(set(out)) == 1
                                        counts['half_height'] += ha == F(d, 2) or hb == F(db, 2)
                                        counts['rebased'] += left != 0
    # Independently check the manuscript's one-addition illustration at p=4.
    representable = list(range(8, 16))+list(range(16, 32, 2))
    def nearest_even(x):
        return min(representable, key=lambda y: (abs(y-x), (y//(1 if y < 16 else 2)) % 2))
    figure = [nearest_even(16+i)-16 for i in range(8)]
    assert figure == [0, 0, 2, 4, 4, 4, 6, 8]
    return dict(status='PASS', counts=counts, seed=2026111421,
                figure_outputs=figure,
                coverage='synthetic records; clipped/coincident thresholds; affine half-heights; shifted domains; constant restrictions',
                limitations='bounded exact enumeration; not a formal proof or a hardware benchmark',
                code_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())


if __name__ == '__main__':
    result = run()
    Path(__file__).with_name('record_closure_results.json').write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result, indent=2))
