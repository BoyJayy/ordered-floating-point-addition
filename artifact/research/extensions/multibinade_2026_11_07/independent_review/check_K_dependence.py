"""Separate exact check of the necessity of K-dependent upper constants.

Uses only this review's independent enumerated-format oracle. Does not run
or overwrite the main independent checker, manuscript code, or prior results.
"""
from hashlib import sha256
import json
from pathlib import Path
from check_independent import EnumeratedOracle, representable_scaled


def main():
    p, r, queries = 6, 64, (40, 44)
    checked_blocks = checked_queries = rounded_operations = 0
    records = []
    for k in range(2, 257):
        oracle = EnumeratedOracle(p, k)
        blocks = [(0, 0)] + [(r << j, 0) for j in range(k-1)]
        first_answers = []
        for block in blocks:
            a = block[0]
            assert representable_scaled(4*a, p)
            answers = []
            for x in queries:
                if a:
                    assert a+x < 2*a-a//r  # strictly below next-boundary midpoint
                state = x
                for operand in block:
                    exact4 = 4*(state+operand)
                    assert 4*oracle.lower <= exact4 < 4*oracle.upper
                    state = oracle.round(exact4)
                    assert state is not None
                    assert state in oracle.state_set
                    assert oracle.lower <= state < oracle.upper
                    rounded_operations += 1
                if a:
                    assert a <= state < 2*a
                else:
                    assert state == x
                answers.append(state)
                checked_queries += 1
            first_answers.append(answers[0])
            checked_blocks += 1
        assert len(set(first_answers)) == k
        records.append({"K":k, "distinct_maps":k,
                        "exact_bits_lower_bound":(k-1).bit_length(),
                        "first_query_answers_sha256":sha256(
                            ",".join(map(str,first_answers)).encode()).hexdigest()})
    report = {"status":"PASS", "p":p, "m":2, "X_star":list(queries),
              "K_min":2, "K_max":256, "checked_blocks":checked_blocks,
              "checked_queries":checked_queries, "rounded_operations":rounded_operations,
              "oracle":"independent enumerated-format nearest-even rounding; exact integer arithmetic",
              "result":"K distinct transfers on the full X*; hence B>=ceil(log2 K)",
              "scope":"finite check of a separately proved all-K family; not a GPU measurement",
              "records":records}
    target = Path(__file__).with_name("K_dependence_results.json")
    target.write_text(json.dumps(report,indent=2)+"\n")
    print(json.dumps({k:v for k,v in report.items() if k!="records"},indent=2))


if __name__ == "__main__":
    main()
