"""Arithmetic reference for Kapre--DeHon (ARITH 2007), not an FPGA reproduction.

Use residual target-current with an additive correction. Figure 4 of the paper
prints current-target with an additive correction, an inconsistent sign pair.
We explicitly test the literal convention too; no speed claim is made.
"""
from bisect import bisect_right
from collections import Counter
import json
import math
import random
import struct


def rn(x, precision):
    return struct.unpack('<f', struct.pack('<f', x))[0] if precision == 24 else float(x)


def scan(values, precision):
    out = values[:]
    step = 1
    while step < len(out):
        old = out[:]
        for base in range(0, len(out), 2*step):
            for i in range(base+step, min(base+2*step, len(out))):
                out[i] = rn(old[base+step-1]+old[i], precision)
        step *= 2
    return out


def ordered(values, precision):
    out = []
    state = 0.0
    for value in values:
        state = rn(state+value, precision)
        out.append(state)
    return out


def optimistic(values, precision, literal_sign=False, cap=512):
    current = scan(values, precision)
    truth = ordered(values, precision)
    initially_wrong = sum(x != y for x, y in zip(current, truth))
    seen = set()
    for corrections in range(cap+1):
        signature = tuple(current)
        if signature in seen:
            return dict(status='cycle', corrections=corrections, initially_wrong=initially_wrong)
        seen.add(signature)
        residual = []
        for i, value in enumerate(values):
            target = rn((current[i-1] if i else 0.0)+value, precision)
            residual.append(rn(current[i]-target if literal_sign else target-current[i], precision))
        if all(value == 0 for value in residual):
            assert current == truth
            return dict(status='correct', corrections=corrections, initially_wrong=initially_wrong)
        if corrections == cap:
            break
        delta = scan(residual, precision)
        current = [rn(x+d, precision) for x, d in zip(current, delta)]
        if not all(math.isfinite(x) for x in current):
            return dict(status='nonfinite', corrections=corrections+1, initially_wrong=initially_wrong)
    return dict(status='capped', corrections=cap, initially_wrong=initially_wrong)


def main():
    rng = random.Random(20072026)
    cases = []
    for p in (24,53):
        R = 1 << p
        for k in (1,2,8,32,128):
            thresholds = sorted(8+4*i for i in rng.sample(range(R//4-2), k))
            block = []
            for j, t in enumerate(thresholds):
                r = R+(1 if j%2 == 0 else 4)-t
                block.extend((float(r),float(-r)))
            for x in (thresholds[0], thresholds[-1], R-4):
                values = [float(x), *block]
                values += [0.] * ((1 << (len(values)-1).bit_length())-len(values))
                expected = x-(bisect_right(thresholds,x)%2)
                assert ordered(values,p)[-1] == expected
                result = optimistic(values,p)
                literal = optimistic(values,p,True,cap=64)
                cases.append(dict(p=p,k=k,initial=x,length=len(values),expected=expected,
                                  block_zero_summary_result=x,corrected_residual=result,literal_printed_sign=literal))
    result = dict(seed=20072026, scope='arithmetic reference only; no parallel runtime or original FPGA reproduction',
                  source='https://nachiket.github.io/publications/fp-accum_arith-2007.pdf',
                  convention='delta_i=RN(RN(prefix[i-1]+input[i])-prefix[i]); prefix+=scan(delta)',
                  cases=cases,
                  corrected_status=dict(Counter(c['corrected_residual']['status'] for c in cases)),
                  literal_status=dict(Counter(c['literal_printed_sign']['status'] for c in cases)))
    print(json.dumps(result,indent=2))


if __name__ == '__main__':
    main()
