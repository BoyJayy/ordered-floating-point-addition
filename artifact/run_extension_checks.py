"""Run continuation checks in a temporary copy; preserve archived evidence."""
import argparse
import json
from pathlib import Path
import platform
import shutil
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parent
CONT = 'research_continuation_2026_11_14'


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--full', action='store_true', help='also rerun the original full merge/radix suites')
    parser.add_argument('--native-cpu', action='store_true', help='also perform sampled binary32/binary64 CPU comparisons')
    args = parser.parse_args()
    if sys.version_info < (3, 10):
        raise SystemExit('Python 3.10 or newer is required.')
    tasks = [
        ('corrected_radix_audit', 'radix_hard_audit/math/check_adversarial.py'),
        ('synthetic_binary_records', 'review/check_record_closure.py'),
        ('query_cache_oracle', 'performance/verify_independent.py'),
    ]
    if args.full:
        tasks += [('whole_format_merge', 'math/check_merge.py'),
                  ('initial_radix_numerical_checks', 'next_theorem/check_radix.py')]
    if args.native_cpu:
        tasks += [('native_cpu_comparison', 'review/check_native_cpu.py')]
    results = []
    with tempfile.TemporaryDirectory(prefix='ordered_fp_extensions_') as temporary:
        work = Path(temporary) / 'research'
        shutil.copytree(ROOT / 'research', work)
        for name, script in tasks:
            start = time.monotonic()
            cmd = [sys.executable, '-B', script]
            run = subprocess.run(cmd, cwd=work / CONT, capture_output=True, text=True, timeout=600)
            if run.returncode:
                raise RuntimeError(f'{name}: exit {run.returncode}\n{run.stderr}\n{run.stdout}')
            # Some retained scripts print stage progress before the JSON object.
            result = json.loads(run.stdout[run.stdout.index('{'):])
            assert result['status'] in {'PASS', 'PASS_WITH_QUALIFICATIONS'}, (name, result['status'])
            results.append({'check': name, 'command': ['python3', '-B', script],
                            'cwd': 'research/' + CONT, 'result': result,
                            'elapsed_seconds': round(time.monotonic()-start, 3)})
    print(json.dumps({'status': 'PASS', 'python': sys.version, 'platform': platform.platform(),
        'scope': 'finite exact-model checks; optional sampled CPU arithmetic; no GPU or performance benchmark',
        'native_cpu_executed': args.native_cpu, 'full_initial_suites_executed': args.full,
        'original_files_modified': False, 'checks': results}, indent=2))


if __name__ == '__main__':
    main()
