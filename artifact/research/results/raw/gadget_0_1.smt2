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
 (let ((?x43 (- x 1)))
(let (($x27 (>= x t)))
(let ((?x200 (ite $x27 ?x43 ?x43)))
(let ((?x26 (- (+ R 1) t)))
(let ((?x207 (+ (- (+ ?x43 ?x26) (mod (+ ?x43 ?x26) 2)) (ite (= (mod (+ ?x43 ?x26) 4) 3) 2 0))))
(let ((?x234 (+ ?x43 ?x26)))
(let ((?x208 (ite (<= ?x234 R) ?x234 ?x207)))
(let ((?x199 (- ?x208 ?x26)))
(let (($x269 (and (>= ?x26 1) (< ?x26 R) (> ?x234 0) (< ?x234 (* 2 R)) (> ?x208 0) (< ?x208 (* 2 R)) (>= ?x199 7) (< ?x199 R) (= ?x199 ?x200))))
(not $x269)))))))))))
(check-sat)
