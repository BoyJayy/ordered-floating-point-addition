"""Independent arithmetic oracle: native Python binary64 and binary32 storage.

No imported rounding oracle is used for the expected result. Binary32 addition
uses a binary64 sum followed by struct.pack('f'); two binary32 inputs have
sufficient guard precision here. Signed zeros are compared numerically.
Not a speed benchmark and not a GPU measurement.
"""
from pathlib import Path
import sys, struct, math, random, json, hashlib, platform
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'math'))
from merge_indices import balanced, merge, FullFormatSummary

def decode(bits, width):
    return struct.unpack('>f' if width==32 else '>d',bits.to_bytes(width//8,'big'))[0]

def rn32(x):
    try: return struct.unpack('>f',struct.pack('>f',x))[0]
    except OverflowError: return math.copysign(math.inf,x)

def scaled(x, shift):
    if math.isinf(x): return '+inf' if x>0 else '-inf'
    n,d=x.as_integer_ratio()
    q,r=divmod(n<<shift,d)
    assert r==0
    return q

def direct(x, operands, width):
    for a in operands:
        x=x+a
        if width==32: x=rn32(x)
    return x

def run():
    rng=random.Random(2026111403)
    all_cases=[]
    for width,p,E,shift,fbits in [(32,24,254,149,23),(64,53,2046,1074,52)]:
        maxbits=((E+1)<<fbits)-1
        vmax=decode(maxbits,width)
        tiny=decode(1,width)
        qnan_exp=(E+1)<<fbits
        def randfinite():
            while True:
                b=rng.getrandbits(width)
                if b&qnan_exp != qnan_exp: return decode(b,width)
        blocks=[[],[0.0],[vmax],[vmax,-vmax],[-vmax,vmax],
                [tiny,-tiny,2*tiny,-2*tiny], [float(2**p),1.0,-float(2**p)],
                [1.5,-1.5], [randfinite() for _ in range(17)],
                [randfinite() for _ in range(33)]]
        queries=[0.,-0.,tiny,-tiny,vmax,-vmax]+[randfinite() for _ in range(500)]
        for exp in range(E+1):
            for mant in [0,1,(1<<fbits)-1]:
                x=decode((exp<<fbits)|mant,width)
                queries += [x,-x]
        for block in blocks:
            ops=[scaled(a,shift) for a in block]
            sm=balanced(p,E,ops)
            cut=max(0,len(block)-1)
            joined=merge(balanced(p,E,ops[:cut]),balanced(p,E,ops[cut:]))
            for x in queries:
                sx=scaled(x,shift)
                expected=scaled(direct(x,block,width),shift)
                assert sm.evaluate(sx)==expected,(width,block,x,sm.evaluate(sx),expected)
                assert joined.evaluate(sx)==expected,(width,block,x,'split')
            all_cases.append({'width':width,'length':len(block),'queries':len(queries),
                              'pieces':len(sm.pieces),'split_pieces':len(joined.pieces)})
    # Independent native check of the restricted-grid obstruction, at p=24.
    x=float(2**23+8)
    assert direct(x,[1.5,-1.5],32)==x
    assert direct(x,[1.,1.5,-1.5],32)==x
    assert direct(x,[1.,0.,0.],32)==x+1
    return {'status':'PASS','seed':2026111403,'host':platform.platform(),
            'python':sys.version,'float_rounds':sys.float_info.rounds,
            'cases':all_cases,'numeric_comparisons':sum(2*c['queries'] for c in all_cases),
            'restricted_grid_cpu_counterexample':{'x':x,'B_after_A':x,'C_after_A':x+1},
            'limits':['native CPU arithmetic, not GPU','binary32 uses binary64 addition then struct storage',
                      'signed zero numerically identified','no NaN inputs or infinite operands',
                      'sampled standard formats, not exhaustive binary32 or binary64'],
            'sha256':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in
                       [Path(__file__),Path(__file__).resolve().parents[1]/'math/merge_indices.py']}}

if __name__=='__main__':
    r=run()
    Path(__file__).with_name('native_cpu_results.json').write_text(json.dumps(r,indent=2)+'\n')
    print(json.dumps({k:r[k] for k in ['status','numeric_comparisons','restricted_grid_cpu_counterexample','limits']},indent=2))
