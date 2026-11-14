#!/usr/bin/env python3
"""Bounded, exact-integer CPU pilot. Standard library only; no hardware FP claim.

Run from any directory: python3 -B benchmark.py --phase profile|measure
Inputs and every timing sample are retained in this directory. Profiling and
allocation tracing never run inside a timed measurement. Public-format p,E
describe arithmetic, not a native hardware representation.
"""
import argparse
import cProfile
import gc
import hashlib
import json
import math
import os
import platform
import pstats
import random
import statistics
import subprocess
import sys
import time
import tracemalloc
from datetime import datetime
from pathlib import Path
from zoneinfo import ZoneInfo

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / 'math'))
from merge_indices import (BinaryFormat, FullFormatSummary, NEG_INF, POS_INF,
                           balanced, piece_input_origins)


def sequential(p, e, operands):
    index = FullFormatSummary(p, e)
    for a in operands:
        index.append(a)
    return index


def replay(fmt, operands, x):
    """Direct left fold with early exit for absorbing overflow, local binding."""
    if x in (NEG_INF, POS_INF):
        return x
    rounder = fmt.round
    for a in operands:
        x = rounder(x + a)
        if x in (NEG_INF, POS_INF):
            break
    return x


def deep_size(obj):
    """Deduplicated Python object graph, not process RSS or encoded bit count."""
    seen = set()
    def visit(x):
        if id(x) in seen:
            return 0
        seen.add(id(x))
        size = sys.getsizeof(x)
        if isinstance(x, dict):
            size += sum(visit(k) + visit(v) for k, v in x.items())
        elif isinstance(x, (list, tuple)):
            size += sum(visit(v) for v in x)
        elif hasattr(x, '__dict__'):
            size += visit(vars(x))
        return size
    return visit(obj)


def make_case(p, e, m, kind, seed):
    rng = random.Random(seed)
    fmt = BinaryFormat(p, e)
    unit = 1 << (e // 2)
    if kind == 'small_steps':
        operands = [unit * (1, 1, -1, 1, -1, -1, 1, -1)[i % 8]
                    for i in range(m)]
    elif kind == 'cancellation':
        large = ((1 << (p-1)) + 1) * unit
        operands = [(large, -large, unit, -unit)[i % 4] for i in range(m)]
    elif kind == 'random_exponents':
        operands = [fmt.value_at(rng.randrange(fmt.length)) for _ in range(m)]
    else:
        raise ValueError(kind)
    # Half broadly distributed ranks; half normal-range values near operands.
    queries = [0, 1, -1, fmt.maximum, -fmt.maximum]
    queries += [fmt.value_at(rng.randrange(fmt.length)) for _ in range(123)]
    for _ in range(128):
        significand = rng.randrange(1 << (p-1), 1 << p)
        queries.append(rng.choice((-1, 1)) * significand * unit)
    assert all(fmt.finite(x) for x in operands + queries)
    return dict(id=f'p{p}_E{e}_m{m}_{kind}', p=p, E=e, m=m,
                kind=kind, seed=seed, operands=operands, queries=queries)


def input_cases():
    specs = [(8, 8, 1, 'small_steps'), (8, 8, 32, 'cancellation'),
             (8, 8, 128, 'random_exponents'),
             (24, 254, 1, 'small_steps'), (24, 254, 8, 'cancellation'),
             (24, 254, 32, 'small_steps'), (24, 254, 128, 'cancellation'),
             (24, 254, 32, 'random_exponents'),
             (53, 2046, 1, 'small_steps'), (53, 2046, 8, 'cancellation')]
    return [make_case(*spec, seed=2026111400+i) for i, spec in enumerate(specs)]


def write_json(path, value):
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + '\n')


def timed(fn):
    enabled = gc.isenabled()
    gc.disable()
    try:
        start = time.perf_counter_ns()
        result = fn()
        elapsed = time.perf_counter_ns() - start
    finally:
        if enabled:
            gc.enable()
    return elapsed, result


def distribution(samples):
    return dict(samples_ns=samples, min_ns=min(samples), median_ns=statistics.median(samples),
                max_ns=max(samples), relative_range=(max(samples)-min(samples))/statistics.median(samples))


