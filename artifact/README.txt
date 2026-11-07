ORDERED FLOATING-POINT ADDITION
Reproducibility artifact, version 1.0.0
Artem D. Popkov | ORCID 0009-0005-8977-0400
Version DOI: https://doi.org/10.5281/zenodo.24044237

Code and data accompanying "Information bounds and exact indices for
ordered floating-point addition".

Start here (Python 3.10+, standard library):
    python3 -B verify_release.py
    python3 -B run_quick_checks.py

The first command verifies file hashes and licenses. The second checks saved
records and runs bounded exact-arithmetic tests in a temporary copy.
Neither command runs a GPU experiment or modifies the released files.

Contents
    research/          Implementations, checks, fixtures and retained results.
    REPRODUCE.txt      Commands and requirements for the remaining checks.
    EVIDENCE_MAP.json  Article tables and sections mapped to code and records.
    checks.json        Validation of this release, without hardware reruns.
    CITATION.cff       Citation metadata.
    LICENSES/          MIT (code), CC BY 4.0 (documentation and data).
    FILE_LICENSES.csv  File-by-file license map.
    SHA256SUMS         File hashes.

Evidence scope
Retained GPU records contain 27,713 binary32 correctness queries. Binary16
hardware checks belong to the CPU experiments. Tests of exact software models
are identified separately from measured hardware results. Finite tests do not
replace the article's proofs. No throughput improvement is claimed.

Some retained numerical reports contain hashes of historical manuscript drafts;
those drafts are not dependencies of this release. Numerical inputs, outputs,
counts and historical result files are preserved. The article is distributed
separately; this archive contains no manuscript copies or third-party sources.
