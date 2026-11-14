ORDERED FLOATING-POINT ADDITION
Reproducibility artifact, version 1.1.0
Artem D. Popkov | ORCID 0009-0005-8977-0400
Version DOI: https://doi.org/10.5281/zenodo.24231263
All versions: https://doi.org/10.5281/zenodo.24044236

Code and data accompanying "Information bounds and exact indices for
ordered floating-point addition".

Start here (Python 3.10+, standard library):
    python3 -B verify_release.py
    python3 -B run_quick_checks.py
    python3 -B run_extension_checks.py

The first command verifies file hashes and licenses. The second checks saved
records and runs bounded exact-arithmetic tests in a temporary copy.
The third command checks the corrected radix constructor, binary record
closure, and query cache against separately written exact models.
These commands do not run a GPU experiment or modify the released files.

Contents
    research/          Implementations, checks, fixtures and retained results.
    REPRODUCE.txt      Commands and requirements for the remaining checks.
    EVIDENCE_MAP.json  Article tables and sections mapped to code and records.
    checks.json        Release validation, with hardware scope recorded explicitly.
    CHANGES.txt        Additions, corrections and the scope of version 1.1.0.
    validation/       Earlier release checks and current rerun records.
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

The extension to other integer radices is a specialized construction using
known rounding and floor-function facts. It is not presented as a separate
major discovery. Full-text comparison with two close inverse-addition papers
remains open. See CHANGES.txt and the paper for exact scope and attribution.

Some retained numerical reports contain hashes of historical manuscript drafts;
those drafts are not dependencies of this release. Numerical inputs, outputs,
counts and historical result files are preserved. The article is distributed
separately; this archive contains no manuscript copies or third-party sources.
Absolute paths in original source-hash fields identify the historical local
run. They are provenance, not runtime dependencies. File integrity in this
relocated package is checked through SHA256SUMS.