def environment():
    def command(args):
        try:
            proc = subprocess.run(args, capture_output=True, text=True, timeout=10)
            return dict(command=args, returncode=proc.returncode,
                        stdout=proc.stdout.strip(), stderr=proc.stderr.strip())
        except (OSError, subprocess.TimeoutExpired) as err:
            return dict(command=args, error=str(err))
    return dict(timestamp_moscow=datetime.now(ZoneInfo('Europe/Moscow')).isoformat(),
                python=sys.version, executable=sys.executable, platform=platform.platform(),
                machine=platform.machine(), cpu_count=os.cpu_count(), loadavg=os.getloadavg(),
                cpu=command(['sysctl', '-n', 'machdep.cpu.brand_string']),
                memory=command(['sysctl', '-n', 'hw.memsize']),
                power=command(['pmset', '-g', 'batt']), thermal=command(['pmset', '-g', 'therm']),
                caveats=['No CPU affinity or frequency locking.', 'Other desktop processes remain active.',
                         'Single interpreter thread; arbitrary precision exact integers.',
                         'The timed queries all use finite representable values.',
                         'Not an IEEE hardware, C++, GPU, production, or application benchmark.'])


def verify_small(optimized=None):
    rng = random.Random(57291)
    compared = 0
    for p, e in [(2, 1), (3, 3), (5, 4)]:
        fmt = BinaryFormat(p, e)
        values = [fmt.value_at(i) for i in range(fmt.length)]
        for m in [0, 1, 2, 7, 16]:
            for repeat in range(3):
                operands = [rng.choice(values) for _ in range(m)]
                old, new = sequential(p, e, operands), balanced(p, e, operands)
                candidates = [old.evaluate, new.evaluate]
                if optimized:
                    candidates.append(optimized(new).evaluate)
                for x in values + [NEG_INF, POS_INF]:
                    expected = replay(fmt, operands, x)
                    assert all(f(x) == expected for f in candidates), (p, e, operands, x)
                    compared += len(candidates)
                if optimized:
                    fast = optimized(new)
                    for invalid in [fmt.maximum+1, fmt.maximum+3, 0.5, 'nan', None]:
                        try:
                            fast.evaluate(invalid)
                        except (ValueError, TypeError):
                            pass
                        else:
                            raise AssertionError(('accepted invalid input', invalid))
    return dict(status='PASS', formats=[[2,1],[3,3],[5,4]], comparisons=compared,
                seed=57291, methods=['sequential', 'balanced'] + (['numeric_cache'] if optimized else []))


def profile():
    case = make_case(24,254,32,'small_steps',2026111405)
    index = balanced(case['p'],case['E'],case['operands'])
    jobs = {'query_baseline': lambda: [[index.evaluate(x) for x in case['queries']] for _ in range(500)],
            'build_balanced': lambda: balanced(case['p'],case['E'],case['operands']),
            'build_sequential': lambda: sequential(case['p'],case['E'],case['operands'])}
    write_json(HERE / 'profile_correctness.json', verify_small())
    for name, job in jobs.items():
        profiler = cProfile.Profile()
        profiler.runcall(job)
        profiler.dump_stats(str(HERE / f'{name}.prof'))
        with (HERE / f'{name}.profile.txt').open('w') as handle:
            pstats.Stats(profiler, stream=handle).strip_dirs().sort_stats('cumulative').print_stats(24)
    write_json(HERE / 'profile_environment.json', environment())
    print('Profiles saved; no timing measurements mixed with profiler.')


