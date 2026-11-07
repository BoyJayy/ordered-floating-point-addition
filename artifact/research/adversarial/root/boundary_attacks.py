"""Independent generic rational rounding and counterexamples to overextensions."""
from fractions import Fraction as F
import json
from pathlib import Path


def pow2(e):
    return F(1<<e) if e>=0 else F(1,1<<-e)


def rounded(x,p,away=False):
    x=F(x)
    if not x:
        return x
    sign=-1 if x<0 else 1
    x=abs(x)
    exponent=x.numerator.bit_length()-x.denominator.bit_length()
    if x<pow2(exponent):
        exponent-=1
    step=pow2(exponent-p+1)
    scaled=x/step
    q,r=divmod(scaled.numerator,scaled.denominator)
    q += 2*r>scaled.denominator or (2*r==scaled.denominator and (away or q%2))
    return sign*q*step


def fold(x,values,p,away=False):
    for a in values:
        x=rounded(F(x)+a,p,away)
    return x


def main():
    p=7; R=1<<p
    markers=list(range(R//2+8,3*R//4,4))
    output=[fold(x,[4*R],p) for x in markers]
    deviations=[int(b-a)-4 for a,b in zip(output,output[1:])]
    assert sum(d!=0 for d in deviations)>1
    assert sum(abs(d) for d in deviations)>5
    assert fold(8,[9,-9],4)==7
    assert fold(8,[9,-9],4,away=True)==9
    assert fold(8,[5,-5],4)==8
    # Rounded intermediate points can stay in the corridor while exact sums do not.
    exact=F(R//2)-F(1,4)
    assert rounded(exact,p)==R//2
    positives=[128,132,136,140,144,365,348,325,308,285]
    reordered=positives+[-a for a in positives]
    assert sum(reordered)==0 and fold(0,reordered,11)==1
    report={
        'status':'PASS: explicit counterexamples to stronger claims',
        'outside_corridor':{'precision':p,'one_addend':4*R,'markers':markers,
            'outputs':list(map(int,output)),'gap_deviations':deviations,
            'support':sum(d!=0 for d in deviations),'total_deviation':sum(abs(d) for d in deviations),
            'refutes':'support<=m and variation<=5m without the two-binade condition'},
        'wrong_tie_rule':{'precision':4,'initial':8,'block':[9,-9],
            'ties_even':7,'ties_away':9,'refutes':'same parity formula under arbitrary rounding'},
        'sum_then_round':{'blocks':[[9,-9],[5,-5]],'initial':8,
            'ordered_outputs':[7,8],'real_sum_then_round_outputs':[8,8]},
        'promise_distinction':{'R':R,'exact_sum':str(exact),'rounded_sum':R//2,
            'meaning':'rounded-state promise alone differs from exact-and-rounded promise'},
        'approximation':{'family':'outputs x or x-1','zero_message_answer':'x',
            'absolute_error_bound':1,'meaning':'exact-output lower bounds do not transfer to this tolerance'},
        'arbitrary_multiset_order':{'precision':11,'k':5,'block':reordered,
            'zero_start_output':1,'meaning':'F(0)=0 holds for the constructed slot orders, not all permutations'},
        'interaction':{'protocol':'decoder sends x to block owner; owner computes and returns F_a(x)',
            'communication':'2w bits','meaning':'one-way direction and lack of later interaction are essential'}
    }
    out=Path(__file__).with_name('boundary_attacks.json')
    out.write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps(report,indent=2))


if __name__=='__main__':
    main()
