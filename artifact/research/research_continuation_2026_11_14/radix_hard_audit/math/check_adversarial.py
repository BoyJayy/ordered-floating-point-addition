"""Independent adversarial checks; all arithmetic exact, no timings/GPU.

New axes beyond the previous suite: very large exponent counts, input
lookup, global inverse, arbitrary rebased records with large integer
anchors, noncanonical partition refinements, and symbolic operation counts.
The nearest-neighbour oracle is built directly from a sorted value list.
"""
from bisect import bisect_left
from fractions import Fraction as F
from itertools import product
from pathlib import Path
import importlib.util
import hashlib
import json
import random
from datetime import datetime
from zoneinfo import ZoneInfo

from radix_indices_checked import (RadixFormat, Piece, Index, identity,
                                   singleton, merge, balanced, NEG_INF, POS_INF)

HERE = Path(__file__).resolve().parent
ORIGINAL = HERE.parents[1]/'next_theorem/radix_indices.py'


class Oracle:
    def __init__(self, beta, p, e):
        n = beta**(p-1)
        parity = {0:0}
        for k in range(1, n):
            parity[k] = parity[-k] = k % 2
        for j in range(e):
            for k in range(n, beta*n):
                value = k*beta**j
                parity[value] = parity[-value] = k % 2
        self.values = sorted(parity)
        self.parity = parity
        self.maximum = self.values[-1]
        self.virtual = beta*n*beta**(e-1)

    def round(self, z):
        if z in (NEG_INF, POS_INF):
            return z
        # The virtual next value determines overflow; ties choose infinity
        # in even radix. Odd-radix sums never equal these midpoints.
        if 2*z >= self.maximum+self.virtual:
            return POS_INF
        if 2*z <= -self.maximum-self.virtual:
            return NEG_INF
        pos = bisect_left(self.values, z)
        candidates = self.values[max(0,pos-1):min(len(self.values),pos+1)]
        return min(candidates, key=lambda v:(abs(v-z), self.parity[v]))

    def fold(self, x, ops):
        for operand in ops:
            if x in (NEG_INF, POS_INF):
                return x
            x = self.round(x+operand)
        return x


def numeric_key(x):
    return -float('inf') if x == NEG_INF else float('inf') if x == POS_INF else x


