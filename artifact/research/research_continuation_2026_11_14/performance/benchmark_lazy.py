#!/usr/bin/env python3
"""Paired construction timings plus separate allocation test for lazy schedule."""
import cProfile
import hashlib
import json
from pathlib import Path
import pstats
import random
import sys
import tracemalloc

HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE.parent/'math'))
from merge_indices import balanced
from benchmark import timed, distribution, environment, write_json, replay, deep_size
from verify_independent import format_values, oracle
from lazy_build import lazy_balanced


def correctness():
    rng=random.Random(2026111452)
    comparisons=blocks=0
    for p,e in [(2,1),(3,3),(5,4)]:
        values,extended=format_values(p,e)
        for m in [0,1,2,3,5,6,7,8,17,31,32,33]:
            for repeat in range(3):
                operands=[rng.choice(values) for _ in range(m)]
                index=lazy_balanced(p,e,iter(operands))
                original=balanced(p,e,operands)
                assert index.descriptor()==original.descriptor(),(p,e,m)
                for x in values:
                    expected=x
                    for operand in operands:
                        if expected in ('-inf','+inf'):break
                        expected=oracle(expected+operand,extended)
                    assert index.evaluate(x)==expected,(p,e,operands,x)
                    comparisons+=1
                blocks+=1
    result=dict(status='PASS',seed=2026111452,blocks=blocks,comparisons=comparisons,
                lengths=[0,1,2,3,5,6,7,8,17,31,32,33],
                descriptor_identity=True,one_pass_iterator_inputs=True,
                oracle='independent representable-neighbor oracle')
    write_json(HERE/'lazy_correctness.json',result)
    return result


def main():
    print(correctness(),flush=True)
    inputs=json.loads((HERE/'inputs.json').read_text())
    before=environment()
    results=[]
    for case in inputs:
        p,e,a=case['p'],case['E'],case['operands']
        old=balanced(p,e,a)
        new=lazy_balanced(p,e,a)
        assert old.descriptor()==new.descriptor()
        assert all(new.evaluate(x)==replay(new.fmt,a,x) for x in case['queries'])
        samples={'materialized':[],'lazy':[]}
        functions={'materialized':lambda:balanced(p,e,a),'lazy':lambda:lazy_balanced(p,e,a)}
        rng=random.Random(case['seed']+20000)
        for repeat in range(5):
            names=list(functions);rng.shuffle(names)
            for name in names:
                elapsed,result=timed(functions[name])
                samples[name].append(elapsed)
                del result
        row=dict(id=case['id'],p=p,E=e,m=case['m'],kind=case['kind'],
                 construction={k:distribution(v) for k,v in samples.items()},
                 pieces=len(new.pieces),retained_python_bytes=deep_size(new),
                 descriptor_matches_materialized=True,correctness='PASS')
        results.append(row)
        write_json(HERE/'lazy_timings.json',dict(status='RUNNING',results=results,environment_before=before))
        print(case['id'],'materialized/lazy ms',*[round(row['construction'][name]['median_ns']/1e6,3)
                                                  for name in ['materialized','lazy']],flush=True)
    write_json(HERE/'lazy_timings.json',dict(status='COMPLETE',results=results,
               environment_before=before,environment_after=environment()))
    print('TIMING WINDOW CLOSED',flush=True)
    allocations=[]
    for case in inputs:
        row={'id':case['id']}
        for name,constructor in [('materialized',balanced),('lazy',lazy_balanced)]:
            tracemalloc.start()
            result=constructor(case['p'],case['E'],case['operands'])
            current,peak=tracemalloc.get_traced_memory()
            tracemalloc.stop()
            row[name]=dict(current_traced_bytes=current,peak_traced_bytes=peak)
            del result
        allocations.append(row)
        write_json(HERE/'lazy_allocations.json',allocations)
    case=next(c for c in inputs if c['p']==24 and c['m']==128)
    for name,constructor in [('materialized',balanced),('lazy',lazy_balanced)]:
        profiler=cProfile.Profile()
        profiler.runcall(constructor,case['p'],case['E'],case['operands'])
        profiler.dump_stats(str(HERE/f'build_{name}_paired.prof'))
        with (HERE/f'build_{name}_paired.profile.txt').open('w') as handle:
            pstats.Stats(profiler,stream=handle).strip_dirs().sort_stats('cumulative').print_stats(24)
    write_json(HERE/'lazy_source_hashes.json',{str(p):hashlib.sha256(p.read_bytes()).hexdigest()
               for p in [Path(__file__),HERE/'lazy_build.py',HERE.parent/'math/merge_indices.py']})
    print('Paired allocation and profile passes complete.',flush=True)


if __name__=='__main__':main()
