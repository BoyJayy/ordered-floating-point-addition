"""Check inverse cuts against explicit binary format output tables."""
from bisect import bisect_left, bisect_right
from fractions import Fraction
from itertools import combinations_with_replacement
import json
from math import inf

from merge_indices import balanced, global_inverse2, preimage_interval2


def main():
    # The table at p=2, E=2 has finite inputs -6,-4,-3,...,3,4,6.
    # After +1, both 3 and 4 give 4; 6 overflows at the tie with 8.
    plus_one = (-4, -3, -2, -1, 0, 1, 2, 3, 4, 4, inf)
    cases = [
        (2, 1, (), (-3, -2, -1, 0, 1, 2, 3)),
        (2, 2, (1,), plus_one),
        (2, 2, (-1,), tuple(-y for y in reversed(plus_one))),
    ]
    targets = {Fraction(n, d) for d in (1, 2, 3, 4) for n in range(-7*d, 7*d+1)}
    # These targets lie on opposite sides of 1 but become equal in binary64.
    delta = Fraction(1, 2**400)
    targets.update((1-delta, 1+delta, -1-delta, -1+delta))
    targets = sorted(targets)
    cut_count = interval_count = 0
    for precision, binades, operands, outputs in cases:
        index = balanced(precision, binades, operands)
        for target in targets:
            # Use the original target and direct comparisons in the oracle.
            expected_left = bisect_left(outputs, target)
            expected_right = bisect_right(outputs, target)
            assert global_inverse2(index, 2*target) == expected_left, (operands, target)
            assert global_inverse2(index, 2*target, strict=True) == expected_right, (operands, target)
            cut_count += 2
        for lo, hi in combinations_with_replacement(targets, 2):
            expected = bisect_left(outputs, lo), bisect_right(outputs, hi)
            assert preimage_interval2(index, 2*lo, 2*hi) == expected, (operands, lo, hi)
            interval_count += 1
    print(json.dumps(dict(status='PASS', tables=len(cases), targets_per_table=len(targets),
                          cut_queries=cut_count, interval_queries=interval_count)))


if __name__ == '__main__':
    main()
