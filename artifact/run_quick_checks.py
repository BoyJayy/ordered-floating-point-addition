"""Bounded exact-model checks in a temporary copy. Python 3.10+, no extra packages.

No GPU or native floating-point benchmark is run. Original records are unchanged.
"""
from pathlib import Path
import json
import platform
import shutil
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parent

def main():
    if sys.version_info < (3, 10):
        raise SystemExit('Python 3.10 or newer is required.')
    tasks = [
        ('saved_records', '.', ['experiments/verify_artifact.py', '--public-bundle']),
        ('boundary_counterexamples', '.', ['adversarial/root/boundary_attacks.py']),
        ('thresholds_p4_p5_p6', 'independent', ['-c', "import json; from check_fp_markers import exhaust, check_group_index; print(json.dumps({'exhaustive':[exhaust(p) for p in (4,5,6)], 'group_index':[check_group_index(p) for p in (4,5,6)]}))"]),
        ('k_dependence', '.', ['extensions/multibinade_2026_11_07/independent_review/check_K_dependence.py']),
        ('full_format_microcases', 'extensions/strengthening_2026_11_07/independent_math', ['-c', "import json; from check_full_format import local_checks, exhaustive_checks, fixtures; print(json.dumps({'local':local_checks(), 'exhaustive':exhaustive_checks(), 'fixtures':fixtures()}))"]),
    ]
    results = []
    with tempfile.TemporaryDirectory(prefix='ordered_fp_quick_') as temporary:
        work = Path(temporary)/'research'
        shutil.copytree(ROOT/'research', work)
        for name, cwd, args in tasks:
            start = time.monotonic()
            command = [sys.executable, '-B'] + args
            run = subprocess.run(command, cwd=work/cwd, capture_output=True, text=True, timeout=180)
            if run.returncode:
                raise RuntimeError(f'{name}: exit {run.returncode}\n{run.stderr}\n{run.stdout}')
            result = json.loads(run.stdout)
            if isinstance(result, dict) and 'status' in result:
                assert result['status'] == 'PASS' or result['status'].startswith('PASS:'), (name, result['status'])
            results.append(dict(check=name, cwd='research/'+cwd,
                                command=['python3', '-B']+args, result=result,
                                elapsed_seconds=round(time.monotonic()-start, 3)))
    print(json.dumps(dict(status='PASS', python=sys.version, platform=platform.platform(),
                          scope='retained-record verification plus bounded exact arithmetic models; no new GPU, native CPU or timing benchmark',
                          original_files_modified=False, checks=results), indent=2))

if __name__ == '__main__':
    main()
