"""Exact sparse transfer construction for a promised two-binade corridor.

This is a reference algorithm with exact rational comparisons. It is not an
optimized CPU/GPU kernel. A query index denotes initial value start+4*index.
"""
from bisect import bisect_left
from fractions import Fraction
from functools import lru_cache
from math import comb

from subset_baseline import encode, decode


@lru_cache(maxsize=256)
def fixed_budget(precision,count,steps):
    if precision<4 or count<1 or steps<1:
        raise ValueError('invalid shared encoding parameters')
    header=min(steps,count-1).bit_length()
    sparse=max(precision+1+header+q+(comb(count-1,q)-1).bit_length()+
               (comb(5*steps,q)-1).bit_length() for q in range(min(steps,count-1)+1))
    table=3*(1<<precision)//2+count-1
    return ('sparse',sparse) if sparse<=table else ('monotone',table)


class OutsideCorridor(ValueError):
    pass


def round_exact(x, R):
    x = Fraction(x)
    if not R//2 <= x < 2*R:
        raise OutsideCorridor('exact intermediate outside promised interval')
    step = 1 if x < R else 2
    quotient, remainder = divmod(x.numerator, x.denominator*step)
    rounded = step*(quotient + (2*remainder > x.denominator*step or
                               (2*remainder == x.denominator*step and quotient%2 == 1)))
    if not R//2 <= rounded < 2*R:
        raise OutsideCorridor('rounded intermediate outside promised interval')
    return rounded


