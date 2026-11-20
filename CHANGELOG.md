# Changes

## 1.2 — 20 November 2026

- Clarified the proof of Corollary 9.2 for finite real targets. Added a
  binary32 example giving both ranks of the preimage of 1 under rounded
  addition of 1, with a standalone C++20 reproduction.
- Corrected strict inverse queries and the upper cut of interval preimages
  in the binary implementation for targets off the doubled integer grid.
  Added rational-target regression checks to artifact 1.2.0.
- Compared the single-addition results of Gallois-Wong, Boldo and Cuoq and
  Chapter 4 of Nazecic-Andrlon's 2023 thesis with queries on a stored block
  index. Direct comparison with the original ARITH 2019 text remains open.

## 1.1 — 15 November 2026

- Added operand-free composition of whole-format transfer indices, inverse
  queries, and a balanced constructor.
- Extended the index construction to integer radices, with explicit affine
  records and the required validity, height-range and preparation conditions.
- Corrected the all-radix singleton implementation to avoid repeated region
  searches. The earlier code and its numerical evidence remain available.
- Added separately written exact-model and sampled CPU checks, plus a bounded
  Python implementation pilot with setup and memory costs.
- Expanded prior-work attribution and distinguished standard algebraic tools
  from the specialized index construction. Two close full-text comparisons
  remained open at the time.

The binary information lower bounds retain their original assumptions.
These additions do not establish native FP or GPU speedups, external peer
review, or definitive worldwide priority.

## 1.0 — 8 November 2026

Initial public preprint and reproducibility artifact: information lower bounds,
corridor description bounds, exact evaluation indices, counterexamples, and
retained arithmetic checks.
