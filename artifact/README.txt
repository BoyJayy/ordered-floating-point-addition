ORDERED FLOATING-POINT ADDITION
Reproducibility artifact, version 1.2.0
Artem D. Popkov | ORCID 0009-0005-8977-0400
Artifact, all versions: https://doi.org/10.5281/zenodo.24044236
Article, all versions: https://doi.org/10.5281/zenodo.24045376

Code and data accompanying "Information bounds and exact indices for
ordered floating-point addition".

Start here (Python 3.10+, standard library):
    python3 -B verify_release.py
    python3 -B run_quick_checks.py
    python3 -B run_extension_checks.py

The first command verifies file hashes and licenses. The second checks saved
records and runs bounded exact-arithmetic tests in a temporary copy,
including inverse queries with exact rational targets.
The third command checks the corrected radix constructor, binary record
closure, and query cache against separately written exact models.
These commands do not run a GPU experiment or modify the released files.

The C++ example for Corollary 9.2 finds both ends of the binary32 input
interval whose outputs round to 1 after adding 1. See REPRODUCE.txt for
the build command and the expected ranks.

Contents
    research/          Implementations, checks, fixtures and retained results.
    REPRODUCE.txt      Commands and requirements for the remaining checks.
    EVIDENCE_MAP.json  Article tables and sections mapped to code and records.
    checks.json        Release validation, with hardware scope recorded explicitly.
    CHANGES.txt        Version history and corrections.
    validation/        Earlier release checks and current rerun records.
    CITATION.cff       Citation metadata.
    LICENSES/          MIT (code), CC BY 4.0 (documentation and data).
    FILE_LICENSES.csv  File-by-file license map.
    SHA256SUMS         File hashes.

Evidence scope
Retained GPU records contain 27,713 binary32 correctness queries. Binary16
hardware checks belong to the CPU experiments. Tests of exact software models
are identified separately from measured hardware results. Finite tests do not
replace the article's proofs. No throughput improvement is claimed.

The continuation includes a bounded Python performance pilot. It measures
arbitrary-precision software models, not native floating-point throughput.
The cost of preparing an index is substantial; the reported crossover is
an estimate from timing samples, not an end-to-end application measurement.

Gallois-Wong, Boldo and Cuoq give inverse projections for a single binary
addition. Nazecic-Andrlon's 2023 thesis treats the corresponding problem in
arbitrary radix. The article discusses both results in relation to reusable
indices for a whole block. CHANGES.txt identifies the primary sources.

Some retained numerical reports contain hashes of historical manuscript drafts;
those drafts are not dependencies of this release. Numerical inputs, outputs,
counts and historical result files are preserved. The article is distributed
separately; this archive contains no manuscript copies or third-party sources.
Absolute paths in original source-hash fields identify the historical local
run. They are provenance, not runtime dependencies. File integrity in this
relocated package is checked through SHA256SUMS.
