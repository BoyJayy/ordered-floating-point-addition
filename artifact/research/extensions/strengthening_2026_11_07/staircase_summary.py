"""Exact piecewise two-threshold evaluator for rounded positive corridors.

All arithmetic is integer/Fraction arithmetic. Operation counters are abstract
counts, not timings. Python integer memory is not the information-theoretic code.
"""
from bisect import bisect_right
from dataclasses import dataclass
from fractions import Fraction


def floor_log2(value):
    value = Fraction(value)
    if value <= 0:
        raise ValueError("logarithm requires a positive value")
    e = value.numerator.bit_length() - value.denominator.bit_length()
    if e >= 0:
        return e - (value.numerator < value.denominator << e)
    return e - (value.numerator << -e < value.denominator)


def power2(e):
    return Fraction(1 << e) if e >= 0 else Fraction(1, 1 << -e)


def uniform_round(value, spacing):
    value = Fraction(value) / spacing
    q, r = divmod(value.numerator, value.denominator)
    return spacing * (q + (2*r > value.denominator or
                          (2*r == value.denominator and q % 2)))


def binary_round(value, p):
    value = Fraction(value)
    if not value:
        return Fraction(0)
    if value < 0:
        return -binary_round(-value, p)
    return uniform_round(value, power2(floor_log2(value) - p + 1))


@dataclass(frozen=True)
class Piece:
    start: int
    stop: int
    anchor: int
    step_exponent: int
    first: int
    second: int

    def evaluate(self, index):
        if not self.start <= index < self.stop:
            raise IndexError(index)
        height = 1 << self.step_exponent
        period = height // 2
        q, residue = divmod(index - self.start, period)
        return self.anchor + 2*height*q + height*(
            (residue >= self.first) + (residue >= self.second))


class StaircaseSummary:
    def __init__(self, p, k):
        if not isinstance(p, int) or not isinstance(k, int) or p < 6 or k < 2:
            raise ValueError("require integer p>=6 and K>=2")
        self.p, self.k = p, k
        self.r = 1 << p
        self.low, self.high = self.r // 2, (1 << (k-1))*self.r
        self.length = self.r // 16 - 2
        self.first_input = self.low + 8
        self.pieces = [Piece(0, self.length, self.first_input, 1, 1, 1)]
        self.starts = [0]
        self.steps = 0
        self.counts = dict(boundary_probes=0, canonical_probes=0, updates=0)

    def evaluate_index(self, index):
        if not isinstance(index, int) or not 0 <= index < self.length:
            raise IndexError(index)
        return self.pieces[bisect_right(self.starts, index)-1].evaluate(index)

    def evaluate(self, x):
        delta = x - self.first_input
        if not isinstance(delta, int) or delta % 4:
            raise ValueError("query is outside the public grid")
        return self.evaluate_index(delta // 4)

    def append(self, operand):
        operand = Fraction(operand)
        if binary_round(operand, self.p) != operand:
            raise ValueError("operand is not representable at this precision")
        endpoint_outputs = [binary_round(self.evaluate_index(i)+operand, self.p)
                            for i in (0, self.length-1)]
        if not all(self.low <= y < self.high for y in endpoint_outputs):
            raise ValueError("rounded-state corridor violated")
        # Mutate state only after the full replacement has been constructed.
        counters = dict(self.counts)
        cuts = set(self.starts)
        cuts.add(self.length)
        for e in range(self.k-1):
            boundary = self.r << e
            left, right = 0, self.length
            while left < right:
                middle = (left+right)//2
                counters['boundary_probes'] += 1
                if self.evaluate_index(middle)+operand >= boundary:
                    right = middle
                else:
                    left = middle+1
            cuts.add(left)
        cuts = sorted(cuts)
        replacement = []
        for start, stop in zip(cuts, cuts[1:]):
            parent = self.pieces[bisect_right(self.starts, start)-1]
            assert stop <= parent.stop
            first_exact = Fraction(parent.evaluate(start)) + operand
            e = max(0, floor_log2(first_exact) - self.p + 1)
            h = 1 << e
            maximum = max(parent.step_exponent, e)
            height = 1 << maximum
            period = height // 2
            size = min(period, stop-start)

            def local(index):
                counters['canonical_probes'] += 1
                result = uniform_round(parent.evaluate(start+index)+operand, h)
                assert result.denominator == 1
                return int(result)

            anchor = local(0)
            thresholds = []
            for target in (anchor+height, anchor+2*height):
                left, right = 0, size
                while left < right:
                    middle = (left+right)//2
                    if local(middle) >= target:
                        right = middle
                    else:
                        left = middle+1
                thresholds.append(left)
            assert 1 <= thresholds[0] <= thresholds[1] <= size
            replacement.append(Piece(start, stop, anchor, maximum, *thresholds))
        assert len(replacement) <= min(self.length, 1+(self.k-1)*(self.steps+1))
        counters['updates'] += len(replacement)
        self.pieces = replacement
        self.starts = [piece.start for piece in replacement]
        self.steps += 1
        self.counts = counters

    def descriptor(self):
        return dict(p=self.p, k=self.k, length=self.length, steps=self.steps,
                    pieces=[vars(piece) for piece in self.pieces],
                    abstract_operation_counts=self.counts)
