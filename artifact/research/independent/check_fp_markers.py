"""Independent integer-lattice check of the sequential FP marker construction."""

from collections import Counter
from itertools import combinations, product
from math import comb
import json
import random

SEED = 2026110719


def round_integer(value, precision):
    """Round an exact integer to a binary significand with ties-to-even."""
    magnitude = abs(value)
    unit = 1 << max(0, magnitude.bit_length() - precision)
    quotient, remainder = divmod(magnitude, unit)
    if 2 * remainder > unit or (2 * remainder == unit and quotient % 2):
        quotient += 1
    rounded = quotient * unit
    return -rounded if value < 0 else rounded


def marker_range(precision):
    return range(8, 1 << precision, 4)


def operand_pairs(precision, selected):
    boundary = 1 << precision
    for index, threshold in enumerate(selected):
        addend = boundary - threshold + (4 if index % 2 else 1)
        assert 0 < addend < boundary
        assert round_integer(addend, precision) == addend
        assert round_integer(-addend, precision) == -addend
        yield addend, -addend


def checked_fold(precision, selected, initial, padding=0):
    boundary = 1 << precision
    assert initial in marker_range(precision)
    assert round_integer(initial, precision) == initial
    value = initial
    parity = 0
    for threshold, pair in zip(selected, operand_pairs(precision, selected), strict=True):
        for operand in pair:
            exact = value + operand
            assert 0 < exact < 2 * boundary
            value = round_integer(exact, precision)
            assert 0 < value < 2 * boundary
        parity ^= int(threshold <= initial)
        assert value == initial - parity, (precision, threshold, initial, value, parity)
    for _ in range(padding):
        value = round_integer(value + 0, precision)
    assert value == initial - parity
    return parity


def exhaust(precision):
    markers = marker_range(precision)
    total = len(markers)
    assert total == (1 << (precision - 2)) - 2
    seen = set()
    sizes = Counter()
    for count in range(total + 1):
        for selected in combinations(markers, count):
            signature = tuple(
                checked_fold(precision, selected, x, padding=2 * (total - count))
                for x in markers
            )
            assert signature not in seen, (precision, selected, signature)
            seen.add(signature)
            sizes[count] += 1

    assert len(seen) == 1 << total
    assert all(sizes[count] == comb(total, count) for count in sizes)
    return {
        "precision": precision,
        "markers": total,
        "subsets": len(seen),
        "marker_evaluations": total * len(seen),
        "padded_length": 2 * total,
        "fixed_n_counts": [sizes[n] for n in range(total + 1)],
    }


def sample(precision, rng):
    markers = marker_range(precision)
    total = len(markers)
    assert total == (1 << (precision - 2)) - 2
    counts = [n for n in (1, 2, 7, 31, 127, 1024) if n < total]
    evaluations = 0
    checked_distinctions = 0
    for count in counts:
        for _ in range(12):
            selected = tuple(sorted(rng.sample(markers, count)))
            other = tuple(sorted(rng.sample(markers, count)))
            # Exercise both ends, random interior markers and points at a
            # selected threshold or the preceding/following marker.
            probes = {markers[0], markers[-1], *rng.sample(markers, min(24, total))}
            for threshold in (selected[0], selected[count // 2], selected[-1]):
                probes.update(x for x in (threshold - 4, threshold, threshold + 4) if x in markers)
            for point in sorted(probes):
                checked_fold(precision, selected, point, padding=6)
                evaluations += 1
            differing = set(selected) ^ set(other)
            if differing:
                first = min(differing)
                assert checked_fold(precision, selected, first) != checked_fold(precision, other, first)
                evaluations += 2
                checked_distinctions += 1
    return {
        "precision": precision,
        "markers": total,
        "sampled_cardinalities": counts,
        "selected_subsets": len(counts) * 12,
        "marker_evaluations": evaluations,
        "distinct_pair_checks": checked_distinctions,
    }


def check_group_index(precision):
    """Exhaustively test the Augmented INDEX query decoder on small formats."""
    markers = marker_range(precision)
    total = len(markers)
    encoded_blocks = 0
    decoded_bits = 0
    for count in range(1, total):
        groups = min(count, total - count)
        bits = (total // groups).bit_length() - 1
        width = 1 << bits
        complement = count > total // 2
        for positions in product(range(width), repeat=groups):
            choices = {markers[group * width + position] for group, position in enumerate(positions)}
            selected = tuple(t for t in markers if (t in choices) != complement)
            assert len(selected) == count
            encoded_blocks += 1
            for group, position in enumerate(positions):
                for bit in reversed(range(bits)):
                    prior_bits = position >> (bit + 1)
                    midpoint = (prior_bits << (bit + 1)) + (1 << bit) - 1
                    marker_index = group * width + midpoint
                    parity = checked_fold(precision, selected, markers[marker_index])
                    if complement:
                        parity ^= (marker_index + 1) % 2
                    recovered = parity ^ (group % 2) ^ 1
                    assert recovered == (position >> bit) % 2
                    decoded_bits += 1
    return {
        "precision": precision,
        "encoded_blocks": encoded_blocks,
        "decoded_bits": decoded_bits,
    }


def main():
    rng = random.Random(SEED)
    print(json.dumps({
        "status": "PASS",
        "model": "integer lattice, binary significand RN ties-to-even, finite exponent range assumed",
        "seed": SEED,
        "command": "python3 -B independent/check_fp_markers.py",
        "exhaustive": [exhaust(p) for p in (4, 5, 6)],
        "sampled": [sample(p, rng) for p in (8, 11, 24, 53)],
        "group_index_decoder": [check_group_index(p) for p in (4, 5, 6)],
    }, indent=2))


if __name__ == "__main__":
    main()
