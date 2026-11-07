"""Verify the frozen artifact without writes or third-party dependencies."""
from pathlib import Path
import csv
import hashlib
import json

ROOT = Path(__file__).resolve().parent

def main():
    entries = {}
    for line in (ROOT/'SHA256SUMS').read_text().splitlines():
        digest, name = line.split('  ', 1)
        assert not Path(name).is_absolute() and '..' not in Path(name).parts
        assert name not in entries, name
        path = ROOT/name
        assert path.is_file() and not path.is_symlink(), name
        assert hashlib.sha256(path.read_bytes()).hexdigest() == digest, name
        entries[name] = digest
    actual = {str(p.relative_to(ROOT)) for p in ROOT.rglob('*') if p.is_file()
              and p.name not in {'SHA256SUMS', '.DS_Store'} and '__pycache__' not in p.parts}
    assert actual == set(entries), ('unlisted or missing files', actual ^ set(entries))
    with (ROOT/'FILE_LICENSES.csv').open(newline='') as stream:
        licensing = {row['path']:row['license'] for row in csv.DictReader(stream)}
    assert set(licensing) == actual | {'SHA256SUMS'}, 'incomplete license mapping'
    checks = json.loads((ROOT/'checks.json').read_text())
    assert checks['status'] == 'PASS'
    print(json.dumps({'status':'PASS', 'hashed_files':len(entries),
                      'license_map_complete':True,
                      'scope':'file integrity and retained status only; use run_quick_checks.py for bounded fresh exact-model checks'}, indent=2))

if __name__ == '__main__':
    main()
