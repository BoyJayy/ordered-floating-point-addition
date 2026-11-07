"""Symbolic phase split: integer residues mod 4 and fractional classes.
The IEEE interpretation and global amortization are proved in prose.
"""
import json
from pathlib import Path
import z3


def main():
    records, queries = [], []
    for region in ('lower','upper','crossing'):
        for left_residue in range(4):
            for gap_residue in range(4):
                for phase in range(4):
                    b = z3.Int('gap_quotient')
                    f = z3.Real('fraction')
                    g = 4*b+gap_residue
                    half = z3.RealVal('1/2')
                    fractions = (f==0,z3.And(f>0,f<half),f==half,z3.And(f>half,f<1))
                    def correction(residue, high):
                        if high:
                            if residue%2 == 0:
                                return z3.IntVal(0)
                            return z3.If(z3.And(f==0,residue==1),-1,1)
                        return z3.If(f<half,0,z3.If(f>half,1,residue%2))
                    left = correction(left_residue,region=='upper')
                    right = correction((left_residue+gap_residue)%4,region!='lower')
                    h = g+right-left
                    def potential(value):
                        return z3.If(value%2==1,2,z3.If(value%4==2,1,0))
                    statement = (z3.And(h>=0,h-g>=-1,h-g<=1) if region=='crossing' else
                                 z3.And(h>=0,h-g>=-2,h-g<=2,
                                        z3.Implies(h!=g,potential(h)<potential(g))))
                    solver = z3.Solver()
                    solver.set(timeout=10000)
                    solver.add(b>=0,fractions[phase],g>0 if region=='crossing' else g>=0,z3.Not(statement))
                    name = f'{region}_{left_residue}_{gap_residue}_{phase}'
                    result = solver.check()
                    queries.append('; '+name+'\n(reset)\n'+solver.to_smt2())
                    assert result == z3.unsat,(name,str(result),str(solver.model()) if result==z3.sat else solver.reason_unknown())
                    records.append(dict(name=name,status=str(result)))
    raw=Path(__file__).resolve().parents[1]/'results/raw'
    (raw/'gap_phase_proofs.smt2').write_text('\n'.join(queries))
    print(json.dumps(dict(z3=z3.get_version_string(),scope='local phase cases with unbounded integer gaps; IEEE bridge and global proof in prose',lemmas=records),indent=2))


if __name__ == '__main__':
    main()
