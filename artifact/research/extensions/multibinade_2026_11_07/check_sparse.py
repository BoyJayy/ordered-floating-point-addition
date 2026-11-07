"""Check the new evaluator against an independent finite-neighbour oracle."""
from fractions import Fraction
from pathlib import Path
import json
import random

from multibinade_summary import MultibinadeSummary,OutsideCorridor,round_corridor
from check_multibinade import rn_quarter,rn_neighbours,representables


def main():
    rng=random.Random(2026110722)
    blocks=prefixes=queries=0
    for p in (6,7,9):
        r=1<<p
        for k in (2,3,4,6):
            vals=representables(p,k)
            for length in (1,2,8,32,128):
                for trial in range(4):
                    summary=MultibinadeSummary(p,k)
                    table=[summary.start+4*i for i in range(summary.count)]
                    for t in range(length):
                        for attempt in range(256):
                            amin,amax=4*(r//2-table[0]),4*((r<<(k-1))-table[-1])-1
                            proposed=rng.randint(amin,amax)
                            a4=rn_quarter(proposed,p)
                            if not amin<=a4<=amax:
                                continue
                            expected=[rn_neighbours(4*x+a4,vals,p) for x in table]
                            if expected[-1]>=(r<<(k-1)):
                                continue
                            break
                        else:
                            raise AssertionError('fixture search exhausted')
                        summary.push(Fraction(a4,4))
                        assert [summary.query(i) for i in range(summary.count)]==expected
                        table=expected
                        queries+=summary.count
                        prefixes+=1
                    blocks+=1
    # Preserve state if either the exact or rounded promise is violated.
    s=MultibinadeSummary(8,3)
    before=[s.query(i) for i in range(s.count)]
    rejections=0
    for a in (-10000,10000,Fraction(1023)-before[-1]):
        try:
            s.push(a)
        except OutsideCorridor:
            rejections+=1
        else:
            raise AssertionError('corridor violation accepted')
        assert [s.query(i) for i in range(s.count)]==before and s.steps==0
    # Huge original grids: a single representable addition produces a dense
    # alternating 8,0 gap sequence, encoded by just two spacing-eight grids.
    large=[]
    for p in (24,53):
        r=1<<p
        s=MultibinadeSummary(p,3)
        a=3*r//2+2
        assert rn_quarter(4*a,p)==4*a
        s.push(a)
        assert len(s.groups)==2 and s.support==0
        indices={0,1,2,3,s.count-2,s.count-1,*[rng.randrange(s.count) for _ in range(512)]}
        for i in indices:
            expected=rn_quarter(4*(s.start+4*i+a),p)//4
            assert s.query(i)==expected
        large.append(dict(p=p,k=3,domain_states=s.count,additions=1,
                          groups=len(s.groups),stored_deviations=s.support,
                          checked_queries=len(indices),rounding_evaluations=s.rounding_evaluations))
    # Fractional phases beyond quarters to exercise the exact-rational path.
    fractions_checked=0
    for k in (2,3,5):
        p=7
        vals=representables(p,k)
        for denom in (3,5,7,16):
            s=MultibinadeSummary(p,k)
            block=[Fraction(1,denom),Fraction(-1,denom)]*8
            table=[s.start+4*i for i in range(s.count)]
            for a in block:
                # Arbitrary rational addends strengthen algorithm testing;
                # these are not claimed to be binary-format operands.
                expected=[]
                for x in table:
                    z=Fraction(x)+a
                    at=min(vals,key=lambda v:(abs(Fraction(v)-z),
                          (v>>max(0,v.bit_length()-p))&1))
                    expected.append(at)
                s.push(a)
                assert [s.query(i) for i in range(s.count)]==expected
                table=expected
                fractions_checked+=s.count
    result=dict(status='PASS',seed=2026110722,small_blocks=blocks,
        small_prefixes=prefixes,full_table_queries=queries,promise_rejections=rejections,
        arbitrary_rational_oracle_comparisons=fractions_checked,large_domains=large,
        scope='exact reference evaluator; no new CPU/GPU performance measurements')
    Path(__file__).with_name('sparse_results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))


if __name__=='__main__':
    main()
