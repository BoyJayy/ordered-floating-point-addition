"""Integer-lattice verifier for the fixed-multiset permutation construction."""

from bisect import bisect_right
from itertools import permutations, product
from math import factorial
import json
import random

from check_fp_markers import round_integer

SEED = 2026110721


def parameters(precision, count):
    boundary = 1 << precision
    assert count >= 1 and boundary >= 64 * count * count
    base = 3 * boundary // 4
    shifts = tuple(boundary // 16 + 4 * index for index in range(count))
    bases = tuple(13 * boundary // 16 + 4 * count * (slot + 1) for slot in range(count))
    toggles = tuple(
        boundary + (4 if slot % 2 else 1) - threshold
        for slot, threshold in enumerate(bases)
    )
    return boundary, base, shifts, toggles


def construction(precision, permutation):
    count = len(permutation)
    assert sorted(permutation) == list(range(count))
    boundary, base, shifts, toggles = parameters(precision, count)
    operands = []
    effective = []
    for slot, index in enumerate(permutation):
        shift = shifts[index]
        toggle = toggles[slot]
        operands.extend((shift, toggle, -toggle, -shift))
        threshold = base + 4 * (count * (slot + 1) - index)
        assert base + 4 * count * slot < threshold <= base + 4 * count * (slot + 1)
        effective.append(threshold)
    assert sum(operands) == 0
    assert sorted(operands) == sorted(value for mag in shifts + toggles for value in (mag, -mag))
    assert len(set(operands)) == 4 * count
    assert all(boundary // 16 <= abs(value) <= 3 * boundary // 16 for value in operands)
    assert all(round_integer(value, precision) == value for value in operands)
    return operands, effective


def checked_fold(precision, operands, effective, initial):
    boundary = 1 << precision
    assert 3 * boundary // 4 < initial <= 13 * boundary // 16 and initial % 4 == 0
    accumulator = initial
    for operand in operands:
        exact = accumulator + operand
        assert 3 * boundary // 4 <= exact < 2 * boundary
        accumulator = round_integer(exact, precision)
        assert 3 * boundary // 4 <= accumulator < 2 * boundary
    parity = bisect_right(effective, initial) % 2
    assert accumulator == initial - parity
    return parity


def exhaustive(count):
    precision = (64 * count * count - 1).bit_length()
    _, base, _, _ = parameters(precision, count)
    markers = range(base + 4, base + 4 * count * count + 1, 4)
    signatures = set()
    for order in permutations(range(count)):
        operands, effective = construction(precision, order)
        signature = tuple(checked_fold(precision, operands, effective, x) for x in markers)
        assert signature not in signatures
        signatures.add(signature)
    assert len(signatures) == factorial(count)
    return dict(precision=precision, k=count, blocks=len(signatures), probes=len(markers) * len(signatures))


def rank_decoder_exhaustive(count):
    """Check each conditional next-bit query in the bounded factoradic encoding."""
    precision = (64 * count * count - 1).bit_length()
    _, base, _, _ = parameters(precision, count)
    bit_counts = [(count - slot).bit_length() - 1 for slot in range(count)]
    encoded_blocks = 0
    decoded_bits = 0
    for ranks in product(*(range(1 << width) for width in bit_counts)):
        # Descending shift indices give ascending effective thresholds.
        remaining = list(reversed(range(count)))
        order = []
        queries = []
        for slot, (rank, width) in enumerate(zip(ranks, bit_counts, strict=True)):
            for bit in reversed(range(width)):
                prefix = rank >> (bit + 1)
                middle_rank = (prefix << (bit + 1)) + (1 << bit) - 1
                marker = base + 4 * (count * (slot + 1) - remaining[middle_rank])
                expected = (rank >> bit) % 2
                queries.append((slot, marker, expected))
            order.append(remaining.pop(rank))
        operands, effective = construction(precision, order)
        for slot, marker, expected in queries:
            parity = checked_fold(precision, operands, effective, marker)
            assert (parity ^ (slot % 2) ^ 1) == expected
            decoded_bits += 1
        encoded_blocks += 1
    assert encoded_blocks == 1 << sum(bit_counts)
    assert decoded_bits == encoded_blocks * sum(bit_counts)
    return dict(precision=precision, k=count, encoded_blocks=encoded_blocks, decoded_bits=decoded_bits)


def sampled(precision, count, rng):
    _, base, _, _ = parameters(precision, count)
    markers = range(base + 4, base + 4 * count * count + 1, 4)
    probes = 0
    comparisons = 0
    for _ in range(12):
        order = rng.sample(range(count), count)
        other_order = rng.sample(range(count), count)
        if order == other_order:
            other_order[0], other_order[1] = other_order[1], other_order[0]
        operands, effective = construction(precision, order)
        other_operands, other_effective = construction(precision, other_order)
        test_markers = {markers[0], markers[-1], *rng.sample(markers, min(32, len(markers)))}
        for threshold in (effective[0], effective[count // 2], effective[-1]):
            test_markers.update(x for x in (threshold - 4, threshold, threshold + 4) if x in markers)
        for x in sorted(test_markers):
            checked_fold(precision, operands, effective, x)
            probes += 1
        first = min(set(effective) ^ set(other_effective))
        assert checked_fold(precision, operands, effective, first) != checked_fold(
            precision, other_operands, other_effective, first
        )
        probes += 2
        comparisons += 1
    return dict(precision=precision, k=count, probes=probes, comparisons=comparisons)


def main():
    rng = random.Random(SEED)
    print(json.dumps({
        "status": "PASS",
        "model": "integer lattice, exact binary RN ties-to-even",
        "seed": SEED,
        "exhaustive": [exhaustive(k) for k in range(1, 7)],
        "rank_decoder_exhaustive": [rank_decoder_exhaustive(k) for k in range(1, 8)],
        "sampled": [sampled(p, k, rng) for p, k in ((11, 5), (24, 128), (53, 512))],
    }, indent=2))


if __name__ == "__main__":
    main()
