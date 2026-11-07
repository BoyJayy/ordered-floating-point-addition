"""Independent adversarial oracles; no imports from the proposed proof/checks.

Run with python3 -B research_discovery_2026_11_07/adversarial/math/independent_audit.py.
Requires only stdlib and the already installed z3 package.
"""
from bisect import bisect_left
from fractions import Fraction as F
from itertools import product
import json
import time
import z3


def pow2(e):
    return F(2**e) if e >= 0 else F(1, 2**(-e))


def potential(g):
    return z3.If(g % 2 == 1, 2, z3.If(g % 4 == 2, 1, 0))


def weighted_potential(g):
    return z3.If(g % 2 == 1, 3, z3.If(g % 4 == 2, 2, 0))


def smt_checks():
    """Search the complete rational domain, not a finite addend alphabet."""
    R, gap, u, v = z3.Ints('R gap u v')
    x = z3.Real('x')
    y = x + gap

    def rn(t, out):
        return z3.If(
            t < R,
            z3.And(2*z3.Abs(t-out) <= 1,
                   z3.Implies(2*z3.Abs(t-out) == 1, out % 2 == 0)),
            z3.And(out % 2 == 0, z3.Abs(t-out) <= 1,
                   z3.Implies(z3.Abs(t-out) == 1, out % 4 == 0)))

    base = [R >= 16, R % 4 == 0, gap >= 0,
            2*x >= R, y < 2*R, rn(x, u), rn(y, v),
            2*u >= R, v < 2*R]
    results = {}

    def unsat(name, assumptions, violation):
        solver = z3.Solver()
        solver.set(timeout=60000)
        solver.add(*assumptions, violation)
        answer = solver.check()
        results[name] = str(answer)
        if answer != z3.unsat:
            results[name+'_model'] = str(solver.model()) if answer == z3.sat else solver.reason_unknown()
            raise AssertionError(results)

    newgap = v-u
    unsat('rounding_monotone', base, newgap < 0)
    unsat('nonstraddling_changes_reduce_potential',
          base+[z3.Or(y < R, x >= R)],
          z3.Or(potential(newgap) > potential(gap),
                z3.And(newgap != gap, potential(newgap) >= potential(gap)),
                z3.Abs(newgap-gap) > 2))
    unsat('straddling_gap_changes_at_most_one', base+[x < R, y >= R],
          z3.Abs(newgap-gap) > 1)
    unsat('nonstraddling_gap_four_preserved',
          base+[gap == 4, z3.Or(y < R, x >= R)], newgap != 4)
    weighted_cost = z3.Abs(newgap-gap)+weighted_potential(newgap)-weighted_potential(gap)
    unsat('weighted_nonstraddling_amortized_cost_nonpositive',
          base+[z3.Or(y < R, x >= R)], weighted_cost > 0)
    unsat('weighted_straddling_amortized_cost_at_most_four',
          base+[x < R, y >= R], weighted_cost > 4)

    # The principal pair construction, for arbitrary R divisible by 4.
    X, T, D, C, Q = z3.Ints('X T D C Q')
    radius = R+C-T
    exact = X+D+radius
    pairbase = [R >= 16, R % 4 == 0, X >= 8, X <= R-4, X % 4 == 0,
                T >= 8, T <= R-4, T % 4 == 0, z3.Or(C == 1, C == 4),
                z3.Or(D == 0, D == -1),
                z3.Implies(X >= T, D == z3.If(C == 1, 0, -1)),
                z3.If(exact <= R, Q == exact,
                      z3.And(Q % 2 == 0, z3.Abs(Q-exact) <= 1,
                             z3.Implies(z3.Abs(Q-exact) == 1, Q % 4 == 0)))]
    expected = z3.If(X < T, X+D, z3.If(C == 1, X-1, X))
    unsat('threshold_pair_all_parameters', pairbase,
          z3.Or(radius <= 0, radius >= R, exact <= 0, exact >= 2*R,
                Q-radius != expected, Q-radius < 1, Q-radius >= R))
    return results


class FiniteFormat:
    """Exact gradual-underflow binary format, with signed zeros and infinities."""
    def __init__(self, p, emin, emax):
        self.p, self.emin, self.emax = p, emin, emax
        values = {}
        for mantissa in range(1, 2**(p-1)):
            values[mantissa*pow2(emin-p+1)] = mantissa % 2
        for exponent in range(emin, emax+1):
            for mantissa in range(2**(p-1), 2**p):
                values[mantissa*pow2(exponent-p+1)] = mantissa % 2
        self.positive = sorted(values)
        self.parity = values
        self.states = ['-inf'] + [-v for v in reversed(self.positive)] + ['-0', '+0'] + self.positive + ['+inf']
        self.finite = self.states[1:-1]
        self.ranks = {value: i for i, value in enumerate(self.states)}
        self.overflow = self.positive[-1] + pow2(emax-p)

    @staticmethod
    def numeric(state):
        return F(0) if state in ('-0', '+0') else state

    def round(self, exact, negative_zero=False):
        if exact == 0:
            return '-0' if negative_zero else '+0'
        negative = exact < 0
        exact = abs(exact)
        if exact >= self.overflow:
            return '-inf' if negative else '+inf'
        i = bisect_left(self.positive, exact)
        if i == len(self.positive):
            result = self.positive[-1]
        elif self.positive[i] == exact:
            result = exact
        else:
            lower = self.positive[i-1] if i else F(0)
            upper = self.positive[i]
            dl, du = exact-lower, upper-exact
            result = lower if dl < du or (dl == du and (lower == 0 or self.parity[lower] == 0)) else upper
        if result == 0:
            return '-0' if negative else '+0'
        return -result if negative else result

    def add(self, state, addend):
        if state in ('-inf', '+inf'):
            return state
        return self.round(self.numeric(state)+self.numeric(addend),
                          state == '-0' and addend == '-0')


