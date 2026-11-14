"""Exact tagged transfer indices for every integer radix beta >= 2.

Finite operands/states are scaled by the least subnormal ulp. This module
stores no operand history in an index. Integer operations have abstract,
not constant bit, cost. It is a research reference, not a hardware benchmark.
"""
from bisect import bisect_right
from dataclasses import dataclass

NEG_INF, POS_INF = '-inf', '+inf'


def ceil_div(a, b):
    return -((-a) // b)


def ge2(value, target2):
    return value == POS_INF or (value != NEG_INF and 2 * value >= target2)


class RadixFormat:
    def __init__(self, beta, p, e):
        if beta < 2 or p < 2 or e < 1:
            raise ValueError('require beta>=2, p>=2, E>=1')
        self.beta, self.p, self.e = beta, p, e
        self.lam = 2 if beta % 2 == 0 else 1
        self.n = beta ** (p - 1)
        self.powers = [beta ** j for j in range(e)]
        width = (beta - 1) * self.n
        self.maximum = (beta * self.n - 1) * self.powers[-1]
        self.twice_overflow = 2 * self.maximum + self.powers[-1]
        self.regions = []
        rank = 0
        for j in reversed(range(e)):
            h = self.powers[j]
            self.regions.append((rank, rank + width, -(beta*self.n-1)*h, h))
            rank += width
        self.regions.append((rank, rank + 2*self.n-1, 1-self.n, 1))
        rank += 2*self.n-1
        for j in range(e):
            h = self.powers[j]
            self.regions.append((rank, rank + width, self.n*h, h))
            rank += width
        self.length = rank
        self.region_starts = [r[0] for r in self.regions]
        self.boundaries = [-self.n*self.powers[j] for j in reversed(range(1,e))]
        self.boundaries += [self.n*self.powers[j] for j in range(1,e)]
        assert rank == 2*self.n*((beta-1)*e+1)-1

    def value_at(self, rank):
        if not 0 <= rank < self.length:
            raise IndexError(rank)
        start, _, first, spacing = self.regions[bisect_right(self.region_starts, rank)-1]
        return first + (rank-start)*spacing

    def spacing(self, z):
        j = 0
        while j+1 < self.e and abs(z) >= self.n*self.powers[j+1]:
            j += 1
        return self.powers[j]

    def finite(self, z):
        return isinstance(z, int) and abs(z) <= self.maximum and z % self.spacing(z) == 0

    def rounded(self, z):
        if z in (NEG_INF, POS_INF):
            return z
        assert isinstance(z, int)
        # For odd beta the cut is half-integral, so equality is impossible.
        if 2*z >= self.twice_overflow:
            return POS_INF
        if 2*z <= -self.twice_overflow:
            return NEG_INF
        h = self.spacing(z)
        q, r = divmod(z, h)
        if 2*r > h or (2*r == h and q % 2):
            q += 1
        result = q*h
        assert self.finite(result)
        return result


@dataclass(frozen=True)
class Piece:
    start: int
    stop: int
    d: int
    c: object
    lam: int
    height: object = None  # None denotes the explicitly affine record.
    thresholds: tuple = ()

    def at(self, rank):
        assert self.start <= rank < self.stop
        if self.c in (NEG_INF, POS_INF):
            return self.c
        i = rank-self.start
        if self.height is None:
            return self.c+self.d*i
        h = self.height
        q, r = divmod(i, self.lam*h//self.d)
        return self.c+self.lam*h*q+h*sum(r >= t for t in self.thresholds)

    def inverse2(self, target2):
        if self.c == NEG_INF:
            return self.stop
        if self.c == POS_INF or target2 <= 2*self.c:
            return self.start
        if self.height is None:
            offset = ceil_div(target2-2*self.c, 2*self.d)
        else:
            k = ceil_div(target2-2*self.c, 2*self.height)
            q, s = divmod(k-1, self.lam)
            offset = q*(self.lam*self.height//self.d)+self.thresholds[s]
        return min(self.stop, self.start+offset)


class Index:
    def __init__(self, fmt, pieces):
        self.fmt, self.pieces = fmt, pieces
        self.starts = [p.start for p in pieces]

    def at_rank(self, rank):
        return self.pieces[bisect_right(self.starts, rank)-1].at(rank)


def identity(fmt):
    return Index(fmt, [Piece(a,b,d,c,fmt.lam) for a,b,c,d in fmt.regions])


def origins(index):
    result, j = [], 0
    for piece in index.pieces:
        while piece.start >= index.fmt.regions[j][1]:
            j += 1
        a,b,c,d = index.fmt.regions[j]
        assert piece.stop <= b and piece.d == d
        result.append(c+(piece.start-a)*d)
    return result


def preimages(index, targets2):
    cuts, j = [], 0
    for target in targets2:
        while j < len(index.pieces) and not ge2(index.pieces[j].at(index.pieces[j].stop-1),target):
            j += 1
        cuts.append(index.fmt.length if j == len(index.pieces) else index.pieces[j].inverse2(target))
    return cuts


def union(a, b):
    result, i, j = [], 0, 0
    while i < len(a) or j < len(b):
        if j == len(b) or (i < len(a) and a[i] <= b[j]):
            x = a[i]
            i += 1
        else:
            x = b[j]
            j += 1
        if not result or result[-1] != x:
            result.append(x)
    return result


def singleton(fmt, operand):
    if not fmt.finite(operand):
        raise ValueError('nonrepresentable operand')
    ident = identity(fmt)
    cuts2 = [-fmt.twice_overflow-2*operand+1]
    cuts2 += [2*b-2*operand for b in fmt.boundaries]
    cuts2 += [fmt.twice_overflow-2*operand]
    cuts = union(ident.starts+[fmt.length],preimages(ident,cuts2))
    output, ai, region = [], 0, 0
    os = origins(ident)
    for start, stop in zip(cuts,cuts[1:]):
        while start >= ident.pieces[ai].stop:
            ai += 1
        a = ident.pieces[ai]
        z = os[ai]+(start-a.start)*a.d+operand
        c = fmt.rounded(z)
        if c in (NEG_INF,POS_INF):
            output.append(Piece(start,stop,a.d,c,fmt.lam))
            continue
        while region < len(fmt.boundaries) and z >= fmt.boundaries[region]:
            region += 1
        h = fmt.powers[abs(region-(fmt.e-1))]
        if a.d > h or (fmt.lam == 1 and a.d == h):
            output.append(Piece(start,stop,a.d,c,fmt.lam))
            continue
        horizon = min(stop-start,fmt.lam*h//a.d)
        ts = []
        for j in range(1,fmt.lam+1):
            k = c//h+j
            cut2 = h*(2*k-1)
            if k % 2 == 0:
                t = ceil_div(cut2-2*z,2*a.d)
            else:
                t = (cut2-2*z)//(2*a.d)+1
            ts.append(min(horizon,max(0,t)))
        assert all(1 <= t <= horizon for t in ts)
        output.append(Piece(start,stop,a.d,c,fmt.lam,h,tuple(ts)))
    assert len(output) <= min(fmt.length,4*fmt.e+1)
    return Index(fmt,output)


def merge(left, right):
    if (left.fmt.beta,left.fmt.p,left.fmt.e) != (right.fmt.beta,right.fmt.p,right.fmt.e):
        raise ValueError('different formats')
    fmt = left.fmt
    ros = origins(right)
    cuts = union(left.starts+[fmt.length],preimages(left,[2*y for y in ros[1:]]))
    output, ai, bi = [], 0, 0
    for start, stop in zip(cuts,cuts[1:]):
        while start >= left.pieces[ai].stop:
            ai += 1
        a = left.pieces[ai]
        y = a.at(start)
        if y in (NEG_INF,POS_INF):
            output.append(Piece(start,stop,a.d,y,fmt.lam))
            continue
        while bi+1 < len(right.pieces) and y >= ros[bi+1]:
            bi += 1
        b = right.pieces[bi]
        offset, remainder = divmod(y-ros[bi],b.d)
        assert remainder == 0 and 0 <= offset < b.stop-b.start
        c = b.at(b.start+offset)
        if c in (NEG_INF,POS_INF):
            output.append(Piece(start,stop,a.d,c,fmt.lam))
            continue
        if b.height is None:
            h = a.height
        elif a.height is None:
            h = None if (a.d > b.height or (fmt.lam == 1 and a.d == b.height)) else b.height
        else:
            h = max(a.height,b.height)
        if h is None:
            output.append(Piece(start,stop,a.d,c,fmt.lam))
            continue
        assert h >= a.d and h % a.d == 0
        horizon = min(stop-start,fmt.lam*h//a.d)
        ts = []
        for j in range(1,fmt.lam+1):
            bcut = b.inverse2(2*(c+j*h))
            if bcut == b.stop:
                t = horizon
            else:
                ycut = ros[bi]+b.d*(bcut-b.start)
                t = min(horizon,max(0,a.inverse2(2*ycut)-start))
            ts.append(t)
        assert all(1 <= t <= horizon for t in ts)
        output.append(Piece(start,stop,a.d,c,fmt.lam,h,tuple(ts)))
    assert len(output) <= min(fmt.length,len(left.pieces)+len(right.pieces)-1)
    return Index(fmt,output)


def balanced(fmt, operands):
    level = [singleton(fmt,a) for a in operands]
    if not level:
        return identity(fmt)
    while len(level)>1:
        level = [merge(level[i],level[i+1]) if i+1 < len(level) else level[i]
                 for i in range(0,len(level),2)]
    return level[0]
