"""Streaming schedule for the existing exact balanced composition tree.

The materialized baseline constructs every leaf before merging. Here a stack
holds consecutive completed power-of-two prefixes and carries equal sizes as
soon as a new operand arrives. Residual blocks are reduced from the right so
that every merge has its earlier block on the left. This produces the same
tree as the materialized adjacent-pair levels, including non-power-of-two m.
It is an implementation scheduling change, not a new arithmetic theorem.
"""
from merge_indices import FullFormatSummary, singleton, merge


def lazy_balanced(p, e, operands):
    stack = []
    for operand in operands:
        size, node = 1, singleton(p, e, operand)
        while stack and stack[-1][0] == size:
            _, earlier = stack.pop()
            node = merge(earlier, node)
            size *= 2
            del earlier
        stack.append((size, node))
    if not stack:
        return FullFormatSummary(p, e)
    _, result = stack.pop()
    while stack:
        _, earlier = stack.pop()
        result = merge(earlier, result)
        del earlier
    return result
