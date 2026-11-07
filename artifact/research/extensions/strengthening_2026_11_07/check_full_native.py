"""Sample all-format evaluators against actual NumPy CPU additions.

No GPU execution, no timing comparison. Each operand is rounded separately
by a dtype-preserving NumPy add. Signed zeros are compared numerically.
"""
from pathlib import Path
import hashlib
import importlib.util
import json
import platform
import random
import sys
import numpy as np

root = Path(__file__).resolve().parent
source = root / 'independent_math/full_format_reference.py'
spec = importlib.util.spec_from_file_location('full_format_native_target', source)
mod = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = mod
spec.loader.exec_module(mod)


def run(p, exponent_bits):
    e = (1 << exponent_bits)-2
    width = p+exponent_bits
    unsigned, floating = (np.uint32, np.float32) if width == 32 else (np.uint64, np.float64)
    bias = (1 << (exponent_bits-1))-1
    unit_exponent = 1-bias-(p-1)
    one = 1 << -unit_exponent
    summary = mod.FullFormatSummary(p, e)
    operands = [1, one, -one, one << p, one, -(one << p),
                summary.fmt.maximum, -summary.fmt.maximum]
    for i, operand in enumerate(operands):
        summary.append(operand)
        print(f'p={p} E={e} prefix={i+1}: {len(summary.pieces)} records', flush=True)

    def bits(value):
        sign = (1 << (width-1)) if value < 0 else 0
        absolute = abs(value)
        if absolute < 1 << (p-1):
            return sign | absolute
        shift = max(0, absolute.bit_length()-p)
        assert absolute % (1 << shift) == 0
        significand = absolute >> shift
        return sign | ((shift+1) << (p-1)) | (significand-(1 << (p-1)))

    def value(bit_pattern):
        b = int(bit_pattern)
        sign = -1 if b >> (width-1) else 1
        exponent = (b >> (p-1)) & ((1 << exponent_bits)-1)
        fraction = b & ((1 << (p-1))-1)
        if exponent == (1 << exponent_bits)-1:
            assert fraction == 0, 'unexpected NaN'
            return mod.NEG_INF if sign < 0 else mod.POS_INF
        if not exponent:
            return sign*fraction
        return sign*((1 << (p-1))+fraction)*(1 << (exponent-1))

    rng = random.Random(2026110770+p)
    indices = {0, summary.fmt.length-1, summary.fmt.index_of(0),
               summary.fmt.index_of(1), summary.fmt.index_of(-1)}
    indices.update(rng.randrange(summary.fmt.length) for _ in range(4096))
    for piece in summary.pieces:
        for i in (piece.start-1, piece.start, piece.stop-1, piece.stop):
            if 0 <= i < summary.fmt.length:
                indices.add(i)
    indices = sorted(indices)
    inputs = np.array([bits(summary.fmt.value_at(i)) for i in indices], dtype=unsigned)
    outputs = inputs.view(floating).copy()
    tiny = np.array([1], dtype=unsigned).view(floating)[0]
    assert np.add(tiny, floating(0), dtype=floating).view(unsigned) == 1
    with np.errstate(over='ignore', under='ignore', invalid='raise'):
        for operand in operands:
            a = np.array([bits(operand)], dtype=unsigned).view(floating)[0]
            outputs = np.add(outputs, a, dtype=floating)
    output_bits = outputs.view(unsigned)
    expected = [value(b) for b in output_bits]
    actual = [summary.evaluate_index(i) for i in indices]
    assert expected == actual, (p, next((i,a,b) for i,a,b in zip(indices,actual,expected) if a != b))
    label = f'binary{width}'
    np.savez_compressed(root/f'native_{label}_samples.npz',
                        input_bits=inputs, output_bits=output_bits,
                        operand_bits=np.array([bits(a) for a in operands], dtype=unsigned))
    return dict(format=label,p=p,E=e,all_finite_inputs=summary.fmt.length,
                operands=len(operands),records=len(summary.pieces),
                sampled_queries=len(indices),output_mismatches=0,
                numpy_additions=len(indices)*len(operands),
                subnormal_preservation_checked=True,
                full_input_grid_enumerated=False,
                positive_infinity_outputs=expected.count(mod.POS_INF),
                negative_infinity_outputs=expected.count(mod.NEG_INF),
                sample_file=f'native_{label}_samples.npz')


if __name__ == '__main__':
    result=dict(scope='Actual CPU NumPy arithmetic on sampled inputs; no GPU runs or performance measurements',
                platform=platform.platform(), machine=platform.machine(),
                python=platform.python_version(),numpy=np.__version__,
                reference_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
                formats=[run(24,8),run(53,11)],status='PASS')
    (root/'full_native_results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
