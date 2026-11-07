"""Validate the saved research package, without repeating hardware experiments."""
import ast
import argparse
import hashlib
import json
from math import comb,factorial
from pathlib import Path
import re
import struct
import zipfile


ROOT=Path(__file__).resolve().parents[1]


def check_extensions():
    """Check retained statuses and code bindings; do not relabel them as new runs."""
    ext=ROOT/'extensions/strengthening_2026_11_07'
    reports=['staircase_results.json','full_native_results.json',
             'independent_math/results.json','independent_math/uniform_piece_results.json',
             'independent_math/parent_crosscheck_results.json','independent_math/full_format_results.json',
             'prior_art/independent_section_checks.json','prior_art/independent_full_format_checks.json']
    for name in reports:
        data=json.loads((ext/name).read_text())
        assert data['status']=='PASS',name
    native=json.loads((ext/'full_native_results.json').read_text())
    assert native['reference_sha256']==hashlib.sha256((ext/'independent_math/full_format_reference.py').read_bytes()).hexdigest()
    for row in native['formats']:
        assert row['output_mismatches']==0 and row['subnormal_preservation_checked']
        with zipfile.ZipFile(ext/row['sample_file']) as archive:
            for field,expected in [('input_bits',row['sampled_queries']),('output_bits',row['sampled_queries']),('operand_bits',row['operands'])]:
                raw=archive.read(field+'.npy')
                assert raw[:6]==b'\x93NUMPY'
                version=tuple(raw[6:8]);size=2 if version==(1,0) else 4
                length=int.from_bytes(raw[8:8+size],'little');assert length<65536
                header=ast.literal_eval(raw[8+size:8+size+length].decode('latin1'))
                assert header['shape']==(expected,), (row['format'],field)
                assert len(raw)-8-size-length==expected*int(header['descr'][-1])
    queries=sum(x['sampled_queries'] for x in native['formats'])
    additions=sum(x['numpy_additions'] for x in native['formats'])
    assert queries==23056 and additions==184448
    return dict(retained_reports=len(reports),native_cpu_queries=queries,
                native_cpu_additions=additions,native_bit_array_shapes_checked=True,
                scope='retained results and code hash, no new arithmetic or GPU execution')


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--public-bundle', action='store_true', help='Compatibility option; all checks apply to this public bundle.')
    parser.parse_args()
    for path in ROOT.rglob('*.py'):
        ast.parse(path.read_text(), filename=str(path))
    for path in ROOT.rglob('*.json'):
        json.loads(path.read_text())
    cpu_queries=0
    for name in ('native_fold','native_factorial'):
        for line in (ROOT/f'results/raw/{name}.jsonl').read_text().splitlines():
            record=json.loads(line)
            assert record.get('failures',record.get('mismatches'))==0
            cpu_queries+=record['queries']
    gpu_queries=0
    for fixture,result,outputs in [('metal_inputs','metal_fold','metal_outputs'),
                                    ('factorial_inputs','metal_factorial','factorial_outputs')]:
        data=(ROOT/f'results/raw/{fixture}.bin').read_bytes()
        nv,nq=struct.unpack_from('<II',data)
        assert len(data)==8+4*nv+16*nq
        raw=(ROOT/f'results/raw/{outputs}.bin').read_bytes()
        assert len(raw)==4*nq
        records=struct.unpack(f'<{nq}I',raw)
        for i,actual in enumerate(records):
            offset,length,x,expected=struct.unpack_from('<IIff',data,8+4*nv+16*i)
            assert offset+length<=nv
            expected_bits=struct.unpack('<I',struct.pack('<f',expected))[0]
            assert actual==expected_bits,(fixture,i)
        report=json.loads((ROOT/f'results/raw/{result}.json').read_text())
        assert report['queries']==nq and report['mismatches']==0
        gpu_queries+=nq
    obligations=0
    for name,count in [('gadget_proofs',4),('gap_proofs',192)]:
        report=json.loads((ROOT/f'results/raw/{name}.json').read_text())
        assert len(report['lemmas'])==count
        assert all(r['status']=='unsat' for r in report['lemmas'])
        obligations+=count
    corridor=json.loads((ROOT/'results/raw/corridor_summary.json').read_text())
    assert corridor['status']=='PASS' and corridor['saved_gpu_comparisons']==20153
    for row in corridor['large_domains']:
        assert len((ROOT/f'results/raw/corridor_fp{row["p"]}_summary.bin').read_bytes())==row['serialized_bytes']
        assert row['serialized_bytes']==(row['fixed_budget_bits']+7)//8
    constants={str(p):(comb((1<<(p-2))-2,128)-1).bit_length() for p in (11,24,53)}
    assert constants=={'11':410,'24':2100,'53':5812}
    assert (factorial(64)-1).bit_length()==296
    assert cpu_queries==120925 and gpu_queries==27713
    optimistic=json.loads((ROOT/'results/raw/optimistic_reference.json').read_text())
    assert optimistic['corrected_status']=={'correct':30}
    extension_checks=check_extensions()
    report=dict(status='PASS', extension_checks=extension_checks,
                cpu_queries=cpu_queries, actual_gpu_queries=gpu_queries,
                local_smt_unsat=obligations, bounds_m256_bits=constants,
                fixed_multiset_m256_bits=296,
                scope='saved records, syntax, arithmetic constants and raw-output agreement; hardware not rerun')
    print(json.dumps(report,indent=2))


if __name__=='__main__':
    main()
