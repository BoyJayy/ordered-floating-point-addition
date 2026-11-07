"""Independent formula generator for real FP32 GPU permutation witnesses."""
from bisect import bisect_right
import json
from pathlib import Path
import random
import struct


def main():
    rng = random.Random(711202607)
    R = 1 << 24
    values, queries, blocks = [], [], []
    for k in (1,2,4,8,32,64,128):
        reference = None
        for trial in range(8):
            permutation = list(range(k))
            if trial:
                rng.shuffle(permutation)
            thresholds, block = [], []
            for j, i in enumerate(permutation):
                s = R//16 + 4*i
                t = 13*R//16 + 4*k*(j+1)
                r = R + (1 if j%2 == 0 else 4) - t
                thresholds.append(t-s)
                block.extend((s,r,-r,-s))
            assert thresholds == sorted(thresholds)
            multiset = sorted(block)
            if reference is None:
                reference = multiset
            assert multiset == reference and sum(block) == 0
            offset = len(values)
            values.extend(block + [0]*(512-len(block)))
            markers = [3*R//4+4, 3*R//4+4*k*k, *thresholds]
            markers += [t-4 for t in thresholds if t>3*R//4+4]
            markers += [t+4 for t in thresholds if t<3*R//4+4*k*k]
            markers += [3*R//4+4*rng.randrange(1,k*k+1) for _ in range(256)]
            for x in markers:
                queries.append((offset,512,x,x-(bisect_right(thresholds,x)%2)))
            blocks.append(dict(k=k,trial=trial,offset=offset,permutation=permutation,thresholds=thresholds))
    raw = Path(__file__).resolve().parents[1]/"results/raw"
    with (raw/"factorial_inputs.bin").open("wb") as f:
        f.write(struct.pack("<II",len(values),len(queries)))
        f.write(struct.pack(f"<{len(values)}f",*values))
        for q in queries:
            f.write(struct.pack("<IIff",*q))
    (raw/"factorial_inputs.json").write_text(json.dumps(dict(seed=711202607,values=len(values),queries=len(queries),blocks=blocks),indent=2)+"\n")


if __name__ == "__main__":
    main()
