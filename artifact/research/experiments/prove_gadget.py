"""Unbounded integer SMT proof of the exact rounding gadget's local lemmas.

This proves all multiples R of 4 under the stated binade semantics. The link
from binary p-bit round-to-nearest to this local integer model is a separate
mathematical lemma. No claim of a Lean/Coq-checked whole theorem is made.
"""

import json
from pathlib import Path
import z3


def main():
    R, x, t = z3.Ints("R x t")
    assumptions = [R >= 16, R % 4 == 0, x >= 8, x <= R - 4,
                   t >= 8, t <= R - 4, x % 4 == 0, t % 4 == 0]

    def rn_integer(u):
        # On [0,R] every integer is representable. On [R,2R), spacing is 2.
        return z3.If(u <= R, u, u - u % 2 + z3.If(u % 4 == 3, 2, 0))

    proofs = []
    for prior_selected_parity in (0, 1):
        r = R + (1 if prior_selected_parity == 0 else 4) - t
        # Unprocessed tail has the common parity; old prefix may have either.
        for previous_value_parity in (0, 1):
            active = x >= t
            state = x - previous_value_parity
            valid = z3.Or(z3.Not(active), previous_value_parity == prior_selected_parity)
            exact_sum = state + r
            rounded_sum = rn_integer(exact_sum)
            exact_difference = rounded_sum - r
            expected = z3.If(active, x - (1 - prior_selected_parity), state)
            conclusions = z3.And(r >= 1, r < R, exact_sum > 0, exact_sum < 2 * R,
                                 rounded_sum > 0, rounded_sum < 2 * R,
                                 exact_difference >= 7, exact_difference < R,
                                 exact_difference == expected)
            solver = z3.SolverFor("QF_LIA")
            solver.set(timeout=10000)
            solver.add(*assumptions, valid, z3.Not(conclusions))
            result = solver.check()
            name = f"gadget_{prior_selected_parity}_{previous_value_parity}"
            Path(__file__).resolve().parents[1].joinpath("results/raw", name + ".smt2").write_text(solver.to_smt2())
            assert result == z3.unsat, (name, result, solver.model() if result == z3.sat else "timeout")
            proofs.append(dict(lemma=name, status=str(result), domain="unbounded integers; R multiple of 4"))
    print(json.dumps(dict(z3=z3.get_version_string(), lemmas=proofs,
                          scope="local gadget arithmetic, counting and IEEE interpretation proved in prose"), indent=2))


if __name__ == "__main__":
    main()
