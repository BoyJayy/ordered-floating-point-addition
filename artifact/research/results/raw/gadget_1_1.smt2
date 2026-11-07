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
 (let ((?x62 (- x 1)))
(let (($x27 (>= x t)))
(let ((?x259 (ite $x27 (- x 0) ?x62)))
(let ((?x274 (- (+ R 4) t)))
(let ((?x266 (+ (- (+ ?x62 ?x274) (mod (+ ?x62 ?x274) 2)) (ite (= (mod (+ ?x62 ?x274) 4) 3) 2 0))))
(let ((?x114 (+ ?x62 ?x274)))
(let ((?x254 (ite (<= ?x114 R) ?x114 ?x266)))
(let ((?x281 (- ?x254 ?x274)))
(let (($x153 (and (>= ?x274 1) (< ?x274 R) (> ?x114 0) (< ?x114 (* 2 R)) (> ?x254 0) (< ?x254 (* 2 R)) (>= ?x281 7) (< ?x281 R) (= ?x281 ?x259))))
(not $x153)))))))))))
(check-sat)
