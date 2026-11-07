"""Independent adversarial verification of two-threshold dyadic pieces.

No code from the reference evaluator is imported.
Integer eighth units avoid host floating-point arithmetic entirely.
"""
from bisect import bisect_right
from itertools import product
from pathlib import Path
import json
import random


def lattice(z8, h):
    n, rem = divmod(z8, 8*h)
    if 2*rem > 8*h or (2*rem == 8*h and n%2):
        n += 1
    return 8*h*n


def fp(z8,p):
    if z8<0:
        return -fp(-z8,p)
    bits = max(0,z8.bit_length()-p)
    n,rem=divmod(z8,1<<bits)
    if 2*rem > 1<<bits or (2*rem == 1<<bits and n%2):
        n+=1
    return n<<bits


def fold(i, seq, x0=37):
    y=8*(x0+4*i)
    for h,a8 in seq:
        y=lattice(y+a8,h)
    return y//8


def form(i,c,h,t1,t2):
    q,r=divmod(i,h//2)
    return c+2*h*q+h*((r>=t1)+(r>=t2))


def derive(seq):
    h=max([2]+[h for h,a in seq]);p=h//2;c=fold(0,seq)
    ys=[fold(i,seq) for i in range(p+1)]
    assert ys[-1]==c+2*h
    assert ys==sorted(ys)
    assert all((y-c)%h==0 for y in ys)
    t1=next(i for i,y in enumerate(ys) if y>=c+h)
    t2=next(i for i,y in enumerate(ys) if y>=c+2*h)
    assert 1<=t1<=t2<=p
    probes=list(range(-p,2*p+1))
    for i in probes:
        assert form(i,c,h,t1,t2)==fold(i,seq),(seq,i,c,h,t1,t2)
    return len(probes)


def uniform_checks():
    alphabet=list(product((1,2,4,8),(-20,-16,-12,-8,-4,0,4,8,12,16,20)))
    exhaustive=probes=0
    for length in range(4):
        for seq in product(alphabet,repeat=length):
            probes+=derive(seq);exhaustive+=1
    rng=random.Random(2026110749)
    random_cases=0
    for length in (4,8,16,32,64):
        for trial in range(32):
            seq=[(1<<rng.randrange(8),rng.randint(-8192,8192)) for _ in range(length)]
            probes+=derive(seq);random_cases+=1
    return dict(status='PASS',exhaustive_compositions=exhaustive,
                random_compositions=random_cases,query_checks=probes,
                max_lattice_spacing=128,max_length=64,
                invariant='coset modulo H, not necessarily zero residue')


class PieceMap:
    def __init__(self,xs,p,k):
        self.xs=xs;self.p=p;self.k=k;self.r=1<<p
        self.parts=[(0,len(xs),2,xs[0],1,1)]
        self.probes=0

    def query(self,i):
        self.probes+=1
        starts=[part[0] for part in self.parts]
        l,r,h,c,t1,t2=self.parts[bisect_right(starts,i)-1]
        assert l<=i<r
        return form(i-l,c,h,t1,t2)

    def update(self,a8):
        count=len(self.xs)
        boundaries=[8*(self.r<<j) for j in range(self.k-1)]
        cuts={0,count}
        for l,r,*unused in self.parts:
            cuts.add(l);cuts.add(r)
        for boundary in boundaries:
            lo,hi=0,count
            while lo<hi:
                mid=(lo+hi)//2
                if 8*self.query(mid)+a8>=boundary:hi=mid
                else:lo=mid+1
            cuts.add(lo)
        newparts=[];starts=[part[0] for part in self.parts]
        for l,r in zip(sorted(cuts),sorted(cuts)[1:]):
            if l==r:continue
            oldpart=self.parts[bisect_right(starts,l)-1]
            assert r<=oldpart[1]
            exact=8*self.query(l)+a8
            spacing=1<<bisect_right(boundaries,exact)
            def newvalue(i):return lattice(8*self.query(l+i)+a8,spacing)//8
            c=newvalue(0);h=max(oldpart[2],spacing);period=h//2
            n=min(period,r-l)
            thresholds=[]
            for target in (c+h,c+2*h):
                lo,hi=0,n
                while lo<hi:
                    mid=(lo+hi)//2
                    if newvalue(mid)>=target:hi=mid
                    else:lo=mid+1
                thresholds.append(lo)
            assert 1<=thresholds[0]<=thresholds[1]<=n
            newparts.append((l,r,h,c,*thresholds))
        self.parts=newparts


def piece_checks():
    rng=random.Random(2026110751)
    blocks=prefixes=queries=fringe=probes=0
    max_parts=max_ratio=0
    for p in (6,7,8,10):
        r=1<<p;xs=list(range(r//2+8,3*r//4,4))
        for k in range(2,9):
            low,high,h=r//2,r<<(k-1),1<<(k-1)
            for length in (1,2,8,32,128):
                for trial in range(4):
                    ys=xs[:];rep=PieceMap(xs,p,k)
                    for step in range(1,length+1):
                        amin=8*low-2-8*ys[0]
                        amax=8*high-4*h-1-8*ys[-1]
                        if step==1:a8=-66
                        else:
                            for attempt in range(512):
                                if trial%2:raw=rng.randint(max(amin,-8*r),min(amax,8*r))
                                else:raw=rng.randint(amin,amax)
                                a8=fp(raw,p)
                                if amin<=a8<=amax and (a8==0 or abs(a8)>=8):break
                            else:a8=0
                        assert fp(a8,p)==a8
                        exacts=[8*y+a8 for y in ys]
                        fringe+=min(exacts)<8*low
                        expected=[fp(z,p)//8 for z in exacts]
                        assert all(low<=y<high for y in expected)
                        rep.update(a8)
                        actual=[rep.query(i) for i in range(len(xs))]
                        assert actual==expected,(p,k,step,a8,rep.parts,actual,expected)
                        assert len(rep.parts)<=1+(k-1)*step
                        max_parts=max(max_parts,len(rep.parts))
                        ys=expected;prefixes+=1;queries+=len(xs)
                    probes+=rep.probes;blocks+=1
    return dict(status='PASS',blocks=blocks,prefixes=prefixes,queries=queries,
                prefixes_with_lower_fringe=fringe,total_evaluator_probes=probes,
                maximum_piece_count=max_parts,
                comparison='full exact binary rounding versus independent uniform piece update')


def fixtures():
    # A smaller lattice can change the coset away from zero modulo old H.
    seq=[(8,0),(1,8)]
    values=[fold(i,seq) for i in range(4)]
    assert all(v%8==1 for v in values)
    # Distinct thresholds can coincide; threshold P can be a sentinel.
    observed={}
    for h in (4,8,16):
        for a8 in range(-8*h,8*h+1):
            p=h//2;c=fold(0,[(h,a8)])
            ys=[fold(i,[(h,a8)]) for i in range(p+1)]
            ts=tuple(next(i for i,y in enumerate(ys) if y>=c+j*h) for j in (1,2))
            if ts[0]==ts[1]:observed['equal_thresholds']={'h':h,'a8':a8,'thresholds':ts}
            if ts[1]==p:observed['period_sentinel']={'h':h,'a8':a8,'thresholds':ts}
    assert 'period_sentinel' in observed
    return dict(status='PASS',nonzero_coset_example=values,observed=observed)


if __name__=='__main__':
    result={'scope':'independent exact finite checks; no GPU measurements'}
    for name,fn in [('uniform',uniform_checks),('pieces',piece_checks),('fixtures',fixtures)]:
        result[name]=fn();print(name+': PASS',flush=True)
    result['status']='PASS'
    Path(__file__).with_name('uniform_piece_results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))
