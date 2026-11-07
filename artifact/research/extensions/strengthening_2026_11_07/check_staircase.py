"""Full-table and large-grid tests; no GPU runs or throughput claims."""
from bisect import bisect_left
from fractions import Fraction
from pathlib import Path
import json
import random

from staircase_summary import StaircaseSummary, binary_round


def table(p, k):
    r = 1 << p
    return [Fraction(r, 2)-Fraction(1, 2)] + [
        value for e in range(k) for value in range((r//2) << e, r << e, 1 << e)
    ] + [(r//2) << k]


def neighbour_round(z, values):
    at = bisect_left(values, z)
    indices = range(max(0, at-1), min(len(values), at+1))
    # The first entry is the odd-significand predecessor of the corridor.
    return min((values[i] for i in indices), key=lambda v: (
        abs(v-z), (bisect_left(values, v)+1) % 2))


def independent_large_round(z, p):
    """Nearest neighbours from three binades, without the main quantizer."""
    z = Fraction(z)
    assert z > 0
    e0 = z.numerator.bit_length()-z.denominator.bit_length()
    candidates = []
    for exponent in (e0-1, e0, e0+1):
        spacing = Fraction(2)**(exponent-p+1)
        first, last = 1 << (p-1), 1 << p
        center = z//spacing
        for significand in (first, last, center, center+1):
            if first <= significand <= last:
                candidates.append((significand*spacing, significand & 1))
    return min(candidates, key=lambda item: (abs(item[0]-z), item[1]))[0]


def full_checks():
    rng = random.Random(2026110703)
    counts = dict(blocks=0, prefixes=0, queries=0, relaxed_prefixes=0, max_pieces=0)
    rows = []
    for p in (6, 8, 10, 12):
        for k in (2, 3, 5, 8):
            values = table(p, k)
            for trial in range(8):
                summary = StaircaseSummary(p, k)
                xs = [summary.first_input+4*i for i in range(summary.length)]
                ys = xs[:]
                operands = []
                for step in range(32):
                    for attempt in range(200):
                        if attempt == 199:
                            proposed = Fraction(0)
                        elif step % 7 == 0 and attempt == 0:
                            proposed = Fraction(summary.low)-ys[0]-Fraction(1, 4)
                        elif trial % 3 == 0:
                            proposed = Fraction(rng.randint(-2*summary.r, 2*summary.r), 4)
                        else:
                            proposed = Fraction(rng.randint(
                                4*(summary.low-ys[0]), 4*(summary.high-ys[-1])-1), 4)
                        operand = binary_round(proposed, p)
                        exacts = [Fraction(y)+operand for y in ys]
                        new = [neighbour_round(z, values) for z in exacts]
                        if all(summary.low <= z < summary.high for z in new):
                            break
                    else:
                        raise AssertionError('failed to construct valid test block')
                    summary.append(operand)
                    got = [summary.evaluate_index(i) for i in range(len(xs))]
                    assert got == new, (p, k, trial, step, operand, got, new)
                    assert len(summary.pieces) <= min(summary.length, 1+(k-1)*(step+1))
                    counts['prefixes'] += 1
                    counts['queries'] += len(xs)
                    counts['relaxed_prefixes'] += any(z < summary.low for z in exacts)
                    counts['max_pieces'] = max(counts['max_pieces'], len(summary.pieces))
                    ys = new
                    operands.append(str(operand))
                counts['blocks'] += 1
                rows.append(dict(p=p, k=k, trial=trial, operands=operands,
                                 final_pieces=len(summary.pieces)))
    return dict(status='PASS', seed=2026110703, **counts, rows=rows)


def fixture_checks():
    s = StaircaseSummary(8, 3)
    s.append(386)
    values = [s.evaluate_index(i) for i in range(s.length)]
    assert values == [520, 528, 528, 536, 536, 544, 544, 552, 552, 560, 560, 568, 568, 576]
    assert len(s.pieces) == 1
    f = StaircaseSummary(7, 4)
    f.append(Fraction(-33, 4))
    assert [f.evaluate_index(i) for i in range(f.length)] == list(range(64, 88, 4))
    before = f.descriptor()
    rejected = 0
    for operand in (-f.high, f.high, Fraction(1, 3)):
        try:
            f.append(operand)
        except ValueError:
            rejected += 1
        else:
            raise AssertionError('invalid block accepted')
        assert f.descriptor() == before
    invalid_queries = 0
    for query in (f.first_input-4, f.first_input+1, f.first_input+4*f.length):
        try:
            f.evaluate(query)
        except (IndexError, ValueError):
            invalid_queries += 1
        else:
            raise AssertionError('invalid query accepted')
    return dict(status='PASS', old_dense_deviations=s.descriptor(),
                strict_lower_fringe=f.descriptor(),
                invalid_updates_rejected_without_mutation=rejected,
                invalid_queries_rejected=invalid_queries)


def large_checks():
    rows = []
    for p in (24, 53):
        for k in (3, 20, 64):
            summary = StaircaseSummary(p, k)
            count = 32
            markers = [summary.first_input + 4*((j+1)*(summary.length-1)//(count+1))
                       for j in range(count)]
            operands = []
            for j, marker in enumerate(markers):
                radius = summary.r+(1 if j % 2 == 0 else 4)-marker
                operands.extend((radius, -radius))
            operands.append(3*summary.r//2+2)
            if k > 3:
                operands.append((1 << (k-2))*summary.r)
            for operand in operands:
                summary.append(operand)
            rng = random.Random(123+p+k)
            indices = {0, summary.length-1}
            indices.update(rng.randrange(summary.length) for _ in range(256))
            for piece in summary.pieces:
                for i in (piece.start-1, piece.start, piece.stop-1, piece.stop):
                    if 0 <= i < summary.length:
                        indices.add(i)
            for i in indices:
                y = summary.first_input+4*i
                for operand in operands:
                    y = independent_large_round(y+operand, p)
                    assert summary.low <= y < summary.high
                assert summary.evaluate_index(i) == y
            rows.append(dict(p=p, k=k, queries_in_domain=summary.length,
                             operands=len(operands), records=len(summary.pieces),
                             samples=len(indices), full_grid_enumerated=False,
                             old_residue_classes=min(summary.length, 1 << (k-2)),
                             counts=summary.counts))
    return dict(status='PASS', examples=rows,
                qualification='Operation counts and samples, not GPU/CPU timings or a fixed-width codec')


if __name__ == '__main__':
    result = dict(scope='exact arithmetic; no hardware measurements')
    for name, function in [('fixtures', fixture_checks), ('full', full_checks), ('large', large_checks)]:
        result[name] = function()
        print(name+': PASS', flush=True)
    result['status'] = 'PASS'
    Path(__file__).with_name('staircase_results.json').write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({key: ({k:v for k,v in value.items() if k != 'rows'}
                            if isinstance(value, dict) else value)
                      for key, value in result.items()}, indent=2))
