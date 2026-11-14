#!/usr/bin/env python3
"""Untimed logical tree inventory, and exact expected outputs for saved inputs.

Counts are tree nodes/pieces, not allocator memory. Singleton internals and
merge scratch arrays are excluded; tracemalloc measures allocation separately.
"""
import json
from pathlib import Path
import sys

HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE.parent/'math'))
from merge_indices import singleton, merge


def trace(p,e,operands):
    stack=[]
    events=[]
    peak_nodes=peak_pieces=0
    leaf_pieces=[]
    for i,a in enumerate(operands):
        size,node=1,singleton(p,e,a)
        leaf_pieces.append(len(node.pieces))
        peak_nodes=max(peak_nodes,len(stack)+1)
        peak_pieces=max(peak_pieces,sum(len(s.pieces) for _,s in stack)+len(node.pieces))
        while stack and stack[-1][0]==size:
            _,older=stack.pop()
            result=merge(older,node)
            live=sum(len(s.pieces) for _,s in stack)+len(older.pieces)+len(node.pieces)+len(result.pieces)
            peak_pieces=max(peak_pieces,live)
            events.append(dict(phase='carry',input_position=i,left_steps=older.steps,right_steps=node.steps,
                               left_pieces=len(older.pieces),right_pieces=len(node.pieces),output_pieces=len(result.pieces)))
            node=result;size*=2
        stack.append((size,node))
    _,result=stack.pop()
    while stack:
        _,older=stack.pop()
        combined=merge(older,result)
        live=sum(len(s.pieces) for _,s in stack)+len(older.pieces)+len(result.pieces)+len(combined.pieces)
        peak_pieces=max(peak_pieces,live)
        events.append(dict(phase='finish',left_steps=older.steps,right_steps=result.steps,
                           left_pieces=len(older.pieces),right_pieces=len(result.pieces),output_pieces=len(combined.pieces)))
        result=combined
    return result,dict(leaves=len(operands),merges=len(events),leaf_piece_counts=leaf_pieces,
                       materialized_all_leaf_pieces=sum(leaf_pieces),lazy_max_forest_nodes=peak_nodes,
                       lazy_peak_logical_pieces_including_merge_inputs_and_output=peak_pieces,
                       final_pieces=len(result.pieces),events=events)


def main():
    cases=json.loads((HERE/'inputs.json').read_text())
    traces=[];outputs=[]
    for case in cases:
        summary,t=trace(case['p'],case['E'],case['operands'])
        traces.append(dict(id=case['id'],**t))
        outputs.append(dict(id=case['id'],outputs=[summary.evaluate(x) for x in case['queries']]))
    (HERE/'tree_inventory.json').write_text(json.dumps(traces,indent=2)+'\n')
    (HERE/'query_outputs.json').write_text(json.dumps(outputs,indent=2)+'\n')
    print('Saved tree_inventory.json and query_outputs.json (untimed).')


if __name__=='__main__':main()
