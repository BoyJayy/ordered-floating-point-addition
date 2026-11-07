"""Check the reference implementation against an independent rational oracle."""
from fractions import Fraction as F
from pathlib import Path
from random import Random
import json
import sys

sys.path.insert(0,str(Path(__file__).resolve().parents[2]/'experiments'))
from corridor_summary import SparseTransfer, fixed_budget
from independent_audit import FiniteFormat


def main():
    rng = Random(89623471)
    cases = query_checks = serialization_checks = 0
    modes = set()
    for p in range(4,11):
        R = 2**p
        oracle = FiniteFormat(p,-5,p+1)
        for trial in range(12):
            count = rng.randrange(1,min(13,R//8+1))
            start = rng.randrange(R//8,(R-4*(count-1))//4)*4
            actual = SparseTransfer(p,start,count)
            expected = tuple(start+4*i for i in range(count))
            for step in range(1,41):
                low, high = int(4*(R//2-expected[0])), int(4*(2*R-expected[-1])-5)
                a = F(rng.randrange(low,high+1),4)
                expected = tuple(oracle.round(x+a) for x in expected)
                assert all(isinstance(x,F) and R//2 <= x < 2*R for x in expected)
                actual.push(a)
                assert tuple(actual.query(i) for i in range(count)) == expected
                assert sum(abs(v) for v in actual.deviations.values()) <= 4*step
                query_checks += count
                data = actual.serialize()
                mode,bits = fixed_budget(p,count,step)
                modes.add(mode)
                assert len(data)*8 == 8*((bits+7)//8)
                decoded = SparseTransfer.deserialize(p,start,count,step,data)
                assert tuple(decoded.query(i) for i in range(count)) == expected
                serialization_checks += 1
            # Appending positive zeros leaves every promised positive state fixed.
            # Set the known padded length without wasting a million identity steps.
            actual.steps = 1_000_000
            mode,_ = fixed_budget(p,count,actual.steps)
            modes.add(mode)
            data = actual.serialize()
            decoded = SparseTransfer.deserialize(p,start,count,actual.steps,data)
            assert tuple(decoded.query(i) for i in range(count)) == expected
            serialization_checks += 1
            cases += 1
    print(json.dumps({'seed':89623471,'blocks':cases,'query_checks':query_checks,
                      'serialization_round_trips':serialization_checks,
                      'modes_tested':sorted(modes),
                      'note':'Quarter-valued addends also test the broader rational interface accepted by the reference.'},indent=2))


if __name__ == '__main__':
    main()
