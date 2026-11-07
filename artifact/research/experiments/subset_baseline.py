"""Classical enumerative coding upper bound for the constructed family only."""

from bisect import bisect_right
import json
from math import comb
import random


def encode(indices):
    return sum(comb(value, i) for i, value in enumerate(indices, 1))


def decode(code, universe, count):
    result = []
    upper = universe - 1
    for i in range(count, 0, -1):
        low, high = i - 1, upper
        while low < high:
            middle = (low + high + 1) // 2
            if comb(middle, i) <= code:
                low = middle
            else:
                high = middle - 1
        result.append(low)
        code -= comb(low, i)
        upper = low - 1
    assert code == 0
    return tuple(reversed(result))


def main():
    rng = random.Random(771106)
    records = []
    for precision in (4, 6, 11, 24, 53):
        N = (1 << (precision - 2)) - 2
        for n in (1, 2, 8, 32, 128):
            if n > N:
                continue
            thresholds = tuple(sorted(rng.sample(range(N), n)))
            code = encode(thresholds)
            choices = comb(N, n)
            bits = (choices - 1).bit_length()
            assert 0 <= code < choices
            restored = decode(code, N, n)
            assert restored == thresholds
            points = tuple(sorted({0, N - 1, *thresholds, *[rng.randrange(N) for _ in range(100)]}))
            for point in points:
                x = 8 + 4 * point
                expected = x - (bisect_right(thresholds, point) % 2)
                actual = x - (bisect_right(restored, point) % 2)
                assert actual == expected
            records.append(dict(precision=precision, input_additions=2*n, threshold_count=n,
                                universe=N, lower_bound_bits=bits, matching_family_code_bits=bits,
                                witness_queries=len(points)))
    print(json.dumps(dict(seed=771106, method="classical combinatorial number system",
                          scope="only constructed threshold family on marker states; not a new coding algorithm",
                          cases=records), indent=2))


if __name__ == "__main__":
    main()
