"""Exact operand-free composition of the existing whole-format indices.

All arithmetic is integer arithmetic in subnormal-ulp units.  The imported
2026-11-07 reference is read-only.  merge(a,b) represents b(a(x)), including
absorbing infinities; it never receives or recovers either operand list.
Operation bounds below count arbitrary-width integer operations abstractly.
"""
from math import ceil, floor
from pathlib import Path
import sys

REFERENCE = Path(__file__).resolve().parents[2] / 'extensions/strengthening_2026_11_07/independent_math'
sys.path.insert(0, str(REFERENCE))
from full_format_reference import BinaryFormat, FullFormatSummary, FullPiece, NEG_INF, POS_INF


def ceil_div(a, b):
    return -((-a) // b)


def at_least2(value, target2):
    if value == NEG_INF:
        return False
    if value == POS_INF:
        return True
    return 2 * value >= target2


def inverse2(piece, target2):
    """First global rank in this piece with 2*f(rank)>=target2; stop if none.

    target2 may be odd.  Coincident and clipped thresholds are supported.
    No evaluation outside the record's domain is performed.
    """
    if piece.anchor == NEG_INF:
        return piece.stop
    if piece.anchor == POS_INF or target2 <= 2 * piece.anchor:
        return piece.start
    k = ceil_div(target2 - 2 * piece.anchor, piece.twice_height)
    q, residue = divmod(k - 1, 2)
    threshold = piece.first if residue == 0 else piece.second
    period = piece.twice_height // piece.input_spacing
    return min(piece.stop, piece.start + q * period + threshold)


def piece_input_origins(summary):
    """Numerical input at each piece start, by one sweep of initial binades."""
    origins = []
    j = 0
    for piece in summary.pieces:
        while piece.start >= summary.fmt.regions[j][1]:
            j += 1
        start, stop, first, spacing = summary.fmt.regions[j]
        assert piece.stop <= stop and piece.input_spacing == spacing
        origins.append(first + (piece.start - start) * spacing)
    return origins


def preimages(summary, targets2):
    """Sorted lower-bound ranks for sorted numerical thresholds, in O(q+t)."""
    cuts = []
    j = 0
    for target2 in targets2:
        while j < len(summary.pieces) and not at_least2(
                summary.pieces[j].at(summary.pieces[j].stop - 1), target2):
            j += 1
        cuts.append(summary.fmt.length if j == len(summary.pieces)
                    else inverse2(summary.pieces[j], target2))
    return cuts


def global_inverse2(summary, target2, strict=False):
    """First finite input rank with output >= (or >) target2/2, in O(log q).

    target2 is the finite doubled target in subnormal-ulp units. Use an
    exact rational for a nonintegral target that must be represented exactly.
    Doubled finite outputs are integers, so the search compares them with
    the least integer satisfying the requested inequality.
    """
    effective = floor(target2) + 1 if strict else ceil(target2)
    lo, hi = 0, len(summary.pieces)
    while lo < hi:
        mid = (lo+hi)//2
        piece = summary.pieces[mid]
        if at_least2(piece.at(piece.stop-1), effective):
            hi = mid
        else:
            lo = mid+1
    return summary.fmt.length if lo == len(summary.pieces) else inverse2(summary.pieces[lo], effective)


def preimage_interval2(summary, lower2, upper2):
    """Half-open rank interval of inputs with output in [lower2/2,upper2/2]."""
    if lower2 > upper2:
        raise ValueError('interval endpoints are reversed')
    return global_inverse2(summary, lower2), global_inverse2(summary, upper2, strict=True)


def sorted_union(left, right):
    out = []
    i = j = 0
    while i < len(left) or j < len(right):
        if j == len(right) or (i < len(left) and left[i] <= right[j]):
            x = left[i]
            i += 1
        else:
            x = right[j]
            j += 1
        if not out or x != out[-1]:
            out.append(x)
    return out


def from_pieces(fmt, pieces, steps):
    result = FullFormatSummary.__new__(FullFormatSummary)
    result.fmt = fmt
    result.pieces = pieces
    result.starts = [p.start for p in pieces]
    result.steps = steps
    return result


def merge(left, right):
    """Compose independently built indices, using O(q_left+q_right) work.

    The records retain the original input-progression boundaries.  Numeric
    signed zeros are identified.  Each index uses the same p,E and scaled
    units.  Semantic associativity is promised; serialized records need not
    be canonical or byte-identical under different parenthesizations.
    """
    if (left.fmt.p, left.fmt.e) != (right.fmt.p, right.fmt.e):
        raise ValueError('indices must use the same numerical format')
    origins = piece_input_origins(right)
    pulled = preimages(left, [2*x for x in origins[1:]])
    cuts = sorted_union(left.starts + [left.fmt.length], pulled)
    output = []
    ai = bi = 0
    for start, stop in zip(cuts, cuts[1:]):
        while start >= left.pieces[ai].stop:
            ai += 1
        a = left.pieces[ai]
        assert stop <= a.stop
        y = a.at(start)
        if y in (NEG_INF, POS_INF):
            output.append(FullPiece(start, stop, a.input_spacing, y, 1, 1, 1))
            continue
        while bi + 1 < len(right.pieces) and y >= origins[bi + 1]:
            bi += 1
        b = right.pieces[bi]
        offset, remainder = divmod(y - origins[bi], b.input_spacing)
        assert remainder == 0 and 0 <= offset < b.stop - b.start
        anchor = b.at(b.start + offset)
        if anchor in (NEG_INF, POS_INF):
            output.append(FullPiece(start, stop, a.input_spacing, anchor, 1, 1, 1))
            continue
        twice_height = max(a.twice_height, b.twice_height)
        period = twice_height // a.input_spacing
        assert period > 0 and twice_height % a.input_spacing == 0
        horizon = min(period, stop - start)
        thresholds = []
        for j in (1, 2):
            g_cut = inverse2(b, 2*anchor + j*twice_height)
            if g_cut == b.stop:
                threshold = horizon
            else:
                y_cut = origins[bi] + b.input_spacing * (g_cut - b.start)
                f_cut = inverse2(a, 2*y_cut)
                threshold = min(horizon, max(0, f_cut - start))
            thresholds.append(threshold)
        assert 1 <= thresholds[0] <= thresholds[1] <= horizon
        output.append(FullPiece(start, stop, a.input_spacing, anchor,
                                twice_height, *thresholds))
    assert len(output) <= min(left.fmt.length, len(left.pieces)+len(right.pieces)-1)
    return from_pieces(left.fmt, output, left.steps + right.steps)


def singleton(p, e, operand):
    """Build a one-addition index in O(E) abstract operations, without a table."""
    identity = FullFormatSummary(p, e)
    fmt = identity.fmt
    if not fmt.finite(operand):
        raise ValueError('operand must be finite and representable')
    # Strict lower-tail cut includes the tie in -infinity. Since all scaled
    # values are integers, >T is equivalent to >=T+1 in doubled units.
    thresholds2 = [-fmt.twice_overflow - 2*operand + 1]
    thresholds2 += [2*b - 2*operand for b in fmt.uniform_boundaries]
    thresholds2 += [fmt.twice_overflow - 2*operand]
    cuts = sorted_union(identity.starts+[fmt.length], preimages(identity, thresholds2))
    origins = piece_input_origins(identity)
    output = []
    ai = region = 0
    for start, stop in zip(cuts, cuts[1:]):
        while start >= identity.pieces[ai].stop:
            ai += 1
        a = identity.pieces[ai]
        z = origins[ai] + (start-a.start)*a.input_spacing + operand
        anchor = fmt.round(z)
        if anchor in (NEG_INF, POS_INF):
            output.append(FullPiece(start, stop, a.input_spacing, anchor, 1, 1, 1))
            continue
        while region < len(fmt.uniform_boundaries) and z >= fmt.uniform_boundaries[region]:
            region += 1
        h = 1 << abs(region-(e-1))
        twice_height = max(a.input_spacing, 2*h)
        horizon = min(stop-start, twice_height//a.input_spacing)
        ts = []
        for j in (1, 2):
            # First h-lattice output >= the requested level.
            k = ceil_div(2*anchor+j*twice_height, 2*h)
            cut2 = h*(2*k-1)
            if k % 2 == 0:
                t = ceil_div(cut2 - 2*z, 2*a.input_spacing)
            else:
                t = (cut2 - 2*z)//(2*a.input_spacing) + 1
            ts.append(min(horizon, max(0, t)))
        assert 1 <= ts[0] <= ts[1] <= horizon
        output.append(FullPiece(start, stop, a.input_spacing, anchor, twice_height, *ts))
    assert len(output) <= min(fmt.length, 4*e+1)
    return from_pieces(fmt, output, 1)


def balanced(p, e, operands):
    """O(E*m*log(m+1)) abstract-work construction; empty block is identity."""
    level = [singleton(p, e, a) for a in operands]
    if not level:
        return FullFormatSummary(p, e)
    while len(level) > 1:
        level = [merge(level[i], level[i+1]) if i+1 < len(level) else level[i]
                 for i in range(0, len(level), 2)]
    return level[0]