def finite_checks():
    results = []
    for p, emin, emax in [(2,-3,4), (3,-4,5), (4,-5,6), (3,0,8)]:
        fmt = FiniteFormat(p,emin,emax)
        count = fixed_tail_tests = zero_tests = 0
        worst_ratio = 0
        worst_case = None
        for a in fmt.finite:
            outputs = [fmt.add(x,a) for x in fmt.states]
            ranks = [fmt.ranks[x] for x in outputs]
            assert ranks == sorted(ranks), (p,emin,emax,a,'nonmonotone')
            count += len(outputs)
            A = abs(fmt.numeric(a))
            if not A:
                for x, output in zip(fmt.states,outputs):
                    expected = '+0' if a == '+0' and x == '-0' else x
                    assert output == expected, (a,x,output,expected)
                    zero_tests += 1
                continue
            e = A.numerator.bit_length()-A.denominator.bit_length()
            if pow2(e) > A:
                e -= 1
            assert pow2(e) <= A < pow2(e+1)
            B = pow2(e+p+2)
            central_outputs = []
            for x, output in zip(fmt.states,outputs):
                if x in ('-inf','+inf'):
                    assert output == x
                    continue
                value = fmt.numeric(x)
                if abs(value) >= B:
                    assert output == x, (p,emin,emax,a,x,B,output)
                    fixed_tail_tests += 1
                if abs(value) <= B:
                    central_outputs.append(output)
                    if B <= fmt.positive[-1]:
                        assert output not in ('-inf','+inf') and abs(fmt.numeric(output)) <= B
            image = len(set(central_outputs))
            ratio = image/((p+1)*2**p)
            if ratio > worst_ratio:
                worst_ratio, worst_case = ratio, str(a)
        results.append({'p':p,'emin':emin,'emax':emax,'states':len(fmt.states),
                        'addition_cases':count,'fixed_tail_checks':fixed_tail_tests,
                        'signed_zero_checks':zero_tests,
                        'largest_single_add_central_image_divided_by_p1_2p':worst_ratio,
                        'worst_addend':worst_case})
    return results


def corridor_round(x,R):
    """Independent nearest-neighbor lookup, deliberately not arithmetic rounding."""
    lattice = list(range(R//2,R))+list(range(R,2*R+1,2))
    i = bisect_left(lattice,x)
    if lattice[i] == x:
        return lattice[i]
    low, high = lattice[i-1], lattice[i]
    distance_low, distance_high = x-low, high-x
    if distance_low != distance_high:
        return low if distance_low < distance_high else high
    # The lower candidate's stored significand parity resolves the tie.
    parity = low % 2 if low < R else (low//2) % 2
    return low if parity == 0 else high


def reachable_corridor():
    """Exhaust all reachable transfer signatures using every quarter-step shift.

    For integral states, fractional parts 0,1/4,1/2,3/4 cover every distinct
    rounding map; interval endpoints and ties fall in these classes.
    """
    results = []
    for R, initial, depth in [(16,(8,12),5),(32,(16,20,24,28),4)]:
        layer = {initial}
        all_seen = {initial:0}
        rows = []
        for step in range(1,depth+1):
            next_layer = set()
            transitions = 0
            max_l1 = max_support = 0
            for states in layer:
                # All addends keeping exact inputs inside the promised corridor.
                for aq in range(4*(R//2-states[0]), 4*(2*R-states[-1])):
                    addend = F(aq,4)
                    new = tuple(corridor_round(x+addend,R) for x in states)
                    if new[-1] == 2*R:
                        continue
                    deviations = [b-a-4 for a,b in zip(new,new[1:])]
                    l1 = sum(map(abs,deviations))
                    support = sum(x != 0 for x in deviations)
                    assert l1 <= 4*step and support <= step, (R,states,addend,new)
                    max_l1, max_support = max(max_l1,l1), max(max_support,support)
                    next_layer.add(new)
                    all_seen.setdefault(new,step)
                    transitions += 1
            layer = next_layer
            rows.append({'steps':step,'signatures':len(layer),'transitions':transitions,
                         'max_gap_deviation_l1':max_l1,'max_support':max_support})
        results.append({'R':R,'initial':initial,'layers':rows,'all_signatures':len(all_seen)})
    return results


if __name__ == '__main__':
    started = time.monotonic()
    report = {'smt':smt_checks(), 'finite_formats':finite_checks(),
              'reachable_corridor':reachable_corridor()}
    report['elapsed_seconds'] = round(time.monotonic()-started,3)
    print(json.dumps(report,indent=2))
