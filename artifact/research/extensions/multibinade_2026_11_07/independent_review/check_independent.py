"""Independent exact finite checks of the multibinade proof draft.

No manuscript/original checker code is imported. The rounding oracle enumerates
the representable states and compares exact integer distances at scale four.
Quarter offsets cover integer, tie, and the two open half-unit cells; they do
not turn finite precision/range tests into an all-precision proof.
"""
from bisect import bisect_left, bisect_right
from itertools import product
from math import comb, gcd, log2
from pathlib import Path
import hashlib
import json
import random
import time

HERE = Path(__file__).resolve().parent


def phi(g, q):
    return q - gcd(q, g)


def uniform(x4, h):
    quotient, remainder = divmod(x4, 4 * h)
    if 2 * remainder > 4 * h or (2 * remainder == 4 * h and quotient % 2):
        quotient += 1
    return quotient * h


def representable_scaled(a4, p):
    n = abs(a4)
    if not n:
        return True
    while n % 2 == 0:
        n //= 2
    return n.bit_length() <= p


class EnumeratedOracle:
    def __init__(self, p, k):
        self.p, self.k = p, k
        self.r, self.q = 1 << p, 1 << k
        self.lower, self.upper = self.r // 2, (1 << (k - 1)) * self.r
        self.boundaries = [self.r << i for i in range(k - 1)]
        self.states = []
        for b in range(k):
            step = 1 << b
            self.states.extend(range((self.r // 2) * step, self.r * step, step))
        self.states.append(self.upper)  # Required to detect a rounded-out promise.
        self.states4 = [4 * x for x in self.states]
        self.state_set = set(self.states[:-1])

    def round(self, x4):
        if not 4 * self.lower <= x4 < 4 * self.upper:
            return None
        j = bisect_left(self.states4, x4)
        if self.states4[j] == x4:
            result = self.states[j]
        else:
            lo, hi = self.states[j - 1], self.states[j]
            dlo, dhi = x4 - 4 * lo, 4 * hi - x4
            if dlo < dhi:
                result = lo
            elif dhi < dlo:
                result = hi
            else:
                # The lower value determines the local binade's ulp; at a
                # boundary the upper significand is even in either lattice.
                local_spacing = hi - lo
                result = lo if (lo // local_spacing) % 2 == 0 else hi
        return result if result < self.upper else None

    def crossings(self, u4, v4):
        boundaries4 = [4*b for b in self.boundaries]
        return max(0, bisect_left(boundaries4, v4) - bisect_right(boundaries4, u4))


def check_uniform():
    count = 0
    case_counts = {"even_translate": 0, "odd_lattice_translate": 0, "non_lattice_gap": 0}
    for k in range(2, 11):
        q = 1 << k
        for b in range(k):
            h = 1 << b
            # One full ties-even period, plus negative translations checked
            # separately below. All quarter phases included.
            rounded = [uniform(x4, h) for x4 in range(8 * h + 4 * q)]
            for u4 in range(8 * h):
                ru = rounded[u4]
                for g in range(q):
                    gp = rounded[u4 + 4 * g] - ru
                    charge = abs(gp - g) + phi(gp, q) - phi(g, q)
                    assert charge <= 0, ("uniform", k, h, u4, g, gp, charge)
                    category = ("even_translate" if g % (2 * h) == 0 else
                                "odd_lattice_translate" if g % h == 0 else "non_lattice_gap")
                    case_counts[category] += 1
                    count += 1
            for u4, g in product((-17 * h - 2, -8 * h, -1), (0, 1, h, q, 7 * q + 1)):
                gp = uniform(u4 + 4 * g, h) - uniform(u4, h)
                assert abs(gp - g) + phi(gp, q) - phi(g, q) <= 0
                count += 1
    return {"checks": count, "Q_powers": [2, 10], "cases": case_counts}


def check_boundary():
    counts = {str(c): 0 for c in range(5)}
    charges = {}
    total = 0
    counterexample_to_overclaim = None
    for k in range(2, 6):
        oracle = EnumeratedOracle(6, k)
        boundaries = [4*b for b in oracle.boundaries]
        for fraction4 in range(4):
            xs = list(range(oracle.lower, oracle.upper))
            rounded = [oracle.round(4 * x + fraction4) for x in xs]
            left_count = [bisect_right(boundaries, 4*x+fraction4) for x in xs]
            right_count = [bisect_left(boundaries, 4*x+fraction4) for x in xs]
            for i, u in enumerate(xs):
                ru = rounded[i]
                if ru is None:
                    continue
                for j in range(i, len(xs)):
                    rv = rounded[j]
                    if rv is None:
                        continue
                    g, gp = xs[j] - u, rv - ru
                    c = max(0, right_count[j] - left_count[i])
                    charge = abs(gp - g) + phi(gp, oracle.q) - phi(g, oracle.q)
                    assert charge <= oracle.q * c, ("boundary", k, 4*u+fraction4, 4*xs[j]+fraction4, g, gp, c, charge)
                    counts[str(c)] += 1
                    charges[str(c)] = max(charges.get(str(c), 0), charge)
                    if charge > oracle.q and counterexample_to_overclaim is None:
                        counterexample_to_overclaim = {"p": 6, "K": k, "u_times_4": 4*u+fraction4,
                            "v_times_4": 4*xs[j]+fraction4, "g": g, "g_prime": gp, "Q": oracle.q,
                            "crossed_boundaries": c, "charge": charge}
                    total += 1
    assert counterexample_to_overclaim is not None
    return {"checks": total, "p": 6, "K_values": [2, 3, 4, 5],
            "strict_crossing_counts": counts, "max_charge_by_crossing_count": charges,
            "counterexample_to_charge_at_most_Q": counterexample_to_overclaim}


def check_histories():
    rng = random.Random(712031)
    prefixes, query_checks, negatives, subunits, coalescences = 0, 0, 0, 0, 0
    # Includes K>p and singleton residue classes. No outside code is imported.
    configurations = [(6, 2), (6, 3), (6, 5), (6, 8), (8, 2), (8, 4), (10, 3), (10, 6)]
    examples = []
    for p, k in configurations:
        o = EnumeratedOracle(p, k)
        xstar = list(range(o.r//2 + 8, 3*o.r//4, 4))
        assert len(xstar) == o.r//16 - 2
        groups = {}
        for i, x in enumerate(xstar):
            groups.setdefault(x % o.q, []).append(i)
        for trial in range(12):
            states = xstar[:]
            variation = {res: 0 for res in groups}
            for t in range(1, 65):
                if t % 4 == 0:
                    proposals = [-rng.randrange(1, 4*o.r) for _ in range(80)]
                else:
                    proposals = [rng.randrange(-4*o.r, 4*o.upper) for _ in range(80)]
                proposals.extend((1, -1, 2, -2, 0))
                for a4 in proposals:
                    if not representable_scaled(a4, p):
                        continue
                    new = [o.round(4 * y + a4) for y in states]
                    if all(v is not None for v in new):
                        break
                else:
                    raise AssertionError("Zero addition should always be admissible")
                negatives += a4 < 0
                subunits += 0 < abs(a4) < 4
                assert all(y in o.state_set for y in new)
                assert new == sorted(new)
                for res, indices in groups.items():
                    gaps_old = [states[j]-states[i] for i,j in zip(indices, indices[1:])]
                    gaps_new = [new[j]-new[i] for i,j in zip(indices, indices[1:])]
                    variation[res] += sum(abs(a-b) for a,b in zip(gaps_old,gaps_new))
                    assert variation[res] <= o.q * (k-1) * t
                    assert sum(abs(g-o.q) for g in gaps_new) <= o.q * (k-1) * t
                    assert sum(g != o.q for g in gaps_new) <= (k-1) * t
                    coalescences += sum(g == 0 for g in gaps_new)
                states = new
                prefixes += 1
                query_checks += len(states)
            examples.append({"p": p, "K": k, "q_classes": len(groups), "L": len(xstar), "trial": trial,
                             "final_distinct_outputs": len(set(states))})
    assert negatives > 0 and subunits > 0
    return {"seed": 712031, "prefixes": prefixes, "query_checks": query_checks,
            "negative_additions": negatives, "subunit_additions": subunits,
            "observed_zero_gaps": coalescences, "configurations": configurations,
            "block_examples": examples}


def magnitude_vectors(n, budget):
    if n == 0:
        yield ()
    else:
        for first in range(budget + 1):
            for tail in magnitude_vectors(n - 1, budget - first):
                yield (first,) + tail


def check_fixed_width_codes():
    vector_checks = signed_checks = 0
    for n in range(5):
        for budget in range(9):
            vectors = list(magnitude_vectors(n, budget))
            assert len(vectors) == comb(n + budget, budget)
            bits = (len(vectors) - 1).bit_length()
            sign_width = min(n, budget)
            seen = {}
            for rank, mag in enumerate(vectors):
                active = [i for i, value in enumerate(mag) if value]
                assert len(active) <= sign_width
                for signs in product((0,1), repeat=len(active)):
                    code = rank << sign_width
                    deviations = list(mag)
                    for j, (i, sign) in enumerate(zip(active, signs)):
                        code |= sign << j
                        if sign:
                            deviations[i] = -deviations[i]
                    assert code < (1 << (bits + sign_width))
                    assert code not in seen or seen[code] == tuple(deviations)
                    seen[code] = tuple(deviations)
                    decoded_mag = vectors[code >> sign_width]
                    decoded = list(decoded_mag)
                    j = 0
                    for i, val in enumerate(decoded):
                        if val:
                            if (code >> j) & 1:
                                decoded[i] = -val
                            j += 1
                    assert decoded == deviations
                    signed_checks += 1
                vector_checks += 1
    for p in (6,8,16,24,53):
        for k in (2,3,6,60):
            r, q = 1 << p, 1 << k
            l = r//16 - 2
            assert l >= 2
            assert min(l, q//4) <= q//4
            upper = (1 << (k-1))*r
            assert upper.bit_length() - 1 == p+k-1
            assert (upper-1).bit_length() <= p+k-1
    return {"magnitude_vectors": vector_checks, "signed_vector_roundtrips": signed_checks,
            "includes_zero_length_vectors": True, "includes_zero_sign_width": True,
            "large_parameter_formula_checks": "p up to53, K up to60; no enumeration of large grids"}


def fixtures():
    o = EnumeratedOracle(8,3)
    xs = list(range(136, 189, 4))
    outputs = [o.round(4*(x+386)) for x in xs]
    gaps = [b-a for a,b in zip(outputs, outputs[1:])]
    assert gaps == [8 if i%2 == 0 else 0 for i in range(len(gaps))]
    assert sum(g != 4 for g in gaps) > 1
    o2 = EnumeratedOracle(6,4)
    u,v = 51,291
    g = v-u
    gp = o2.round(4*v)-o2.round(4*u)
    charge = abs(gp-g) + phi(gp,o2.q)-phi(g,o2.q)
    assert charge == 18 and o2.crossings(4*u,4*v) == 3
    assert 48 in o2.state_set and 288 in o2.state_set  # prior states, common operand3
    # The upper rounded endpoint is excluded even when the exact sum is inside.
    assert o2.round(4*511) is None
    assert o2.round(4*32) == 32
    # A genuinely uniform-in-K O(m log(1+R/m)) bound is impossible:
    # p and m stay fixed, while one query distinguishes K two-operand blocks.
    big = EnumeratedOracle(6,64)
    first_query = big.r//2 + 8
    distinguishable = [first_query]
    for j in range(big.k-1):
        a = big.r << j
        assert representable_scaled(4*a, big.p)
        outputs_j = [big.round(4*(x+a)) for x in (first_query, first_query+4)]
        assert all(v is not None and a <= v < 2*a for v in outputs_j)
        distinguishable.append(outputs_j[0])
    assert len(set(distinguishable)) == big.k
    return {"step_four_failure": {"p":8,"K":3,"operand":386,"outputs":outputs,"gaps":gaps},
            "universal_Q_charge_failure": {"p":6,"K":4,"prior_states":[48,288],"operand":3,
                "exact_values":[51,291],"rounded_values":[51,288],"g":g,"g_prime":gp,"charge":charge,
                "bound_Q_times_c":48},
            "rounded_upper_endpoint_rejected": True,
            "uniform_in_K_bound_failure": {"p":6,"m":2,"K":64,"distinct_transfers":len(set(distinguishable)),
                "general_argument":"K distinguishable maps from [0,0] and [2^(p+j),0], j=0,...,K-2; B>=ceil(log2 K)"}}


def main():
    started = time.monotonic()
    report = {"status":"RUNNING", "arithmetic":"exact integer comparisons on scaled rational endpoints; no GPU measurements",
              "scope":"finite exact checks; not an all-precision proof"}
    for name, task in [("fixtures",fixtures), ("uniform_lemma",check_uniform), ("boundary_lemma",check_boundary),
                       ("histories",check_histories), ("fixed_width_codes",check_fixed_width_codes)]:
        part_start = time.monotonic()
        report[name] = task()
        report[name]["seconds"] = round(time.monotonic()-part_start,3)
        print(name, "PASS", report[name]["seconds"], flush=True)
        (HERE/"results.json").write_text(json.dumps(report,indent=2)+"\n")
    report["status"] = "PASS"
    report["total_seconds"] = round(time.monotonic()-started,3)
    (HERE/"results.json").write_text(json.dumps(report,indent=2)+"\n")
    print("ALL CHECKS PASS", report["total_seconds"], flush=True)


if __name__ == "__main__":
    main()