def main_measure():
    from query_cache import NumericQueryCache
    cases = input_cases()
    write_json(HERE / 'inputs.json', cases)
    verification = verify_small(NumericQueryCache)
    before = environment()
    write_json(HERE / 'environment_before.json', before)
    write_json(HERE / 'correctness.json', verification)
    source_paths = [Path(__file__), HERE / 'query_cache.py', HERE.parent / 'math/merge_indices.py',
                    HERE.parent.parent / 'extensions/strengthening_2026_11_07/independent_math/full_format_reference.py']
    write_json(HERE / 'source_hashes.json', {str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in source_paths})
    results = []
    for number, case in enumerate(cases):
        p,e,operands,queries = case['p'],case['E'],case['operands'],case['queries']
        fmt = BinaryFormat(p,e)
        old,new = sequential(p,e,operands),balanced(p,e,operands)
        cache = NumericQueryCache(new)
        expected = [replay(fmt,operands,x) for x in queries]
        assert [old.evaluate(x) for x in queries] == expected
        assert [new.evaluate(x) for x in queries] == expected
        assert [cache.evaluate(x) for x in queries] == expected
        constructors = {'sequential':lambda:sequential(p,e,operands),
                        'balanced':lambda:balanced(p,e,operands),
                        'cache_preparation':lambda:NumericQueryCache(new)}
        build_samples = {name:[] for name in constructors}
        # The objects above serve as constructor/query warmups and correctness checks.
        rng = random.Random(case['seed']+10000)
        for repeat in range(5):
            names=list(constructors);rng.shuffle(names)
            for name in names:
                elapsed, result = timed(constructors[name])
                build_samples[name].append(elapsed)
                del result
        methods = {'replay':lambda x:replay(fmt,operands,x),
                   'sequential_index':old.evaluate, 'balanced_index':new.evaluate,
                   'numeric_cache':cache.evaluate}
        repetitions = {}
        # Calibrate each method to >=20ms where practical; retain raw calibration.
        calibration = {}
        for name, evaluate in methods.items():
            elapsed,got=timed(lambda:[evaluate(x) for x in queries])
            assert got==expected
            repetitions[name]=max(1,min(4096,math.ceil(20_000_000/max(1,elapsed))))
            calibration[name]=elapsed
        query_samples = {name:[] for name in methods}
        raw_batches = {name:[] for name in methods}
        for repeat in range(7):
            names=list(methods);rng.shuffle(names)
            for name in names:
                evaluate=methods[name];batches=repetitions[name]
                def batch():
                    for _ in range(batches):
                        outputs=[evaluate(x) for x in queries]
                    return outputs
                elapsed, got=timed(batch)
                assert got==expected
                raw_batches[name].append(elapsed)
                query_samples[name].append(elapsed/(batches*len(queries)))
        builds={name:distribution(samples) for name,samples in build_samples.items()}
        queries_result={name:dict(distribution(samples), batch_elapsed_ns=raw_batches[name],
                       repeats_per_sample=repetitions[name], query_count_per_batch=len(queries),
                       calibration_batch_ns=calibration[name]) for name,samples in query_samples.items()}
        costs={'sequential_index':builds['sequential']['median_ns'],
               'balanced_index':builds['balanced']['median_ns'],
               'numeric_cache':builds['balanced']['median_ns']+builds['cache_preparation']['median_ns']}
        replay_cost=queries_result['replay']['median_ns']
        crossover={}
        for name,build_cost in costs.items():
            saving=replay_cost-queries_result[name]['median_ns']
            crossover[name]=dict(build_cost_ns=build_cost, saving_ns_per_query=saving,
                queries=math.ceil(build_cost/saving) if saving>0 else None,
                meaning='model estimate from medians; no finite crossover if saving<=0')
        total_estimates={str(q):{'replay_ns':replay_cost*q, **{name+'_ns':cost+queries_result[name]['median_ns']*q
                         for name,cost in costs.items()}} for q in [1,64,1024,65536]}
        result=dict(id=case['id'],p=p,E=e,m=case['m'],kind=case['kind'],seed=case['seed'],
                    pieces={'sequential':len(old.pieces),'balanced':len(new.pieces)},
                    queries_checked=len(queries), overflow_fraction=sum(x in (NEG_INF,POS_INF) for x in expected)/len(expected),
                    construction=builds,query=queries_result,crossover=crossover,
                    estimated_total_cost=total_estimates,
                    retained_python_bytes={'operands':deep_size(operands),'sequential':deep_size(old),
                                           'balanced':deep_size(new),'numeric_cache_alone':deep_size(cache)},
                    correctness='PASS')
        results.append(result)
        write_json(HERE / 'timings.json', dict(status='RUNNING',results=results))
        print(case['id'], 'old/new build ms',round(builds['sequential']['median_ns']/1e6,3),
              round(builds['balanced']['median_ns']/1e6,3), 'replay/new/cache query us',
              *[round(queries_result[k]['median_ns']/1000,3) for k in ['replay','balanced_index','numeric_cache']],flush=True)
    write_json(HERE / 'environment_after.json',environment())
    write_json(HERE / 'timings.json',dict(status='COMPLETE',results=results))
    # Allocation profiles are deliberately outside all timing measurements.
    allocation=[]
    for case in cases:
        row={'id':case['id']}
        for name,constructor in [('sequential',sequential),('balanced',balanced)]:
            tracemalloc.start()
            result=constructor(case['p'],case['E'],case['operands'])
            current,peak=tracemalloc.get_traced_memory()
            tracemalloc.stop()
            row[name]={'current_traced_bytes':current,'peak_traced_bytes':peak}
            del result
        allocation.append(row)
        write_json(HERE / 'allocations.json',allocation)
    print('Timing and separate allocation passes complete.',flush=True)


if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--phase',choices=['profile','measure'],required=True)
    args=parser.parse_args()
    profile() if args.phase=='profile' else main_measure()
