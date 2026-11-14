"""Measured query-only cache, separate from the mathematical reference.

The baseline profile attributes 0.141/0.263 cumulative seconds to index_of:
each query first finds its input binade and then its piece. Numeric piece
origins eliminate the first bisection. Powers-of-two divmods become shifts
and masks. Public input validation is retained through BinaryFormat.finite.
This cache stores no operands; its preprocessing cost and memory are charged.
"""
from bisect import bisect_right
from merge_indices import NEG_INF, POS_INF, piece_input_origins


class NumericQueryCache:
    def __init__(self, summary):
        self.fmt = summary.fmt
        self.origins = piece_input_origins(summary)
        self.rows = []
        for piece, origin in zip(summary.pieces, self.origins):
            if piece.anchor in (NEG_INF, POS_INF):
                self.rows.append((origin, 0, piece.anchor, 0, 0, 0, 0, 0, 0))
                continue
            spacing = piece.input_spacing
            period = piece.twice_height // spacing
            assert spacing > 0 and not spacing & (spacing-1)
            assert period > 0 and not period & (period-1)
            self.rows.append((origin, spacing.bit_length()-1, piece.anchor,
                              piece.twice_height, period.bit_length()-1, period-1,
                              piece.twice_height//2, piece.first, piece.second))

    def evaluate(self, x):
        if x in (NEG_INF, POS_INF):
            return x
        if not self.fmt.finite(x):
            raise ValueError('not a finite format value')
        origin, shift, anchor, height2, period_shift, mask, half, t1, t2 = self.rows[
            bisect_right(self.origins, x)-1]
        if anchor in (NEG_INF, POS_INF):
            return anchor
        relative = (x-origin) >> shift
        quotient, residue = relative >> period_shift, relative & mask
        return anchor + height2*quotient + half*((residue >= t1)+(residue >= t2))