class SparseTransfer:
    def __init__(self, precision, start, count):
        self.p, self.R, self.start, self.count = precision, 1 << precision, start, count
        if precision < 4 or count < 1 or start%4 or start < self.R//2 or start+4*(count-1)>=self.R:
            raise ValueError('initial progression must consist of representable lower-binade integers')
        self.first = start
        self.deviations = {}
        self.steps = 0
        self.rounding_evaluations = 0
        self._refresh()

    def _refresh(self):
        self.indices = sorted(self.deviations)
        self.prefix = [0]
        for i in self.indices:
            self.prefix.append(self.prefix[-1]+self.deviations[i])

    def query(self, index):
        if not 0 <= index < self.count:
            raise IndexError(index)
        return self.first+4*index+self.prefix[bisect_left(self.indices,index)]

    def push(self, addend):
        addend = Fraction(addend)
        # Monotonicity makes these two checks sufficient for all entry states.
        new_first = round_exact(self.first+addend,self.R)
        round_exact(self.query(self.count-1)+addend,self.R)
        self.rounding_evaluations += 2
        lo,hi = 0,self.count
        while lo < hi:
            middle = (lo+hi)//2
            if self.query(middle)+addend < self.R:
                lo = middle+1
            else:
                hi = middle
        candidates = set(self.indices)
        if 0 < lo < self.count:
            candidates.add(lo-1)
        updated = {}
        for i in candidates:
            a = round_exact(self.query(i)+addend,self.R)
            b = round_exact(self.query(i+1)+addend,self.R)
            self.rounding_evaluations += 2
            deviation = b-a-4
            if deviation:
                updated[i] = deviation
        self.first, self.deviations = new_first, updated
        self.steps += 1
        self._refresh()
        assert len(updated) <= self.steps
        # The strengthened weighted-potential proof gives 4m. The codec below
        # retains the earlier conservative 5m budget for artifact compatibility.
        assert sum(abs(v) for v in updated.values()) <= 4*self.steps

    def pack(self):
        """Enumerative sparse code; metadata p,start,count,steps are shared."""
        q = len(self.indices)
        assert self.steps > 0
        cumulative, magnitudes, signs = 0, [], 0
        for j,i in enumerate(self.indices):
            value = self.deviations[i]
            cumulative += abs(value)
            magnitudes.append(cumulative-1)
            signs |= (value < 0) << j
        T = 5*self.steps
        payload = dict(first=self.first-self.R//2,q=q,positions=encode(self.indices),
                       magnitudes=encode(magnitudes),signs=signs)
        # This is the per-q payload size; serialize() pads to fixed_budget().
        bit_count = (self.p+1 + min(self.steps,self.count-1).bit_length() + q +
                     (comb(self.count-1,q)-1).bit_length() + (comb(T,q)-1).bit_length())
        return payload,bit_count

    @classmethod
    def unpack(cls, precision,start,count,steps,payload):
        out = cls(precision,start,count)
        if steps<1 or any(type(payload.get(name)) is not int for name in
                          ('first','q','positions','magnitudes','signs')):
            raise ValueError('invalid payload fields')
        q = payload['q']
        if not 0<=q<=min(steps,count-1):
            raise ValueError('invalid support size')
        bounds={'first':3*out.R//2,'positions':comb(count-1,q),
                'magnitudes':comb(5*steps,q),'signs':1<<q}
        if any(not 0<=payload[name]<bound for name,bound in bounds.items()):
            raise ValueError('out-of-range encoded value')
        positions = decode(payload['positions'],count-1,q)
        magnitudes = decode(payload['magnitudes'],5*steps,q)
        last = -1
        for j,(i,value) in enumerate(zip(positions,magnitudes)):
            size = value-last
            out.deviations[i] = -size if (payload['signs']>>j)&1 else size
            last = value
        out.first = out.R//2+payload['first']
        out.steps = steps
        out._refresh()
        out._validate_decoded()
        return out

    def _validate_decoded(self):
        if any(d < -4 for d in self.deviations.values()):
            raise ValueError('negative decoded gap')
        if not self.R//2<=self.first<=self.query(self.count-1)<2*self.R:
            raise ValueError('decoded state outside corridor')
        probes={0,self.count-1,*self.indices,*[i+1 for i in self.indices]}
        if any(self.query(i)>=self.R and self.query(i)%2 for i in probes):
            raise ValueError('decoded value not representable')

    def serialize(self):
        """Fixed-width bytes for shared p,start,count,steps; padding is explicit."""
        mode,bits=fixed_budget(self.p,self.count,self.steps)
        if mode=='monotone':
            word=0
            for i in range(self.count):
                word |= 1 << (self.query(i)-self.R//2+i)
        else:
            payload,_=self.pack()
            q=payload['q']
            fields=((q,min(self.steps,self.count-1).bit_length()),
                    (payload['first'],self.p+1),
                    (payload['positions'],(comb(self.count-1,q)-1).bit_length()),
                    (payload['magnitudes'],(comb(5*self.steps,q)-1).bit_length()),
                    (payload['signs'],q))
            word=shift=0
            for value,width in fields:
                word |= value << shift
                shift += width
            assert shift<=bits
        return word.to_bytes((bits+7)//8,'little')

    @classmethod
    def deserialize(cls,precision,start,count,steps,data):
        mode,bits=fixed_budget(precision,count,steps)
        if len(data)!=(bits+7)//8:
            raise ValueError('wrong encoded length')
        word=int.from_bytes(data,'little')
        if word>>bits:
            raise ValueError('nonzero byte padding')
        if mode=='monotone':
            if word.bit_count()!=count:
                raise ValueError('wrong number of monotone entries')
            outputs=[]
            while word:
                low=word & -word
                outputs.append((1<<precision)//2+low.bit_length()-1-len(outputs))
                word ^= low
            out=cls(precision,start,count)
            out.first=outputs[0]
            out.steps=steps
            out.deviations={i:b-a-4 for i,(a,b) in enumerate(zip(outputs,outputs[1:])) if b-a!=4}
            out._refresh()
            out._validate_decoded()
            return out
        def take(width):
            nonlocal word
            value=word & ((1<<width)-1)
            word >>= width
            return value
        q=take(min(steps,count-1).bit_length())
        if q>min(steps,count-1):
            raise ValueError('invalid support size')
        payload=dict(q=q,first=take(precision+1),
                     positions=take((comb(count-1,q)-1).bit_length()),
                     magnitudes=take((comb(5*steps,q)-1).bit_length()),signs=take(q))
        if word:
            raise ValueError('nonzero fixed-budget padding')
        return cls.unpack(precision,start,count,steps,payload)
