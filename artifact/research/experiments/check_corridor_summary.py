"""Compare sparse construction to full tables and saved actual GPU outputs."""
from bisect import bisect_right
from fractions import Fraction
import json
from pathlib import Path
import random
import struct

from corridor_summary import SparseTransfer,OutsideCorridor,round_exact,fixed_budget


def main():
    rng = random.Random(711202608)
    small,queries,prefixes = 0,0,0
    for p in (6,8,11):
        R = 1 << p
        start,count = R//2+8,R//16-2
        for length in (1,2,4,8,16,64):
            for trial in range(8):
                summary = SparseTransfer(p,start,count)
                table = [start+4*i for i in range(count)]
                for _ in range(length):
                    for attempt in range(256):
                        addend = Fraction(rng.randint(-R,R),4)
                        try:
                            expected = [round_exact(x+addend,R) for x in table]
                        except OutsideCorridor:
                            continue
                        break
                    else:
                        raise AssertionError('fixture generation exhausted')
                    summary.push(addend)
                    assert [summary.query(i) for i in range(count)] == expected
                    table = expected
                    queries += count
                    prefixes += 1
                payload,bits = summary.pack()
                decoded = SparseTransfer.unpack(p,start,count,length,payload)
                assert [decoded.query(i) for i in range(count)] == table
                serialized=summary.serialize()
                restored=SparseTransfer.deserialize(p,start,count,length,serialized)
                assert [restored.query(i) for i in range(count)] == table
                small += 1
    # Exact corridor boundaries, tie at the upper endpoint, and rejected promises.
    for addend in (-(1 << 11),(1 << 12)):
        summary = SparseTransfer(11,1032,126)
        try:
            summary.push(addend)
        except OutsideCorridor:
            pass
        else:
            raise AssertionError('invalid corridor accepted')
    try:
        round_exact(Fraction(4095),2048)
    except OutsideCorridor:
        pass
    else:
        raise AssertionError('rounded upper endpoint accepted')
    # Exercise fixed-width padding, full coalescence, and monotone fallback.
    focused=0
    for p,start,count,block in [(4,8,2,[5,Fraction(1,2),5]),
                                 (4,8,2,[7,Fraction(1,2)]),(4,8,2,[4]),
                                 (4,8,1,[1]),(6,32,8,[0]*4096)]:
        summary=SparseTransfer(p,start,count)
        for a in block:
            summary.push(a)
        serialized=summary.serialize()
        restored=SparseTransfer.deserialize(p,start,count,len(block),serialized)
        assert all(summary.query(i)==restored.query(i) for i in range(count))
        if len(block)==4096:
            assert fixed_budget(p,count,len(block))[0]=='monotone'
        focused+=1
    # Rejected serialized inputs are distinct from valid internal codewords.
    bad=dict(first=0,q=1,positions=0,magnitudes=4,signs=1)
    try:
        SparseTransfer.unpack(4,8,2,1,bad)
    except ValueError:
        pass
    else:
        raise AssertionError('negative decoded gap accepted')

    large=[]
    for p in (24,53):
        R=1<<p
        start,count=R//2+8,R//16-2
        thresholds=sorted(start+4*i for i in rng.sample(range(count),128))
        summary=SparseTransfer(p,start,count)
        for j,t in enumerate(thresholds):
            r=R+(1 if j%2==0 else 4)-t
            summary.push(r)
            summary.push(-r)
        payload,bits=summary.pack()
        decoded=SparseTransfer.unpack(p,start,count,256,payload)
        serialized=summary.serialize()
        (Path(__file__).resolve().parents[1]/'results/raw'/f'corridor_fp{p}_summary.bin').write_bytes(serialized)
        restored=SparseTransfer.deserialize(p,start,count,256,serialized)
        indices={0,count-1,*[(t-start)//4 for t in thresholds],*[rng.randrange(count) for _ in range(512)]}
        for i in indices:
            x=start+4*i
            expected=x-bisect_right(thresholds,x)%2
            assert summary.query(i)==decoded.query(i)==restored.query(i)==expected
        large.append(dict(p=p,domain_states=count,steps=256,support=len(summary.indices),queries=len(indices),
                          payload_bits=bits,fixed_budget_bits=fixed_budget(p,count,256)[1],
                          serialized_bytes=len(serialized),rounding_evaluations=summary.rounding_evaluations))

    raw=Path(__file__).resolve().parents[1]/'results/raw'
    fixture=json.loads((raw/'factorial_inputs.json').read_text())
    data=(raw/'factorial_inputs.bin').read_bytes()
    nv,nq=struct.unpack_from('<II',data)
    values=struct.unpack_from(f'<{nv}f',data,8)
    output=struct.unpack(f'<{nq}I',(raw/'factorial_outputs.bin').read_bytes())
    summaries={}
    for block in fixture['blocks']:
        k,offset=block['k'],block['offset']
        summary=SparseTransfer(24,3*(1<<24)//4+4,k*k)
        for a in values[offset:offset+4*k]:
            summary.push(int(a))
        summaries[offset]=summary
    for i in range(nq):
        offset,length,x,expected=struct.unpack_from('<IIff',data,8+4*nv+16*i)
        summary=summaries[offset]
        actual=summary.query((int(x)-summary.start)//4)
        assert actual==expected
        assert struct.unpack('<I',struct.pack('<f',actual))[0]==output[i]
    print(json.dumps(dict(status='PASS',seed=711202608,small_blocks=small,small_prefixes=prefixes,
                          table_comparisons=queries,promise_rejections=3,large_domains=large,
                          focused_cases=focused,malformed_payload_rejections=1,
                          saved_gpu_comparisons=nq,
                          scope='exact rational sparse algorithm; full-table oracle and saved GPU output comparison; no speed measurement'),indent=2))


if __name__=='__main__':
    main()
