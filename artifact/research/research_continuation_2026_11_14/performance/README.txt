PYTHON IMPLEMENTATION PILOT

Scope
Ten deterministic synthetic workloads compare scalar replay, sequential
index construction, balanced construction, and a numeric query cache.
The code uses arbitrary-precision integers in least-subnormal units on one
CPU thread. It does not measure native binary32/binary64 throughput or GPU
performance. The format, operand order and rounding semantics are shared
by all methods. Scalar replay stops at absorbing overflow.

The cache stores numeric piece origins and descriptors, not operands.
Lazy construction preserves the same balanced merge tree and final records
while constructing leaves on demand. Some cases have faster repeated
queries, but setup costs are substantial and small workloads can lose.
Estimated break-even query counts are derived from timing medians; they
were not validated by timing complete runs at those query counts.

Retained data
- inputs.json and query_outputs.json: exact workload inputs and outcomes.
- timings.json: construction and query samples, calibration and estimates.
- allocations.json: separate tracemalloc passes for the original schedules.
- lazy_timings.json and lazy_allocations.json: paired schedule comparisons.
- tree_inventory.json: schedule/record inventory, without performance timing.
- REPORT.json: derived tables and limitations used by the paper.
- environment_before.json, environment_after.json, hardware.json: run context.
- *.profile.txt: separate cProfile summaries; not throughput measurements.
- *correctness.json: retained finite checks and oracle comparisons.

The recorded host is an Apple M5 Pro with 48 GiB unified memory, Python
3.15.1. There are five construction samples and seven query samples per
workload. Samples are not independent process repetitions or confidence
intervals. CPU affinity and frequency were not locked; thermal stabilization
was not established. Tracemalloc peaks are Python allocation measurements,
not process RSS or encoded description sizes.

Reproduction
Use a separate working copy: scripts write result files beside their source.
Python 3.10 or newer and the standard library are required. From the
research/research_continuation_2026_11_14/ directory:

    python3 -B performance/verify_independent.py
    python3 -B performance/benchmark.py --phase profile
    python3 -B performance/benchmark.py --phase measure
    python3 -B performance/benchmark_lazy.py
    python3 -B performance/trace_schedules.py

The measurement command performs its allocation pass after timing finishes.
The lazy benchmark likewise separates paired timing, allocation and profiling.
Do not run other heavy jobs during a performance rerun. Keep new samples
separate from this archive. Rerunning on another Python version or machine
does not reproduce the original timing environment.

The paper's table is supported by retained raw samples and REPORT.json.
Correctness checks support only the tested cases and do not replace proofs.
