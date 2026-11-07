"""Research reference: exact transfer over a whole finite binary format.

Values use integer multiples of the subnormal ulp. Signed zero is identified
numerically. NaNs and nonfinite operands are excluded; outputs may be the
strings '-inf' or '+inf', and these states absorb subsequent finite additions.
This is neither an IEEE bit-pattern emulator nor a performance implementation.
"""
from bisect import bisect_right
from dataclasses import dataclass

NEG_INF='-inf'
POS_INF='+inf'


def uniform_round(z,h):
    q,r=divmod(z,h)
    return h*(q+(2*r>h or (2*r==h and q%2)))


class BinaryFormat:
    def __init__(self,p,e):
        if not isinstance(p,int) or not isinstance(e,int) or p<2 or e<1:
            raise ValueError('require p>=2 and number of normal binades E>=1')
        self.p,self.e=p,e
        self.n=1<<(p-1)
        self.max_spacing=1<<(e-1)
        self.maximum=(2*self.n-1)*self.max_spacing
        self.twice_overflow=2*self.maximum+self.max_spacing
        self.length=(1<<p)*(e+1)-1
        self.regions=[]
        start=0
        for j in reversed(range(e)):
            d=1<<j;self.regions.append((start,start+self.n,-(2*self.n-1)*d,d));start+=self.n
        self.regions.append((start,start+2*self.n-1,-self.n+1,1));start+=2*self.n-1
        for j in range(e):
            d=1<<j;self.regions.append((start,start+self.n,self.n*d,d));start+=self.n
        assert start==self.length
        self.region_starts=[row[0] for row in self.regions]
        self.region_firsts=[row[2] for row in self.regions]
        inner=[self.n<<j for j in range(1,e)]
        self.uniform_boundaries=[-b for b in reversed(inner)]+inner

    def finite(self,x):
        if not isinstance(x,int) or abs(x)>self.maximum:return False
        spacing=1<<max(0,abs(x).bit_length()-self.p)
        return x%spacing==0

    def round(self,z):
        if 2*z>=self.twice_overflow:return POS_INF
        if 2*z<=-self.twice_overflow:return NEG_INF
        spacing=1<<max(0,abs(z).bit_length()-self.p)
        return uniform_round(z,spacing)

    def add(self,x,a):
        if x in (NEG_INF,POS_INF):return x
        return self.round(x+a)

    def value_at(self,index):
        if not 0<=index<self.length:raise IndexError(index)
        start,stop,first,d=self.regions[bisect_right(self.region_starts,index)-1]
        assert index<stop
        return first+(index-start)*d

    def index_of(self,x):
        if not self.finite(x):raise ValueError('not a finite format value')
        region=bisect_right(self.region_firsts,x)-1
        start,stop,first,d=self.regions[region]
        q,r=divmod(x-first,d)
        assert not r and 0<=q<stop-start
        return start+q


@dataclass(frozen=True)
class FullPiece:
    start:int
    stop:int
    input_spacing:int
    anchor:object
    twice_height:int
    first:int
    second:int

    def at(self,index):
        if not self.start<=index<self.stop:raise IndexError(index)
        if self.anchor in (NEG_INF,POS_INF):return self.anchor
        period=self.twice_height//self.input_spacing
        q,r=divmod(index-self.start,period)
        # If height=1/2, period=1 and both indicators are zero.
        return self.anchor+self.twice_height*q+(self.twice_height//2)*(
            (r>=self.first)+(r>=self.second))


class FullFormatSummary:
    def __init__(self,p,e):
        self.fmt=BinaryFormat(p,e)
        self.pieces=[FullPiece(a,b,d,x,d,1,1) for a,b,x,d in self.fmt.regions]
        self.starts=[row.start for row in self.pieces]
        self.steps=0

    def evaluate_index(self,index):
        if not isinstance(index,int) or not 0<=index<self.fmt.length:raise IndexError(index)
        return self.pieces[bisect_right(self.starts,index)-1].at(index)

    def evaluate(self,x):
        if x in (NEG_INF,POS_INF):return x
        return self.evaluate_index(self.fmt.index_of(x))

    def append(self,a):
        if not self.fmt.finite(a):raise ValueError('operand must be finite and representable')
        fmt=self.fmt
        cuts=set(self.starts);cuts.add(fmt.length)
        # Each predicate is monotone in the current accumulator, including infinities.
        predicates=[lambda z:2*z>-fmt.twice_overflow]
        predicates += [lambda z,b=b:z>=b for b in fmt.uniform_boundaries]
        predicates += [lambda z:2*z>=fmt.twice_overflow]
        for predicate in predicates:
            lo,hi=0,fmt.length
            while lo<hi:
                mid=(lo+hi)//2;y=self.evaluate_index(mid)
                condition=True if y==POS_INF else False if y==NEG_INF else predicate(y+a)
                if condition:hi=mid
                else:lo=mid+1
            cuts.add(lo)
        cuts=sorted(cuts);replacement=[]
        for start,stop in zip(cuts,cuts[1:]):
            parent=self.pieces[bisect_right(self.starts,start)-1]
            assert stop<=parent.stop
            current=parent.at(start)
            first=fmt.add(current,a)
            if first in (NEG_INF,POS_INF):
                replacement.append(FullPiece(start,stop,parent.input_spacing,first,1,1,1));continue
            exact=current+a
            # Interior cuts assign an exact negative boundary to its RIGHT
            # (finer) region. abs(exact).bit_length() would choose the wrong
            # side at that endpoint and cannot classify a whole piece.
            region=bisect_right(fmt.uniform_boundaries,exact)
            spacing=1<<abs(region-(fmt.e-1))
            twice_height=max(parent.twice_height,2*spacing)
            d=parent.input_spacing
            assert twice_height%d==0
            period=twice_height//d
            horizon=min(period,stop-start)
            def new(i):return uniform_round(parent.at(start+i)+a,spacing)
            anchor=new(0);thresholds=[]
            for target in (anchor+twice_height//2,anchor+twice_height):
                lo,hi=0,horizon
                while lo<hi:
                    mid=(lo+hi)//2
                    if new(mid)>=target:hi=mid
                    else:lo=mid+1
                thresholds.append(lo)
            assert 1<=thresholds[0]<=thresholds[1]<=horizon
            replacement.append(FullPiece(start,stop,d,anchor,twice_height,*thresholds))
        assert len(replacement)<=min(fmt.length,2*fmt.e+1+2*fmt.e*(self.steps+1))
        self.pieces=replacement;self.starts=[piece.start for piece in replacement];self.steps+=1

    def descriptor(self):
        return dict(p=self.fmt.p,E=self.fmt.e,length=self.fmt.length,steps=self.steps,
                    pieces=[vars(piece) for piece in self.pieces])
