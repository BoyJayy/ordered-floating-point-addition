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
 (or (not (>= x t)) false))
(assert
 (let ((?x194 (- x 0)))
(let (($x27 (>= x t)))
(let ((?x198 (ite $x27 ?x194 ?x194)))
(let ((?x274 (- (+ R 4) t)))
(let ((?x220 (+ (- (+ ?x194 ?x274) (mod (+ ?x194 ?x274) 2)) (ite (= (mod (+ ?x194 ?x274) 4) 3) 2 0))))
(let ((?x195 (+ ?x194 ?x274)))
(let ((?x221 (ite (<= ?x195 R) ?x195 ?x220)))
(let ((?x184 (- ?x221 ?x274)))
(let (($x190 (and (>= ?x274 1) (< ?x274 R) (> ?x195 0) (< ?x195 (* 2 R)) (> ?x221 0) (< ?x221 (* 2 R)) (>= ?x184 7) (< ?x184 R) (= ?x184 ?x198))))
(not $x190)))))))))))
(check-sat)
