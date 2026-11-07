"""Reference sparse evaluator on the original X* for K positive binades.

Exact rational arithmetic; not a floating-point performance implementation.
The old two-binade implementation is preserved unchanged. This evaluator is
not claimed to form a closed monoid under composition.
"""
from bisect import bisect_left
from fractions import Fraction


class OutsideCorridor(ValueError):
    pass


def round_corridor(value, p, k):
    value=Fraction(value)
    r=1<<p
    if not r//2<=value<(r<<(k-1)):
        raise OutsideCorridor('exact intermediate outside C_K')
    h=1
    boundary=r
    while value>=boundary:
        h*=2
        boundary*=2
    quotient,remainder=divmod(value.numerator,value.denominator*h)
    denom=value.denominator*h
    result=h*(quotient+(2*remainder>denom or
                        (2*remainder==denom and quotient%2)))
    if not r//2<=result<(r<<(k-1)):
        raise OutsideCorridor('rounded intermediate outside C_K')
    return result


class _QGrid:
    def __init__(self,p,k,start,count):
        self.p,self.k,self.q,self.count=p,k,1<<k,count
        self.first=start
        self.deviations={}
        self.indices=[]
        self.prefix=[0]
        self.steps=0
        self.rounding_evaluations=0

    def query(self,index):
        if not 0<=index<self.count:
            raise IndexError(index)
        return self.first+self.q*index+self.prefix[bisect_left(self.indices,index)]

    def prepare(self,addend):
        first=round_corridor(self.first+addend,self.p,self.k)
        candidates=set(self.indices)
        for b in range(self.k-1):
            boundary=(1<<self.p)<<b
            low,high=0,self.count
            while low<high:
                mid=(low+high)//2
                if self.query(mid)+addend<boundary:
                    low=mid+1
                else:
                    high=mid
            if 0<low<self.count:
                candidates.add(low-1)
        updated={}
        for i in candidates:
            a=round_corridor(self.query(i)+addend,self.p,self.k)
            b=round_corridor(self.query(i+1)+addend,self.p,self.k)
            d=b-a-self.q
            if d:
                updated[i]=d
        assert len(updated)<=(self.k-1)*(self.steps+1)
        assert sum(abs(d) for d in updated.values())<=self.q*(self.k-1)*(self.steps+1)
        return first,updated,1+2*len(candidates)

    def commit(self,prepared):
        self.first,self.deviations,evaluations=prepared
        self.steps+=1
        self.rounding_evaluations+=evaluations
        self.indices=sorted(self.deviations)
        self.prefix=[0]
        for i in self.indices:
            self.prefix.append(self.prefix[-1]+self.deviations[i])


class MultibinadeSummary:
    """Exact evaluator of all original marker indices; no full table stored.

    Public p,K and the fixed X* define every query. The summary stores one
    anchor and sparse gap deviations for each nonempty residue class.
    """
    def __init__(self,p,k):
        if not isinstance(p,int) or not isinstance(k,int) or p<6 or k<2:
            raise ValueError('p>=6 and K>=2 are required')
        self.p,self.k,self.r=p,k,1<<p
        self.start=self.r//2+8
        self.count=self.r//16-2
        self.stride=1<<(k-2)
        self.groups=[_QGrid(p,k,self.start+4*j,
                     1+(self.count-1-j)//self.stride)
                     for j in range(min(self.stride,self.count))]
        self.steps=0
        self.promise_rounding_evaluations=0

    def query(self,index):
        if not 0<=index<self.count:
            raise IndexError(index)
        return self.groups[index%self.stride].query(index//self.stride)

    def push(self,addend):
        addend=Fraction(addend)
        # Monotonicity makes the two extreme queries sufficient for the
        # entire exact/rounded corridor promise. Reject before mutating.
        round_corridor(self.query(0)+addend,self.p,self.k)
        round_corridor(self.query(self.count-1)+addend,self.p,self.k)
        prepared=[group.prepare(addend) for group in self.groups]
        for group,state in zip(self.groups,prepared):
            group.commit(state)
        self.steps+=1
        self.promise_rounding_evaluations+=2

    @property
    def support(self):
        return sum(len(group.indices) for group in self.groups)

    @property
    def rounding_evaluations(self):
        return self.promise_rounding_evaluations+sum(g.rounding_evaluations for g in self.groups)
