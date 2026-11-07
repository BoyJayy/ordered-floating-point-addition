"""Check the ordered floating-point transfer family without dependencies."""

import json
import math
import random
import struct
from itertools import combinations, pairwise, product


def round_integer(value, precision):
    magnitude = abs(value)
    shift = max(0, magnitude.bit_length() - precision)
    spacing = 1 << shift
    quotient, remainder = divmod(magnitude, spacing)
    doubled_remainder = 2 * remainder
    if doubled_remainder > spacing or (doubled_remainder == spacing and quotient % 2):
        quotient += 1
    rounded = quotient * spacing
    return -rounded if value < 0 else rounded


def addends(precision, thresholds):
    boundary = 1 << precision
    block = []
    for index, threshold in enumerate(thresholds):
        offset = boundary - threshold + (4 if index % 2 else 1)
        block.extend((offset, -offset))
    return block


def same_multiset_addends(precision, markers, thresholds):
    boundary = 1 << precision
    parity = 0
    block = []
    for marker in markers:
        active = marker in thresholds
        for direction, offset in enumerate((boundary + 1 - marker, boundary + 4 - marker)):
            if active and direction == parity:
                block.extend((offset, -offset))
            else:
                block.extend((-offset, offset))
        parity ^= active
    return block


def evaluate(block, incoming, add):
    state = incoming
    for term in block:
        state = add(state, term)
    return state


def expected(thresholds, incoming):
    return incoming - sum(threshold <= incoming for threshold in thresholds) % 2


def exhaustive(precision):
    markers = range(8, 1 << precision, 4)
    counts = []
    for size in range(len(markers) + 1):
        signatures = set()
        for thresholds in combinations(markers, size):
            block = addends(precision, thresholds)
            observed = tuple(evaluate(block, x, lambda a, b: round_integer(a + b, precision)) for x in markers)
            assert observed == tuple(expected(thresholds, x) for x in markers)
            signatures.add(observed)
        assert len(signatures) == math.comb(len(markers), size)
        counts.append(len(signatures))
    return dict(precision=precision, markers=len(markers), signatures_by_length_pairs=counts)


def exhaustive_multiset(precision):
    boundary = 1 << precision
    markers = range(3 * boundary // 4 + 8, 7 * boundary // 8, 4)
    multiset = sorted(same_multiset_addends(precision, markers, set()))
    assert all(boundary // 8 <= abs(term) < boundary // 4 for term in multiset)
    signatures = set()

    def add(a, b):
        state = round_integer(a + b, precision)
        assert boundary // 2 <= state < 2 * boundary
        return state

    for size in range(len(markers) + 1):
        for thresholds in combinations(markers, size):
            block = same_multiset_addends(precision, markers, set(thresholds))
            assert sorted(block) == multiset
            observed = tuple(evaluate(block, x, add) for x in markers)
            assert observed == tuple(expected(thresholds, x) for x in markers)
            signatures.add(observed)
    assert len(signatures) == 1 << len(markers)
    return dict(precision=precision, markers=len(markers), block_length=len(multiset), signatures=len(signatures))


def gap_potential(gap):
    if gap % 2:
        return 2
    return int(gap % 4 != 0)


def corridor_check(precision):
    boundary = 1 << precision
    markers = tuple(range(boundary // 2 + 4, 2 * boundary - 3, 4))
    alphabet_twice = (-6, -4, -2, -1, 0, 1, 2, 4, 6)
    valid_blocks = 0
    checked_transitions = 0
    max_total_gap_deviation = 0
    for length in range(1, 5):
        for block in product(alphabet_twice, repeat=length):
            states = markers
            for term_twice in block:
                exact_twice = tuple(2 * x + term_twice for x in states)
                if min(exact_twice) < boundary or max(exact_twice) >= 4 * boundary:
                    break
                rounded_twice = tuple(round_integer(x, precision) for x in exact_twice)
                if max(rounded_twice) >= 4 * boundary:
                    break
                assert all(x % 2 == 0 for x in rounded_twice)
                updated = tuple(x // 2 for x in rounded_twice)
                straddles = 0
                for exact, previous, current in zip(pairwise(exact_twice), pairwise(states), pairwise(updated), strict=True):
                    before = previous[1] - previous[0]
                    after = current[1] - current[0]
                    assert after >= 0
                    if exact[0] < 2 * boundary <= exact[1]:
                        straddles += 1
                        assert abs(after - before) <= 1
                    elif after != before:
                        assert abs(after - before) <= 2
                        assert gap_potential(after) < gap_potential(before)
                assert straddles <= 1
                checked_transitions += 1
                states = updated
            else:
                valid_blocks += 1
                deviation = sum(abs((right - left) - 4) for left, right in pairwise(states))
                assert deviation <= 5 * length
                max_total_gap_deviation = max(max_total_gap_deviation, deviation)
    return dict(precision=precision, markers=len(markers), valid_blocks=valid_blocks,
                checked_transitions=checked_transitions, max_total_gap_deviation=max_total_gap_deviation)


def standard_format(precision, format_code, rng):
    markers = range(8, 1 << precision, 4)
    queries = 0

    def add(x, y):
        # These test operands have exact binary64 sums when testing narrower formats.
        return struct.unpack(format_code, struct.pack(format_code, float(x) + float(y)))[0]

    for size in (1, 2, 17, 64):
        for _ in range(12):
            thresholds = sorted(rng.sample(markers, size))
            block = addends(precision, thresholds)
            incoming_states = {markers[0], markers[-1], *thresholds, *rng.sample(markers, 20)}
            incoming_states.update(t - 4 for t in thresholds if t > markers[0])
            for x in incoming_states:
                assert evaluate(block, x, add) == expected(thresholds, x)
            queries += len(incoming_states)
    return dict(precision=precision, format=format_code, queries=queries)


def main():
    seed = 20261107
    rng = random.Random(seed)
    print(json.dumps({
        "seed": seed,
        "exhaustive": [exhaustive(precision) for precision in (4, 5, 6)],
        "same_multiset_exhaustive": [exhaustive_multiset(precision) for precision in (7, 8, 9)],
        "corridor_upper_bound": [corridor_check(precision) for precision in (4, 5, 6)],
        "standard_format": [standard_format(precision, code, rng) for precision, code in ((11, "e"), (24, "f"), (53, "d"))],
    }, indent=2))


if __name__ == "__main__":
    main()
