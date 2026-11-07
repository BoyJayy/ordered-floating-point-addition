"""Bounded FP32 hardware fixtures from the independently proved parity rule."""

from bisect import bisect_right
import json
from pathlib import Path
import random
import struct


def main():
    rng = random.Random(7112026)
    R = 1 << 24
    N = R // 4 - 2
    data, queries, descriptions = [], [], []
    for n in (0, 1, 2, 8, 32, 128):
        for trial in range(4):
            thresholds = sorted(8 + 4 * i for i in rng.sample(range(N), n))
            offset = len(data)
            for i, t in enumerate(thresholds):
                r = R + (1 if i % 2 == 0 else 4) - t
                data.extend((r, -r))
            # Every block has 256 elements, even the empty threshold set.
            data.extend([0] * (256 - 2 * n))
            markers = [8, R-4, *thresholds]
            markers += [t-4 for t in thresholds if t>8]
            markers += [8 + 4*rng.randrange(N) for _ in range(256)]
            for x in markers:
                expected = x - (bisect_right(thresholds, x) % 2)
                queries.append((offset, 256, x, expected))
            descriptions.append(dict(n=n, trial=trial, thresholds=thresholds, offset=offset))
    raw = Path(__file__).resolve().parents[1] / "results/raw"
    with (raw / "metal_inputs.bin").open("wb") as f:
        f.write(struct.pack("<II", len(data), len(queries)))
        f.write(struct.pack(f"<{len(data)}f", *data))
        for query in queries:
            f.write(struct.pack("<IIff", *query))
    (raw / "metal_inputs.json").write_text(json.dumps(dict(seed=7112026, values=len(data),
        queries=len(queries), format="little-endian uint32 counts, float32 values, then uint32 offset/length,float32 x/expected",
        blocks=descriptions), indent=2) + "\n")


if __name__ == "__main__":
    main()