def full_domain_checks():
    rng = random.Random(2026111431)
    formats = [(2,2,1),(3,2,1),(4,2,3),(5,2,3),(6,2,3),
               (7,2,2),(8,2,2),(9,2,2),(10,2,3),(12,2,2),(16,2,2),
               (3,3,3),(2,2,257),(3,2,129),(10,2,33)]
    counts = dict(formats=0, blocks=0, forward_comparisons=0, numeric_lookup=0,
                  global_inverse=0, rejected_inputs=0, refined_merges=0)
    details = []
    for beta,p,e in formats:
        fmt, oracle = RadixFormat(beta,p,e), Oracle(beta,p,e)
        assert fmt.length == len(oracle.values)
        assert [fmt.value_at(i) for i in range(fmt.length)] == oracle.values
        for i,value in enumerate(oracle.values):
            assert fmt.index_of(value) == i and fmt.finite(value)
            counts['numeric_lookup'] += 1
        invalid = [oracle.maximum+1, -oracle.maximum-1, F(1,2), None, 'nan']
        invalid += [oracle.values[i]+1 for i in range(len(oracle.values)-1)
                    if oracle.values[i+1]-oracle.values[i] > 1][:10]
        for value in invalid:
            assert not fmt.finite(value)
            try: identity(fmt).evaluate(value)
            except (ValueError,TypeError): counts['rejected_inputs'] += 1
            else: raise AssertionError(('accepted invalid value', beta,p,e,value))
        M = oracle.maximum
        blocks = [[],[0],[M,-M],[-M,M],[1,-1,1,-1,1]]
        for j in sorted({0,e//2,e-1}):
            a = fmt.n*fmt.powers[j]
            blocks += [[a,-a,a],[-a,1,a], [fmt.powers[j]//2] if beta%2==0 and j>0 else [1]]
        for m in [2,3,5,9]:
            blocks.append([rng.choice(oracle.values) for _ in range(m)])
        if e <= 3:
            queries = oracle.values
        else:
            queries = sorted(set([0,1,-1,M,-M]+rng.sample(oracle.values,256)))
            # Every exponent edge, both signs, plus adjacent values.
            for j in range(e):
                edge = fmt.n*fmt.powers[j]
                at = bisect_left(oracle.values,edge)
                for i in range(max(0,at-1), min(len(oracle.values),at+2)):
                    queries += [oracle.values[i],-oracle.values[i]]
        for ops in blocks:
            index = balanced(fmt,ops)
            cut = len(ops)//2
            joined = merge(balanced(fmt,ops[:cut]),balanced(fmt,ops[cut:]))
            for x in queries+[NEG_INF,POS_INF]:
                expected = oracle.fold(x,ops)
                assert index.evaluate(x)==expected, (beta,p,e,ops,x,expected,index.evaluate(x))
                assert joined.evaluate(x)==expected
                counts['forward_comparisons'] += 2
            assert len(index.pieces) <= min(fmt.length,4*e*len(ops)+1) if ops else len(index.pieces)==2*e+1
            if e <= 3:
                outputs = [oracle.fold(x,ops) for x in oracle.values]
                targets = [2*rng.choice(oracle.values)+rng.choice((-1,0,1)) for _ in range(12)]
                for target in targets:
                    for strict in (False,True):
                        expected = next((i for i,v in enumerate(outputs)
                                         if (v==POS_INF or (v!=NEG_INF and (2*v>target if strict else 2*v>=target)))),fmt.length)
                        assert index.inverse2(target,strict)==expected
                        counts['global_inverse'] += 1
                if ops and len(ops)<=5:
                    def refine(source):
                        pieces=[]
                        for piece in source.pieces:
                            cuts=sorted({piece.start,piece.stop,(piece.start+piece.stop)//2})
                            for start,stop in zip(cuts,cuts[1:]):
                                if start==stop:continue
                                c=piece.at(start)
                                if c in (NEG_INF,POS_INF) or piece.height is None:
                                    pieces.append(Piece(start,stop,piece.d,c,piece.lam))
                                else:
                                    horizon=min(stop-start,piece.lam*piece.height//piece.d)
                                    ts=tuple(next((i for i in range(horizon)
                                                   if piece.at(start+i)>=c+j*piece.height),horizon)
                                             for j in range(1,piece.lam+1))
                                    pieces.append(Piece(start,stop,piece.d,c,piece.lam,piece.height,ts))
                        return Index(fmt,pieces)
                    refined = refine(index)
                    tail=singleton(fmt,1)
                    remerged=merge(refined,refine(tail))
                    for x in oracle.values:
                        assert remerged.evaluate(x)==oracle.fold(x,ops+[1])
                        counts['forward_comparisons'] += 1
                    counts['refined_merges'] += 1
            counts['blocks'] += 1
        counts['formats'] += 1
        details.append(dict(beta=beta,p=p,E=e,N=fmt.length,blocks=len(blocks),queries_per_block=len(queries)))
    return dict(status='PASS',counts=counts,formats=details)


def formula(i,c,d,h,lam,ts):
    if h is None: return c+d*i
    period=lam*h//d
    q,r=divmod(i,period)
    return c+lam*h*q+h*sum(r>=t for t in ts)


def adversarial_records():
    rng=random.Random(2026111432)
    counts=dict(compositions=0,values=0,large_exponent=0,affine_A=0,affine_B=0,clipped=0)
    for beta in (2,3,4,5,6,7,9,10,12,16,17):
        lam=2 if beta%2==0 else 1
        for repetition in range(600):
            ea=rng.choice((0,1,2,8,32,128))
            da=beta**ea
            ha=None if rng.randrange(3)==0 else beta**(ea+rng.choice((0,1,2,7)))
            la=rng.randrange(2,44)
            ca=rng.choice((-1,1))*rng.randrange(5)*beta**rng.choice((0,5,130))
            cap=1 if ha is None else min(la,lam*ha//da)
            ta=() if ha is None else tuple(sorted(rng.randint(1,cap) for _ in range(lam)))
            left=rng.randrange(la)
            aa=[formula(i,ca,da,ha,lam,ta) for i in range(left,la)]
            limit=ea if ha is None else ea+int(0)  # conservative divisor of every difference
            db=beta**rng.randrange(limit+1)
            phase=rng.randrange(11)
            yb=aa[0]-phase*db
            indices=[(x-yb)//db for x in aa]
            assert all(yb+j*db==x for x,j in zip(aa,indices))
            lb=indices[-1]+rng.randrange(1,6)
            hb=None if rng.randrange(3)==0 else db*beta**rng.choice((0,1,3,10))
            cb=rng.choice((-1,1))*rng.randrange(7)*beta**rng.choice((0,4,129))
            cap=1 if hb is None else min(lb,lam*hb//db)
            tb=() if hb is None else tuple(sorted(rng.randint(1,cap) for _ in range(lam)))
            expected=[formula(i,cb,db,hb,lam,tb) for i in indices]
            if hb is None: h=ha
            elif ha is None: h=None if da>hb or (lam==1 and da==hb) else hb
            else: h=max(ha,hb)
            if h is None: ts=()
            else:
                horizon=min(len(aa),lam*h//da)
                ts=tuple(next((i for i in range(horizon) if expected[i]>=expected[0]+j*h),horizon)
                         for j in range(1,lam+1))
            actual=[formula(i,expected[0],da,h,lam,ts) for i in range(len(aa))]
            assert actual==expected,(beta,da,ha,ta,db,hb,tb,left,phase,expected,actual)
            counts['compositions']+=1;counts['values']+=len(aa)
            counts['large_exponent']+=ea>=32
            counts['affine_A']+=ha is None;counts['affine_B']+=hb is None
            counts['clipped']+=any(t==la for t in ta)+any(t==lb for t in tb)
    return dict(status='PASS',counts=counts,seed=2026111432)


def floor_identity():
    def Q(h,u,v,x):return h*((x+v)//h)+u
    comparisons=0
    heights=(1,2,3,4,6,8,9,12,16,27)
    for a,b in product(heights,repeat=2):
        if a%b and b%a:continue
        for ua,va,ub,vb in product((-5,-1,0,2,7),repeat=4):
            if b%a==0: h,u,v=b,ub,va+a*((ua+vb)//a)
            else: h,u,v=a,ub+b*((ua+vb)//b),va
            for x in range(-15,16):
                assert Q(b,ub,vb,Q(a,ua,va,x))==Q(h,u,v,x)
                comparisons+=1
    witness=[Q(3,0,0,Q(2,0,0,x)) for x in range(7)]
    assert witness==[0,0,0,0,3,3,6]
    assert witness[3]-witness[0]!=3
    return dict(status='PASS',comparisons=comparisons,non_nested_counterexample=witness,
                meaning='nested integer floor identity is elementary prior algebra, not new novelty')


def findings():
    spec=importlib.util.spec_from_file_location('original_radix',ORIGINAL)
    module=importlib.util.module_from_spec(spec)
    import sys
    sys.modules[spec.name]=module
    spec.loader.exec_module(module)
    counts=[]
    original_spacing=module.RadixFormat.spacing
    try:
        for e in (1,2,4,8,16,32,64,128):
            count=dict(calls=0,loop_tests=0)
            def counted(self,z):
                count['calls']+=1
                j=0
                while True:
                    count['loop_tests']+=1
                    if not (j+1<self.e and abs(z)>=self.n*self.powers[j+1]):break
                    j+=1
                return self.powers[j]
            module.RadixFormat.spacing=counted
            fmt=module.RadixFormat(2,3,e)
            result=module.singleton(fmt,1)
            counts.append(dict(E=e,pieces=len(result.pieces),**count))
    finally: module.RadixFormat.spacing=original_spacing
    corrected_counts=[]
    class CountList(list):
        def __init__(self, values, counter, key):
            super().__init__(values); self.counter,self.key=counter,key
        def __getitem__(self,key):
            self.counter[self.key]+=1
            return super().__getitem__(key)
    for e in (1,2,4,8,16,32,64,128):
        fmt=RadixFormat(2,3,e)
        count=dict(boundary_accesses=0,power_accesses=0,numeric_region_accesses=0)
        fmt.boundaries=CountList(fmt.boundaries,count,'boundary_accesses')
        fmt.powers=CountList(fmt.powers,count,'power_accesses')
        fmt.numeric_region_starts=CountList(fmt.numeric_region_starts,count,'numeric_region_accesses')
        def forbidden(*args):raise AssertionError('singleton made a per-piece generic-round/spacing call')
        fmt.spacing=forbidden
        fmt.rounded=forbidden
        result=singleton(fmt,1)
        assert count['boundary_accesses'] <= 6*e+3
        corrected_counts.append(dict(E=e,pieces=len(result.pieces),generic_round_calls=0,**count))
    fmt=RadixFormat(2,3,2)
    bad=Index(fmt,[Piece(a,b,d,0,fmt.lam) for a,b,c,d in fmt.regions])
    values=[bad.at_rank(i) for i in range(fmt.length)]
    assert all(fmt.finite(v) for v in values)
    assert values!=sorted(values)
    try:merge(bad,identity(fmt))
    except AssertionError: nonmonotone_failure=True
    else:nonmonotone_failure=False
    assert nonmonotone_failure
    # A valid monotone identity encoded with singleton staircase records
    # can carry arbitrarily large artificial heights without changing its map.
    exponent_examples=[]
    fmt=RadixFormat(2,2,1)
    for exponent in (10,100,1000):
        pieces=[]
        for i in range(fmt.length):
            pieces.append(Piece(i,i+1,1,fmt.value_at(i),2,2**exponent,(1,1)))
        index=Index(fmt,pieces)
        assert [index.at_rank(i) for i in range(fmt.length)]==[fmt.value_at(i) for i in range(fmt.length)]
        joined=merge(index,identity(fmt))
        assert [joined.at_rank(i) for i in range(fmt.length)]==[fmt.value_at(i) for i in range(fmt.length)]
        exponent_examples.append(dict(p=2,E=1,N=fmt.length,stored_height_exponent=exponent,
                                     exponent_bits=exponent.bit_length(),same_identity_function=True))
    return dict(singleton_original_operation_counts=counts,
                singleton_corrected_operation_counts=corrected_counts,
                nonmonotone_precondition_witness=dict(beta=2,p=3,E=2,outputs=values,
                    merge_with_identity_asserts=nonmonotone_failure,
                    caveat='locally valid records; not a valid globally monotone transfer index'),
                unbounded_height_encoding_witness=exponent_examples)


if __name__=='__main__':
    result=dict(status='PASS_WITH_QUALIFICATIONS',time_moscow=datetime.now(ZoneInfo('Europe/Moscow')).isoformat(),
                full_domain=full_domain_checks(),arbitrary_records=adversarial_records(),
                nested_floor=floor_identity(),findings=findings(),
                source_hashes={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in
                               [Path(__file__),HERE/'radix_indices_checked.py',ORIGINAL]},
                limits=['bounded exact tests; no proof assistant or external review',
                        'original results and manuscript not modified',
                        'operation counters are not timing measurements'])
    (HERE/'audit_results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
