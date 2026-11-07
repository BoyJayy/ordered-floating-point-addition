"""Cross-check the staircase evaluator against an independent oracle."""
from fractions import Fraction
from pathlib import Path
import hashlib
import importlib.util
import json
import random
import sys

from check_uniform_pieces import fp


root=Path(__file__).resolve().parent.parent
source=root/'staircase_summary.py'
spec=importlib.util.spec_from_file_location('parent_staircase_under_review',source)
mod=importlib.util.module_from_spec(spec)
sys.modules[spec.name]=mod
spec.loader.exec_module(mod)


def run():
    rng=random.Random(2026110757)
    blocks=prefixes=queries=0
    max_pieces=0
    for p in (6,7,8,10):
        r=1<<p
        xs=list(range(r//2+8,3*r//4,4))
        for k in (2,3,4,8,16):
            h=1<<(k-1);lo,hi=r//2,r<<(k-1)
            for length in (1,2,16,64):
                for trial in range(3):
                    summary=mod.StaircaseSummary(p,k)
                    outputs=xs[:]
                    for step in range(1,length+1):
                        amin=8*lo-2-8*outputs[0]
                        amax=8*hi-4*h-1-8*outputs[-1]
                        if step==1:a8=-66
                        else:
                            for attempt in range(512):
                                a8=fp(rng.randint(amin,amax),p)
                                if amin<=a8<=amax and (a8==0 or abs(a8)>=8):break
                            else:a8=0
                        expected=[fp(8*y+a8,p)//8 for y in outputs]
                        summary.append(Fraction(a8,8))
                        actual=[summary.evaluate(x) for x in xs]
                        assert actual==expected,(p,k,step,a8,summary.descriptor())
                        assert len(summary.pieces)<=min(len(xs),1+(k-1)*step)
                        max_pieces=max(max_pieces,len(summary.pieces))
                        outputs=expected;prefixes+=1;queries+=len(xs)
                    blocks+=1
    # Rejected updates must leave both contents and operation counters unchanged.
    denied=0
    s=mod.StaircaseSummary(8,4)
    s.append(Fraction(-33,4))
    for a in (-1000,1<<20,Fraction(257,256)):
        before=s.descriptor()
        try:s.append(a)
        except ValueError:pass
        else:raise AssertionError(('expected rejection',a))
        assert s.descriptor()==before
        denied+=1
    bad_queries=0
    for x in (s.first_input-4,s.first_input+1,s.first_input+4*s.length):
        try:s.evaluate(x)
        except (ValueError,IndexError):pass
        else:raise AssertionError(('invalid query accepted',x))
        bad_queries+=1
    return dict(status='PASS',seed=2026110757,blocks=blocks,prefixes=prefixes,
                queries=queries,maximum_piece_count=max_pieces,
                atomic_update_rejections=denied,invalid_query_rejections=bad_queries,
                source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),
                scope='independent exact integer oracle; full input grids; no device runs')


if __name__=='__main__':
    result=run()
    Path(__file__).with_name('parent_crosscheck_results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
