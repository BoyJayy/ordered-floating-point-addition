; benchmark generated from python API
(set-info :status unknown)
(declare-fun R () Int)
(declare-fun x () Int)
(declare-fun t () Int)
(assert
 (>= R 16))
(assert
 (= (mod R 4) 0))
(assert
 (>= x 8))
(assert
 (let ((?x16 (- R 4)))
 (<= x ?x16)))
(assert
 (>= t 8))
(assert
 (let ((?x16 (- R 4)))
 (<= t ?x16)))
(assert
 (= (mod x 4) 0))
(assert
 (= (mod t 4) 0))
(assert
 (or (not (>= x t)) true))
(assert
 (let ((?x28 (- x 0)))
(let (($x27 (>= x t)))
(let ((?x44 (ite $x27 (- x 1) ?x28)))
(let ((?x26 (- (+ R 1) t)))
(let ((?x40 (+ (- (+ ?x28 ?x26) (mod (+ ?x28 ?x26) 2)) (ite (= (mod (+ ?x28 ?x26) 4) 3) 2 0))))
(let ((?x31 (+ ?x28 ?x26)))
(let ((?x41 (ite (<= ?x31 R) ?x31 ?x40)))
(let ((?x42 (- ?x41 ?x26)))
(let (($x56 (and (>= ?x26 1) (< ?x26 R) (> ?x31 0) (< ?x31 (* 2 R)) (> ?x41 0) (< ?x41 (* 2 R)) (>= ?x42 7) (< ?x42 R) (= ?x42 ?x44))))
(not $x56)))))))))))
(check-sat)
