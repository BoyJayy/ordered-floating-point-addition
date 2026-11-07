; lower_0_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x10 (+ ?x8 0)))
 (>= ?x10 0))))
(assert
 (let ((?x44 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x45 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x44)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x26 (- (+ (+ (* 4 gap_quotient) 0) ?x24) ?x24)))
(let ((?x38 (ite (= (mod ?x26 4) 2) 1 0)))
(let (($x47 (=> (and (distinct ?x26 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x26 2) 1) 2 ?x38) ?x45))))
(let (($x48 (and (>= ?x26 0) (>= (- ?x26 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x26 (+ (* 4 gap_quotient) 0)) 2) $x47)))
(not $x48))))))))))
(check-sat)

; lower_0_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x10 (+ ?x8 0)))
 (>= ?x10 0))))
(assert
 (let ((?x44 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x45 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x44)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x26 (- (+ (+ (* 4 gap_quotient) 0) ?x24) ?x24)))
(let ((?x38 (ite (= (mod ?x26 4) 2) 1 0)))
(let (($x47 (=> (and (distinct ?x26 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x26 2) 1) 2 ?x38) ?x45))))
(let (($x48 (and (>= ?x26 0) (>= (- ?x26 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x26 (+ (* 4 gap_quotient) 0)) 2) $x47)))
(not $x48))))))))))
(check-sat)

; lower_0_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x10 (+ ?x8 0)))
 (>= ?x10 0))))
(assert
 (let ((?x44 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x45 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x44)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x26 (- (+ (+ (* 4 gap_quotient) 0) ?x24) ?x24)))
(let ((?x38 (ite (= (mod ?x26 4) 2) 1 0)))
(let (($x47 (=> (and (distinct ?x26 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x26 2) 1) 2 ?x38) ?x45))))
(let (($x48 (and (>= ?x26 0) (>= (- ?x26 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x26 (+ (* 4 gap_quotient) 0)) 2) $x47)))
(not $x48))))))))))
(check-sat)

; lower_0_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x10 (+ ?x8 0)))
 (>= ?x10 0))))
(assert
 (let ((?x44 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x45 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x44)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x26 (- (+ (+ (* 4 gap_quotient) 0) ?x24) ?x24)))
(let ((?x38 (ite (= (mod ?x26 4) 2) 1 0)))
(let (($x47 (=> (and (distinct ?x26 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x26 2) 1) 2 ?x38) ?x45))))
(let (($x48 (and (>= ?x26 0) (>= (- ?x26 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x26 (+ (* 4 gap_quotient) 0)) 2) $x47)))
(not $x48))))))))))
(check-sat)

; lower_0_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x94 (+ ?x8 1)))
 (>= ?x94 0))))
(assert
 (let ((?x113 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x114 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x113)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x89 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x94 (+ ?x8 1)))
(let ((?x97 (- (+ ?x94 ?x89) ?x24)))
(let ((?x108 (ite (= (mod ?x97 2) 1) 2 (ite (= (mod ?x97 4) 2) 1 0))))
(let (($x117 (and (>= ?x97 0) (>= (- ?x97 ?x94) (- 2)) (<= (- ?x97 ?x94) 2) (=> (and (distinct ?x97 ?x94) true) (< ?x108 ?x114)))))
(not $x117))))))))))))
(check-sat)

; lower_0_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x94 (+ ?x8 1)))
 (>= ?x94 0))))
(assert
 (let ((?x113 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x114 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x113)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x89 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x94 (+ ?x8 1)))
(let ((?x97 (- (+ ?x94 ?x89) ?x24)))
(let ((?x108 (ite (= (mod ?x97 2) 1) 2 (ite (= (mod ?x97 4) 2) 1 0))))
(let (($x117 (and (>= ?x97 0) (>= (- ?x97 ?x94) (- 2)) (<= (- ?x97 ?x94) 2) (=> (and (distinct ?x97 ?x94) true) (< ?x108 ?x114)))))
(not $x117))))))))))))
(check-sat)

; lower_0_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x94 (+ ?x8 1)))
 (>= ?x94 0))))
(assert
 (let ((?x113 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x114 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x113)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x89 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x94 (+ ?x8 1)))
(let ((?x97 (- (+ ?x94 ?x89) ?x24)))
(let ((?x108 (ite (= (mod ?x97 2) 1) 2 (ite (= (mod ?x97 4) 2) 1 0))))
(let (($x117 (and (>= ?x97 0) (>= (- ?x97 ?x94) (- 2)) (<= (- ?x97 ?x94) 2) (=> (and (distinct ?x97 ?x94) true) (< ?x108 ?x114)))))
(not $x117))))))))))))
(check-sat)

; lower_0_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x94 (+ ?x8 1)))
 (>= ?x94 0))))
(assert
 (let ((?x113 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x114 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x113)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x89 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x94 (+ ?x8 1)))
(let ((?x97 (- (+ ?x94 ?x89) ?x24)))
(let ((?x108 (ite (= (mod ?x97 2) 1) 2 (ite (= (mod ?x97 4) 2) 1 0))))
(let (($x117 (and (>= ?x97 0) (>= (- ?x97 ?x94) (- 2)) (<= (- ?x97 ?x94) 2) (=> (and (distinct ?x97 ?x94) true) (< ?x108 ?x114)))))
(not $x117))))))))))))
(check-sat)

; lower_0_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x148 (+ ?x8 2)))
 (>= ?x148 0))))
(assert
 (let ((?x133 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x138 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x133)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x128 (- (+ (+ (* 4 gap_quotient) 2) ?x24) ?x24)))
(let ((?x135 (ite (= (mod ?x128 4) 2) 1 0)))
(let (($x131 (=> (and (distinct ?x128 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x128 2) 1) 2 ?x135) ?x138))))
(let (($x142 (and (>= ?x128 0) (>= (- ?x128 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x128 (+ (* 4 gap_quotient) 2)) 2) $x131)))
(not $x142))))))))))
(check-sat)

; lower_0_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x148 (+ ?x8 2)))
 (>= ?x148 0))))
(assert
 (let ((?x133 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x138 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x133)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x128 (- (+ (+ (* 4 gap_quotient) 2) ?x24) ?x24)))
(let ((?x135 (ite (= (mod ?x128 4) 2) 1 0)))
(let (($x131 (=> (and (distinct ?x128 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x128 2) 1) 2 ?x135) ?x138))))
(let (($x142 (and (>= ?x128 0) (>= (- ?x128 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x128 (+ (* 4 gap_quotient) 2)) 2) $x131)))
(not $x142))))))))))
(check-sat)

; lower_0_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x148 (+ ?x8 2)))
 (>= ?x148 0))))
(assert
 (let ((?x133 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x138 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x133)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x128 (- (+ (+ (* 4 gap_quotient) 2) ?x24) ?x24)))
(let ((?x135 (ite (= (mod ?x128 4) 2) 1 0)))
(let (($x131 (=> (and (distinct ?x128 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x128 2) 1) 2 ?x135) ?x138))))
(let (($x142 (and (>= ?x128 0) (>= (- ?x128 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x128 (+ (* 4 gap_quotient) 2)) 2) $x131)))
(not $x142))))))))))
(check-sat)

; lower_0_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x148 (+ ?x8 2)))
 (>= ?x148 0))))
(assert
 (let ((?x133 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x138 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x133)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x128 (- (+ (+ (* 4 gap_quotient) 2) ?x24) ?x24)))
(let ((?x135 (ite (= (mod ?x128 4) 2) 1 0)))
(let (($x131 (=> (and (distinct ?x128 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x128 2) 1) 2 ?x135) ?x138))))
(let (($x142 (and (>= ?x128 0) (>= (- ?x128 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x128 (+ (* 4 gap_quotient) 2)) 2) $x131)))
(not $x142))))))))))
(check-sat)

; lower_0_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x61 (+ ?x8 3)))
 (>= ?x61 0))))
(assert
 (let ((?x93 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x86 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x93)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x61 (+ ?x8 3)))
(let ((?x91 (- (+ ?x61 ?x137) ?x24)))
(let ((?x49 (ite (= (mod ?x91 2) 1) 2 (ite (= (mod ?x91 4) 2) 1 0))))
(let (($x124 (and (>= ?x91 0) (>= (- ?x91 ?x61) (- 2)) (<= (- ?x91 ?x61) 2) (=> (and (distinct ?x91 ?x61) true) (< ?x49 ?x86)))))
(not $x124))))))))))))
(check-sat)

; lower_0_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x61 (+ ?x8 3)))
 (>= ?x61 0))))
(assert
 (let ((?x93 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x86 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x93)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x61 (+ ?x8 3)))
(let ((?x91 (- (+ ?x61 ?x137) ?x24)))
(let ((?x49 (ite (= (mod ?x91 2) 1) 2 (ite (= (mod ?x91 4) 2) 1 0))))
(let (($x124 (and (>= ?x91 0) (>= (- ?x91 ?x61) (- 2)) (<= (- ?x91 ?x61) 2) (=> (and (distinct ?x91 ?x61) true) (< ?x49 ?x86)))))
(not $x124))))))))))))
(check-sat)

; lower_0_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x61 (+ ?x8 3)))
 (>= ?x61 0))))
(assert
 (let ((?x93 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x86 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x93)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x61 (+ ?x8 3)))
(let ((?x91 (- (+ ?x61 ?x137) ?x24)))
(let ((?x49 (ite (= (mod ?x91 2) 1) 2 (ite (= (mod ?x91 4) 2) 1 0))))
(let (($x124 (and (>= ?x91 0) (>= (- ?x91 ?x61) (- 2)) (<= (- ?x91 ?x61) 2) (=> (and (distinct ?x91 ?x61) true) (< ?x49 ?x86)))))
(not $x124))))))))))))
(check-sat)

; lower_0_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x61 (+ ?x8 3)))
 (>= ?x61 0))))
(assert
 (let ((?x93 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x86 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x93)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x24 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x61 (+ ?x8 3)))
(let ((?x91 (- (+ ?x61 ?x137) ?x24)))
(let ((?x49 (ite (= (mod ?x91 2) 1) 2 (ite (= (mod ?x91 4) 2) 1 0))))
(let (($x124 (and (>= ?x91 0) (>= (- ?x91 ?x61) (- 2)) (<= (- ?x91 ?x61) 2) (=> (and (distinct ?x91 ?x61) true) (< ?x49 ?x86)))))
(not $x124))))))))))))
(check-sat)

; lower_1_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x10 (+ ?x8 0)))
 (>= ?x10 0))))
(assert
 (let ((?x165 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x166 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x165)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x62 (- (+ (+ (* 4 gap_quotient) 0) ?x137) ?x137)))
(let ((?x125 (ite (= (mod ?x62 4) 2) 1 0)))
(let (($x132 (=> (and (distinct ?x62 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x62 2) 1) 2 ?x125) ?x166))))
(let (($x41 (and (>= ?x62 0) (>= (- ?x62 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x62 (+ (* 4 gap_quotient) 0)) 2) $x132)))
(not $x41))))))))))
(check-sat)

; lower_1_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x10 (+ ?x8 0)))
 (>= ?x10 0))))
(assert
 (let ((?x165 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x166 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x165)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x62 (- (+ (+ (* 4 gap_quotient) 0) ?x137) ?x137)))
(let ((?x125 (ite (= (mod ?x62 4) 2) 1 0)))
(let (($x132 (=> (and (distinct ?x62 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x62 2) 1) 2 ?x125) ?x166))))
(let (($x41 (and (>= ?x62 0) (>= (- ?x62 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x62 (+ (* 4 gap_quotient) 0)) 2) $x132)))
(not $x41))))))))))
(check-sat)

; lower_1_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x10 (+ ?x8 0)))
 (>= ?x10 0))))
(assert
 (let ((?x165 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x166 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x165)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x62 (- (+ (+ (* 4 gap_quotient) 0) ?x137) ?x137)))
(let ((?x125 (ite (= (mod ?x62 4) 2) 1 0)))
(let (($x132 (=> (and (distinct ?x62 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x62 2) 1) 2 ?x125) ?x166))))
(let (($x41 (and (>= ?x62 0) (>= (- ?x62 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x62 (+ (* 4 gap_quotient) 0)) 2) $x132)))
(not $x41))))))))))
(check-sat)

; lower_1_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x10 (+ ?x8 0)))
 (>= ?x10 0))))
(assert
 (let ((?x165 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x166 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x165)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x62 (- (+ (+ (* 4 gap_quotient) 0) ?x137) ?x137)))
(let ((?x125 (ite (= (mod ?x62 4) 2) 1 0)))
(let (($x132 (=> (and (distinct ?x62 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x62 2) 1) 2 ?x125) ?x166))))
(let (($x41 (and (>= ?x62 0) (>= (- ?x62 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x62 (+ (* 4 gap_quotient) 0)) 2) $x132)))
(not $x41))))))))))
(check-sat)

; lower_1_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x72 (+ ?x8 1)))
 (>= ?x72 0))))
(assert
 (let ((?x162 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x126 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x162)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x72 (+ ?x8 1)))
(let ((?x59 (- (+ ?x72 ?x139) ?x137)))
(let ((?x97 (ite (= (mod ?x59 2) 1) 2 (ite (= (mod ?x59 4) 2) 1 0))))
(let (($x32 (and (>= ?x59 0) (>= (- ?x59 ?x72) (- 2)) (<= (- ?x59 ?x72) 2) (=> (and (distinct ?x59 ?x72) true) (< ?x97 ?x126)))))
(not $x32))))))))))))
(check-sat)

; lower_1_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x72 (+ ?x8 1)))
 (>= ?x72 0))))
(assert
 (let ((?x162 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x126 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x162)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x72 (+ ?x8 1)))
(let ((?x59 (- (+ ?x72 ?x139) ?x137)))
(let ((?x97 (ite (= (mod ?x59 2) 1) 2 (ite (= (mod ?x59 4) 2) 1 0))))
(let (($x32 (and (>= ?x59 0) (>= (- ?x59 ?x72) (- 2)) (<= (- ?x59 ?x72) 2) (=> (and (distinct ?x59 ?x72) true) (< ?x97 ?x126)))))
(not $x32))))))))))))
(check-sat)

; lower_1_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x72 (+ ?x8 1)))
 (>= ?x72 0))))
(assert
 (let ((?x162 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x126 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x162)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x72 (+ ?x8 1)))
(let ((?x59 (- (+ ?x72 ?x139) ?x137)))
(let ((?x97 (ite (= (mod ?x59 2) 1) 2 (ite (= (mod ?x59 4) 2) 1 0))))
(let (($x32 (and (>= ?x59 0) (>= (- ?x59 ?x72) (- 2)) (<= (- ?x59 ?x72) 2) (=> (and (distinct ?x59 ?x72) true) (< ?x97 ?x126)))))
(not $x32))))))))))))
(check-sat)

; lower_1_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x72 (+ ?x8 1)))
 (>= ?x72 0))))
(assert
 (let ((?x162 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x126 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x162)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x72 (+ ?x8 1)))
(let ((?x59 (- (+ ?x72 ?x139) ?x137)))
(let ((?x97 (ite (= (mod ?x59 2) 1) 2 (ite (= (mod ?x59 4) 2) 1 0))))
(let (($x32 (and (>= ?x59 0) (>= (- ?x59 ?x72) (- 2)) (<= (- ?x59 ?x72) 2) (=> (and (distinct ?x59 ?x72) true) (< ?x97 ?x126)))))
(not $x32))))))))))))
(check-sat)

; lower_1_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x84 (+ ?x8 2)))
 (>= ?x84 0))))
(assert
 (let ((?x146 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x57 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x146)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x157 (- (+ (+ (* 4 gap_quotient) 2) ?x137) ?x137)))
(let ((?x120 (ite (= (mod ?x157 4) 2) 1 0)))
(let (($x28 (=> (and (distinct ?x157 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x157 2) 1) 2 ?x120) ?x57))))
(let (($x37 (and (>= ?x157 0) (>= (- ?x157 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x157 (+ (* 4 gap_quotient) 2)) 2) $x28)))
(not $x37))))))))))
(check-sat)

; lower_1_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x84 (+ ?x8 2)))
 (>= ?x84 0))))
(assert
 (let ((?x146 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x57 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x146)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x157 (- (+ (+ (* 4 gap_quotient) 2) ?x137) ?x137)))
(let ((?x120 (ite (= (mod ?x157 4) 2) 1 0)))
(let (($x28 (=> (and (distinct ?x157 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x157 2) 1) 2 ?x120) ?x57))))
(let (($x37 (and (>= ?x157 0) (>= (- ?x157 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x157 (+ (* 4 gap_quotient) 2)) 2) $x28)))
(not $x37))))))))))
(check-sat)

; lower_1_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x84 (+ ?x8 2)))
 (>= ?x84 0))))
(assert
 (let ((?x146 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x57 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x146)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x157 (- (+ (+ (* 4 gap_quotient) 2) ?x137) ?x137)))
(let ((?x120 (ite (= (mod ?x157 4) 2) 1 0)))
(let (($x28 (=> (and (distinct ?x157 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x157 2) 1) 2 ?x120) ?x57))))
(let (($x37 (and (>= ?x157 0) (>= (- ?x157 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x157 (+ (* 4 gap_quotient) 2)) 2) $x28)))
(not $x37))))))))))
(check-sat)

; lower_1_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x84 (+ ?x8 2)))
 (>= ?x84 0))))
(assert
 (let ((?x146 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x57 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x146)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x157 (- (+ (+ (* 4 gap_quotient) 2) ?x137) ?x137)))
(let ((?x120 (ite (= (mod ?x157 4) 2) 1 0)))
(let (($x28 (=> (and (distinct ?x157 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x157 2) 1) 2 ?x120) ?x57))))
(let (($x37 (and (>= ?x157 0) (>= (- ?x157 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x157 (+ (* 4 gap_quotient) 2)) 2) $x28)))
(not $x37))))))))))
(check-sat)

; lower_1_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x60 (+ ?x8 3)))
 (>= ?x60 0))))
(assert
 (let ((?x105 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x67 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x105)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x60 (+ ?x8 3)))
(let ((?x61 (- (+ ?x60 ?x123) ?x137)))
(let ((?x45 (ite (= (mod ?x61 2) 1) 2 (ite (= (mod ?x61 4) 2) 1 0))))
(let (($x70 (and (>= ?x61 0) (>= (- ?x61 ?x60) (- 2)) (<= (- ?x61 ?x60) 2) (=> (and (distinct ?x61 ?x60) true) (< ?x45 ?x67)))))
(not $x70))))))))))))
(check-sat)

; lower_1_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x60 (+ ?x8 3)))
 (>= ?x60 0))))
(assert
 (let ((?x105 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x67 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x105)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x60 (+ ?x8 3)))
(let ((?x61 (- (+ ?x60 ?x123) ?x137)))
(let ((?x45 (ite (= (mod ?x61 2) 1) 2 (ite (= (mod ?x61 4) 2) 1 0))))
(let (($x70 (and (>= ?x61 0) (>= (- ?x61 ?x60) (- 2)) (<= (- ?x61 ?x60) 2) (=> (and (distinct ?x61 ?x60) true) (< ?x45 ?x67)))))
(not $x70))))))))))))
(check-sat)

; lower_1_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x60 (+ ?x8 3)))
 (>= ?x60 0))))
(assert
 (let ((?x105 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x67 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x105)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x60 (+ ?x8 3)))
(let ((?x61 (- (+ ?x60 ?x123) ?x137)))
(let ((?x45 (ite (= (mod ?x61 2) 1) 2 (ite (= (mod ?x61 4) 2) 1 0))))
(let (($x70 (and (>= ?x61 0) (>= (- ?x61 ?x60) (- 2)) (<= (- ?x61 ?x60) 2) (=> (and (distinct ?x61 ?x60) true) (< ?x45 ?x67)))))
(not $x70))))))))))))
(check-sat)

; lower_1_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x60 (+ ?x8 3)))
 (>= ?x60 0))))
(assert
 (let ((?x105 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x67 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x105)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x137 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x60 (+ ?x8 3)))
(let ((?x61 (- (+ ?x60 ?x123) ?x137)))
(let ((?x45 (ite (= (mod ?x61 2) 1) 2 (ite (= (mod ?x61 4) 2) 1 0))))
(let (($x70 (and (>= ?x61 0) (>= (- ?x61 ?x60) (- 2)) (<= (- ?x61 ?x60) 2) (=> (and (distinct ?x61 ?x60) true) (< ?x45 ?x67)))))
(not $x70))))))))))))
(check-sat)

; lower_2_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x151 (+ ?x8 0)))
 (>= ?x151 0))))
(assert
 (let ((?x164 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x90 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x164)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x115 (- (+ (+ (* 4 gap_quotient) 0) ?x123) ?x123)))
(let ((?x163 (ite (= (mod ?x115 4) 2) 1 0)))
(let (($x155 (=> (and (distinct ?x115 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x115 2) 1) 2 ?x163) ?x90))))
(let (($x43 (and (>= ?x115 0) (>= (- ?x115 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x115 (+ (* 4 gap_quotient) 0)) 2) $x155)))
(not $x43))))))))))
(check-sat)

; lower_2_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x151 (+ ?x8 0)))
 (>= ?x151 0))))
(assert
 (let ((?x164 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x90 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x164)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x115 (- (+ (+ (* 4 gap_quotient) 0) ?x123) ?x123)))
(let ((?x163 (ite (= (mod ?x115 4) 2) 1 0)))
(let (($x155 (=> (and (distinct ?x115 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x115 2) 1) 2 ?x163) ?x90))))
(let (($x43 (and (>= ?x115 0) (>= (- ?x115 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x115 (+ (* 4 gap_quotient) 0)) 2) $x155)))
(not $x43))))))))))
(check-sat)

; lower_2_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x151 (+ ?x8 0)))
 (>= ?x151 0))))
(assert
 (let ((?x164 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x90 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x164)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x115 (- (+ (+ (* 4 gap_quotient) 0) ?x123) ?x123)))
(let ((?x163 (ite (= (mod ?x115 4) 2) 1 0)))
(let (($x155 (=> (and (distinct ?x115 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x115 2) 1) 2 ?x163) ?x90))))
(let (($x43 (and (>= ?x115 0) (>= (- ?x115 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x115 (+ (* 4 gap_quotient) 0)) 2) $x155)))
(not $x43))))))))))
(check-sat)

; lower_2_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x151 (+ ?x8 0)))
 (>= ?x151 0))))
(assert
 (let ((?x164 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x90 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x164)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x115 (- (+ (+ (* 4 gap_quotient) 0) ?x123) ?x123)))
(let ((?x163 (ite (= (mod ?x115 4) 2) 1 0)))
(let (($x155 (=> (and (distinct ?x115 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x115 2) 1) 2 ?x163) ?x90))))
(let (($x43 (and (>= ?x115 0) (>= (- ?x115 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x115 (+ (* 4 gap_quotient) 0)) 2) $x155)))
(not $x43))))))))))
(check-sat)

; lower_2_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x42 (+ ?x8 1)))
 (>= ?x42 0))))
(assert
 (let ((?x150 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x136 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x150)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x72 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x42 (+ ?x8 1)))
(let ((?x138 (- (+ ?x42 ?x72) ?x123)))
(let ((?x158 (ite (= (mod ?x138 2) 1) 2 (ite (= (mod ?x138 4) 2) 1 0))))
(let (($x162 (and (>= ?x138 0) (>= (- ?x138 ?x42) (- 2)) (<= (- ?x138 ?x42) 2) (=> (and (distinct ?x138 ?x42) true) (< ?x158 ?x136)))))
(not $x162))))))))))))
(check-sat)

; lower_2_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x42 (+ ?x8 1)))
 (>= ?x42 0))))
(assert
 (let ((?x150 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x136 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x150)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x72 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x42 (+ ?x8 1)))
(let ((?x138 (- (+ ?x42 ?x72) ?x123)))
(let ((?x158 (ite (= (mod ?x138 2) 1) 2 (ite (= (mod ?x138 4) 2) 1 0))))
(let (($x162 (and (>= ?x138 0) (>= (- ?x138 ?x42) (- 2)) (<= (- ?x138 ?x42) 2) (=> (and (distinct ?x138 ?x42) true) (< ?x158 ?x136)))))
(not $x162))))))))))))
(check-sat)

; lower_2_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x42 (+ ?x8 1)))
 (>= ?x42 0))))
(assert
 (let ((?x150 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x136 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x150)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x72 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x42 (+ ?x8 1)))
(let ((?x138 (- (+ ?x42 ?x72) ?x123)))
(let ((?x158 (ite (= (mod ?x138 2) 1) 2 (ite (= (mod ?x138 4) 2) 1 0))))
(let (($x162 (and (>= ?x138 0) (>= (- ?x138 ?x42) (- 2)) (<= (- ?x138 ?x42) 2) (=> (and (distinct ?x138 ?x42) true) (< ?x158 ?x136)))))
(not $x162))))))))))))
(check-sat)

; lower_2_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x42 (+ ?x8 1)))
 (>= ?x42 0))))
(assert
 (let ((?x150 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x136 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x150)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x72 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x42 (+ ?x8 1)))
(let ((?x138 (- (+ ?x42 ?x72) ?x123)))
(let ((?x158 (ite (= (mod ?x138 2) 1) 2 (ite (= (mod ?x138 4) 2) 1 0))))
(let (($x162 (and (>= ?x138 0) (>= (- ?x138 ?x42) (- 2)) (<= (- ?x138 ?x42) 2) (=> (and (distinct ?x138 ?x42) true) (< ?x158 ?x136)))))
(not $x162))))))))))))
(check-sat)

; lower_2_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x96 (+ ?x8 2)))
 (>= ?x96 0))))
(assert
 (let ((?x81 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x71 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x81)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x112 (- (+ (+ (* 4 gap_quotient) 2) ?x123) ?x123)))
(let ((?x127 (ite (= (mod ?x112 4) 2) 1 0)))
(let (($x131 (=> (and (distinct ?x112 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x112 2) 1) 2 ?x127) ?x71))))
(let (($x40 (and (>= ?x112 0) (>= (- ?x112 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x112 (+ (* 4 gap_quotient) 2)) 2) $x131)))
(not $x40))))))))))
(check-sat)

; lower_2_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x96 (+ ?x8 2)))
 (>= ?x96 0))))
(assert
 (let ((?x81 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x71 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x81)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x112 (- (+ (+ (* 4 gap_quotient) 2) ?x123) ?x123)))
(let ((?x127 (ite (= (mod ?x112 4) 2) 1 0)))
(let (($x131 (=> (and (distinct ?x112 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x112 2) 1) 2 ?x127) ?x71))))
(let (($x40 (and (>= ?x112 0) (>= (- ?x112 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x112 (+ (* 4 gap_quotient) 2)) 2) $x131)))
(not $x40))))))))))
(check-sat)

; lower_2_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x96 (+ ?x8 2)))
 (>= ?x96 0))))
(assert
 (let ((?x81 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x71 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x81)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x112 (- (+ (+ (* 4 gap_quotient) 2) ?x123) ?x123)))
(let ((?x127 (ite (= (mod ?x112 4) 2) 1 0)))
(let (($x131 (=> (and (distinct ?x112 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x112 2) 1) 2 ?x127) ?x71))))
(let (($x40 (and (>= ?x112 0) (>= (- ?x112 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x112 (+ (* 4 gap_quotient) 2)) 2) $x131)))
(not $x40))))))))))
(check-sat)

; lower_2_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x96 (+ ?x8 2)))
 (>= ?x96 0))))
(assert
 (let ((?x81 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x71 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x81)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x112 (- (+ (+ (* 4 gap_quotient) 2) ?x123) ?x123)))
(let ((?x127 (ite (= (mod ?x112 4) 2) 1 0)))
(let (($x131 (=> (and (distinct ?x112 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x112 2) 1) 2 ?x127) ?x71))))
(let (($x40 (and (>= ?x112 0) (>= (- ?x112 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x112 (+ (* 4 gap_quotient) 2)) 2) $x131)))
(not $x40))))))))))
(check-sat)

; lower_2_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x145 (+ ?x8 3)))
 (>= ?x145 0))))
(assert
 (let ((?x107 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x149 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x107)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x145 (+ ?x8 3)))
(let ((?x53 (- (+ ?x145 ?x156) ?x123)))
(let ((?x67 (ite (= (mod ?x53 2) 1) 2 (ite (= (mod ?x53 4) 2) 1 0))))
(let (($x24 (and (>= ?x53 0) (>= (- ?x53 ?x145) (- 2)) (<= (- ?x53 ?x145) 2) (=> (and (distinct ?x53 ?x145) true) (< ?x67 ?x149)))))
(not $x24))))))))))))
(check-sat)

; lower_2_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x145 (+ ?x8 3)))
 (>= ?x145 0))))
(assert
 (let ((?x107 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x149 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x107)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x145 (+ ?x8 3)))
(let ((?x53 (- (+ ?x145 ?x156) ?x123)))
(let ((?x67 (ite (= (mod ?x53 2) 1) 2 (ite (= (mod ?x53 4) 2) 1 0))))
(let (($x24 (and (>= ?x53 0) (>= (- ?x53 ?x145) (- 2)) (<= (- ?x53 ?x145) 2) (=> (and (distinct ?x53 ?x145) true) (< ?x67 ?x149)))))
(not $x24))))))))))))
(check-sat)

; lower_2_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x145 (+ ?x8 3)))
 (>= ?x145 0))))
(assert
 (let ((?x107 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x149 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x107)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x145 (+ ?x8 3)))
(let ((?x53 (- (+ ?x145 ?x156) ?x123)))
(let ((?x67 (ite (= (mod ?x53 2) 1) 2 (ite (= (mod ?x53 4) 2) 1 0))))
(let (($x24 (and (>= ?x53 0) (>= (- ?x53 ?x145) (- 2)) (<= (- ?x53 ?x145) 2) (=> (and (distinct ?x53 ?x145) true) (< ?x67 ?x149)))))
(not $x24))))))))))))
(check-sat)

; lower_2_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x145 (+ ?x8 3)))
 (>= ?x145 0))))
(assert
 (let ((?x107 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x149 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x107)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x123 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x145 (+ ?x8 3)))
(let ((?x53 (- (+ ?x145 ?x156) ?x123)))
(let ((?x67 (ite (= (mod ?x53 2) 1) 2 (ite (= (mod ?x53 4) 2) 1 0))))
(let (($x24 (and (>= ?x53 0) (>= (- ?x53 ?x145) (- 2)) (<= (- ?x53 ?x145) 2) (=> (and (distinct ?x53 ?x145) true) (< ?x67 ?x149)))))
(not $x24))))))))))))
(check-sat)

; lower_3_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x151 (+ ?x8 0)))
 (>= ?x151 0))))
(assert
 (let ((?x88 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x103 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x88)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x78 (- (+ (+ (* 4 gap_quotient) 0) ?x156) ?x156)))
(let ((?x94 (ite (= (mod ?x78 4) 2) 1 0)))
(let (($x137 (=> (and (distinct ?x78 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x78 2) 1) 2 ?x94) ?x103))))
(let (($x117 (and (>= ?x78 0) (>= (- ?x78 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x78 (+ (* 4 gap_quotient) 0)) 2) $x137)))
(not $x117))))))))))
(check-sat)

; lower_3_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x151 (+ ?x8 0)))
 (>= ?x151 0))))
(assert
 (let ((?x88 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x103 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x88)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x78 (- (+ (+ (* 4 gap_quotient) 0) ?x156) ?x156)))
(let ((?x94 (ite (= (mod ?x78 4) 2) 1 0)))
(let (($x137 (=> (and (distinct ?x78 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x78 2) 1) 2 ?x94) ?x103))))
(let (($x117 (and (>= ?x78 0) (>= (- ?x78 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x78 (+ (* 4 gap_quotient) 0)) 2) $x137)))
(not $x117))))))))))
(check-sat)

; lower_3_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x151 (+ ?x8 0)))
 (>= ?x151 0))))
(assert
 (let ((?x88 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x103 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x88)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x78 (- (+ (+ (* 4 gap_quotient) 0) ?x156) ?x156)))
(let ((?x94 (ite (= (mod ?x78 4) 2) 1 0)))
(let (($x137 (=> (and (distinct ?x78 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x78 2) 1) 2 ?x94) ?x103))))
(let (($x117 (and (>= ?x78 0) (>= (- ?x78 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x78 (+ (* 4 gap_quotient) 0)) 2) $x137)))
(not $x117))))))))))
(check-sat)

; lower_3_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x151 (+ ?x8 0)))
 (>= ?x151 0))))
(assert
 (let ((?x88 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x103 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x88)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x78 (- (+ (+ (* 4 gap_quotient) 0) ?x156) ?x156)))
(let ((?x94 (ite (= (mod ?x78 4) 2) 1 0)))
(let (($x137 (=> (and (distinct ?x78 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x78 2) 1) 2 ?x94) ?x103))))
(let (($x117 (and (>= ?x78 0) (>= (- ?x78 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x78 (+ (* 4 gap_quotient) 0)) 2) $x137)))
(not $x117))))))))))
(check-sat)

; lower_3_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x121 (+ ?x8 1)))
 (>= ?x121 0))))
(assert
 (let ((?x111 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x104 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x111)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x83 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x121 (+ ?x8 1)))
(let ((?x28 (- (+ ?x121 ?x83) ?x156)))
(let ((?x63 (ite (= (mod ?x28 2) 1) 2 (ite (= (mod ?x28 4) 2) 1 0))))
(let (($x76 (and (>= ?x28 0) (>= (- ?x28 ?x121) (- 2)) (<= (- ?x28 ?x121) 2) (=> (and (distinct ?x28 ?x121) true) (< ?x63 ?x104)))))
(not $x76))))))))))))
(check-sat)

; lower_3_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x121 (+ ?x8 1)))
 (>= ?x121 0))))
(assert
 (let ((?x111 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x104 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x111)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x83 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x121 (+ ?x8 1)))
(let ((?x28 (- (+ ?x121 ?x83) ?x156)))
(let ((?x63 (ite (= (mod ?x28 2) 1) 2 (ite (= (mod ?x28 4) 2) 1 0))))
(let (($x76 (and (>= ?x28 0) (>= (- ?x28 ?x121) (- 2)) (<= (- ?x28 ?x121) 2) (=> (and (distinct ?x28 ?x121) true) (< ?x63 ?x104)))))
(not $x76))))))))))))
(check-sat)

; lower_3_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x121 (+ ?x8 1)))
 (>= ?x121 0))))
(assert
 (let ((?x111 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x104 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x111)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x83 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x121 (+ ?x8 1)))
(let ((?x28 (- (+ ?x121 ?x83) ?x156)))
(let ((?x63 (ite (= (mod ?x28 2) 1) 2 (ite (= (mod ?x28 4) 2) 1 0))))
(let (($x76 (and (>= ?x28 0) (>= (- ?x28 ?x121) (- 2)) (<= (- ?x28 ?x121) 2) (=> (and (distinct ?x28 ?x121) true) (< ?x63 ?x104)))))
(not $x76))))))))))))
(check-sat)

; lower_3_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x121 (+ ?x8 1)))
 (>= ?x121 0))))
(assert
 (let ((?x111 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x104 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x111)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x83 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x121 (+ ?x8 1)))
(let ((?x28 (- (+ ?x121 ?x83) ?x156)))
(let ((?x63 (ite (= (mod ?x28 2) 1) 2 (ite (= (mod ?x28 4) 2) 1 0))))
(let (($x76 (and (>= ?x28 0) (>= (- ?x28 ?x121) (- 2)) (<= (- ?x28 ?x121) 2) (=> (and (distinct ?x28 ?x121) true) (< ?x63 ?x104)))))
(not $x76))))))))))))
(check-sat)

; lower_3_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x34 (+ ?x8 2)))
 (>= ?x34 0))))
(assert
 (let ((?x85 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x132 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x85)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x127 (- (+ (+ (* 4 gap_quotient) 2) ?x156) ?x156)))
(let ((?x129 (ite (= (mod ?x127 4) 2) 1 0)))
(let (($x73 (=> (and (distinct ?x127 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x127 2) 1) 2 ?x129) ?x132))))
(let (($x61 (and (>= ?x127 0) (>= (- ?x127 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x127 (+ (* 4 gap_quotient) 2)) 2) $x73)))
(not $x61))))))))))
(check-sat)

; lower_3_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x34 (+ ?x8 2)))
 (>= ?x34 0))))
(assert
 (let ((?x85 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x132 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x85)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x127 (- (+ (+ (* 4 gap_quotient) 2) ?x156) ?x156)))
(let ((?x129 (ite (= (mod ?x127 4) 2) 1 0)))
(let (($x73 (=> (and (distinct ?x127 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x127 2) 1) 2 ?x129) ?x132))))
(let (($x61 (and (>= ?x127 0) (>= (- ?x127 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x127 (+ (* 4 gap_quotient) 2)) 2) $x73)))
(not $x61))))))))))
(check-sat)

; lower_3_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x34 (+ ?x8 2)))
 (>= ?x34 0))))
(assert
 (let ((?x85 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x132 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x85)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x127 (- (+ (+ (* 4 gap_quotient) 2) ?x156) ?x156)))
(let ((?x129 (ite (= (mod ?x127 4) 2) 1 0)))
(let (($x73 (=> (and (distinct ?x127 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x127 2) 1) 2 ?x129) ?x132))))
(let (($x61 (and (>= ?x127 0) (>= (- ?x127 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x127 (+ (* 4 gap_quotient) 2)) 2) $x73)))
(not $x61))))))))))
(check-sat)

; lower_3_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x34 (+ ?x8 2)))
 (>= ?x34 0))))
(assert
 (let ((?x85 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x132 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x85)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x127 (- (+ (+ (* 4 gap_quotient) 2) ?x156) ?x156)))
(let ((?x129 (ite (= (mod ?x127 4) 2) 1 0)))
(let (($x73 (=> (and (distinct ?x127 (+ (* 4 gap_quotient) 2)) true) (< (ite (= (mod ?x127 2) 1) 2 ?x129) ?x132))))
(let (($x61 (and (>= ?x127 0) (>= (- ?x127 (+ (* 4 gap_quotient) 2)) (- 2)) (<= (- ?x127 (+ (* 4 gap_quotient) 2)) 2) $x73)))
(not $x61))))))))))
(check-sat)

; lower_3_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x102 (+ ?x8 3)))
 (>= ?x102 0))))
(assert
 (let ((?x98 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x143 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x98)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x25 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x102 (+ ?x8 3)))
(let ((?x139 (- (+ ?x102 ?x25) ?x156)))
(let ((?x107 (ite (= (mod ?x139 2) 1) 2 (ite (= (mod ?x139 4) 2) 1 0))))
(let (($x141 (and (>= ?x139 0) (>= (- ?x139 ?x102) (- 2)) (<= (- ?x139 ?x102) 2) (=> (and (distinct ?x139 ?x102) true) (< ?x107 ?x143)))))
(not $x141))))))))))))
(check-sat)

; lower_3_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x102 (+ ?x8 3)))
 (>= ?x102 0))))
(assert
 (let ((?x98 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x143 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x98)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x25 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x102 (+ ?x8 3)))
(let ((?x139 (- (+ ?x102 ?x25) ?x156)))
(let ((?x107 (ite (= (mod ?x139 2) 1) 2 (ite (= (mod ?x139 4) 2) 1 0))))
(let (($x141 (and (>= ?x139 0) (>= (- ?x139 ?x102) (- 2)) (<= (- ?x139 ?x102) 2) (=> (and (distinct ?x139 ?x102) true) (< ?x107 ?x143)))))
(not $x141))))))))))))
(check-sat)

; lower_3_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x102 (+ ?x8 3)))
 (>= ?x102 0))))
(assert
 (let ((?x98 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x143 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x98)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x25 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x102 (+ ?x8 3)))
(let ((?x139 (- (+ ?x102 ?x25) ?x156)))
(let ((?x107 (ite (= (mod ?x139 2) 1) 2 (ite (= (mod ?x139 4) 2) 1 0))))
(let (($x141 (and (>= ?x139 0) (>= (- ?x139 ?x102) (- 2)) (<= (- ?x139 ?x102) 2) (=> (and (distinct ?x139 ?x102) true) (< ?x107 ?x143)))))
(not $x141))))))))))))
(check-sat)

; lower_3_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x102 (+ ?x8 3)))
 (>= ?x102 0))))
(assert
 (let ((?x98 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x143 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x98)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x156 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x25 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x102 (+ ?x8 3)))
(let ((?x139 (- (+ ?x102 ?x25) ?x156)))
(let ((?x107 (ite (= (mod ?x139 2) 1) 2 (ite (= (mod ?x139 4) 2) 1 0))))
(let (($x141 (and (>= ?x139 0) (>= (- ?x139 ?x102) (- 2)) (<= (- ?x139 ?x102) 2) (=> (and (distinct ?x139 ?x102) true) (< ?x107 ?x143)))))
(not $x141))))))))))))
(check-sat)

; upper_0_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x108 (+ ?x8 0)))
 (>= ?x108 0))))
(assert
 (let ((?x80 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x41 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x80)))
(let (($x93 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 4) 2)))
(let ((?x149 (ite $x93 1 0)))
(let (($x155 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x108 (+ ?x8 0)))
(let ((?x118 (- (+ ?x108 0) 0)))
(let (($x30 (and (>= ?x118 0) (>= (- ?x118 ?x108) (- 2)) (<= (- ?x118 ?x108) 2) (=> (and (distinct ?x118 ?x108) true) (< (ite $x155 2 ?x149) ?x41)))))
(not $x30)))))))))))
(check-sat)

; upper_0_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x108 (+ ?x8 0)))
 (>= ?x108 0))))
(assert
 (let ((?x80 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x41 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x80)))
(let (($x93 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 4) 2)))
(let ((?x149 (ite $x93 1 0)))
(let (($x155 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x108 (+ ?x8 0)))
(let ((?x118 (- (+ ?x108 0) 0)))
(let (($x30 (and (>= ?x118 0) (>= (- ?x118 ?x108) (- 2)) (<= (- ?x118 ?x108) 2) (=> (and (distinct ?x118 ?x108) true) (< (ite $x155 2 ?x149) ?x41)))))
(not $x30)))))))))))
(check-sat)

; upper_0_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x108 (+ ?x8 0)))
 (>= ?x108 0))))
(assert
 (let ((?x80 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x41 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x80)))
(let (($x93 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 4) 2)))
(let ((?x149 (ite $x93 1 0)))
(let (($x155 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x108 (+ ?x8 0)))
(let ((?x118 (- (+ ?x108 0) 0)))
(let (($x30 (and (>= ?x118 0) (>= (- ?x118 ?x108) (- 2)) (<= (- ?x118 ?x108) 2) (=> (and (distinct ?x118 ?x108) true) (< (ite $x155 2 ?x149) ?x41)))))
(not $x30)))))))))))
(check-sat)

; upper_0_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x108 (+ ?x8 0)))
 (>= ?x108 0))))
(assert
 (let ((?x80 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x41 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x80)))
(let (($x93 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 4) 2)))
(let ((?x149 (ite $x93 1 0)))
(let (($x155 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x108 (+ ?x8 0)))
(let ((?x118 (- (+ ?x108 0) 0)))
(let (($x30 (and (>= ?x118 0) (>= (- ?x118 ?x108) (- 2)) (<= (- ?x118 ?x108) 2) (=> (and (distinct ?x118 ?x108) true) (< (ite $x155 2 ?x149) ?x41)))))
(not $x30)))))))))))
(check-sat)

; upper_0_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x49 (+ ?x8 1)))
 (>= ?x49 0))))
(assert
 (let ((?x51 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x55 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x51)))
(let ((?x87 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x49 (+ ?x8 1)))
(let ((?x129 (- (+ ?x49 ?x87) 0)))
(let ((?x36 (ite (= (mod ?x129 2) 1) 2 (ite (= (mod ?x129 4) 2) 1 0))))
(let (($x126 (and (>= ?x129 0) (>= (- ?x129 ?x49) (- 2)) (<= (- ?x129 ?x49) 2) (=> (and (distinct ?x129 ?x49) true) (< ?x36 ?x55)))))
(not $x126))))))))))
(check-sat)

; upper_0_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x49 (+ ?x8 1)))
 (>= ?x49 0))))
(assert
 (let ((?x51 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x55 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x51)))
(let ((?x87 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x49 (+ ?x8 1)))
(let ((?x129 (- (+ ?x49 ?x87) 0)))
(let ((?x36 (ite (= (mod ?x129 2) 1) 2 (ite (= (mod ?x129 4) 2) 1 0))))
(let (($x126 (and (>= ?x129 0) (>= (- ?x129 ?x49) (- 2)) (<= (- ?x129 ?x49) 2) (=> (and (distinct ?x129 ?x49) true) (< ?x36 ?x55)))))
(not $x126))))))))))
(check-sat)

; upper_0_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x49 (+ ?x8 1)))
 (>= ?x49 0))))
(assert
 (let ((?x51 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x55 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x51)))
(let ((?x87 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x49 (+ ?x8 1)))
(let ((?x129 (- (+ ?x49 ?x87) 0)))
(let ((?x36 (ite (= (mod ?x129 2) 1) 2 (ite (= (mod ?x129 4) 2) 1 0))))
(let (($x126 (and (>= ?x129 0) (>= (- ?x129 ?x49) (- 2)) (<= (- ?x129 ?x49) 2) (=> (and (distinct ?x129 ?x49) true) (< ?x36 ?x55)))))
(not $x126))))))))))
(check-sat)

; upper_0_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x49 (+ ?x8 1)))
 (>= ?x49 0))))
(assert
 (let ((?x51 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x55 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x51)))
(let ((?x87 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x49 (+ ?x8 1)))
(let ((?x129 (- (+ ?x49 ?x87) 0)))
(let ((?x36 (ite (= (mod ?x129 2) 1) 2 (ite (= (mod ?x129 4) 2) 1 0))))
(let (($x126 (and (>= ?x129 0) (>= (- ?x129 ?x49) (- 2)) (<= (- ?x129 ?x49) 2) (=> (and (distinct ?x129 ?x49) true) (< ?x36 ?x55)))))
(not $x126))))))))))
(check-sat)

; upper_0_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x62 (+ ?x8 2)))
 (>= ?x62 0))))
(assert
 (let ((?x71 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x60 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x71)))
(let (($x83 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 4) 2)))
(let ((?x24 (ite $x83 1 0)))
(let (($x57 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x62 (+ ?x8 2)))
(let ((?x96 (- (+ ?x62 0) 0)))
(let (($x37 (and (>= ?x96 0) (>= (- ?x96 ?x62) (- 2)) (<= (- ?x96 ?x62) 2) (=> (and (distinct ?x96 ?x62) true) (< (ite $x57 2 ?x24) ?x60)))))
(not $x37)))))))))))
(check-sat)

; upper_0_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x62 (+ ?x8 2)))
 (>= ?x62 0))))
(assert
 (let ((?x71 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x60 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x71)))
(let (($x83 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 4) 2)))
(let ((?x24 (ite $x83 1 0)))
(let (($x57 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x62 (+ ?x8 2)))
(let ((?x96 (- (+ ?x62 0) 0)))
(let (($x37 (and (>= ?x96 0) (>= (- ?x96 ?x62) (- 2)) (<= (- ?x96 ?x62) 2) (=> (and (distinct ?x96 ?x62) true) (< (ite $x57 2 ?x24) ?x60)))))
(not $x37)))))))))))
(check-sat)

; upper_0_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x62 (+ ?x8 2)))
 (>= ?x62 0))))
(assert
 (let ((?x71 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x60 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x71)))
(let (($x83 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 4) 2)))
(let ((?x24 (ite $x83 1 0)))
(let (($x57 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x62 (+ ?x8 2)))
(let ((?x96 (- (+ ?x62 0) 0)))
(let (($x37 (and (>= ?x96 0) (>= (- ?x96 ?x62) (- 2)) (<= (- ?x96 ?x62) 2) (=> (and (distinct ?x96 ?x62) true) (< (ite $x57 2 ?x24) ?x60)))))
(not $x37)))))))))))
(check-sat)

; upper_0_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x62 (+ ?x8 2)))
 (>= ?x62 0))))
(assert
 (let ((?x71 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x60 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x71)))
(let (($x83 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 4) 2)))
(let ((?x24 (ite $x83 1 0)))
(let (($x57 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x62 (+ ?x8 2)))
(let ((?x96 (- (+ ?x62 0) 0)))
(let (($x37 (and (>= ?x96 0) (>= (- ?x96 ?x62) (- 2)) (<= (- ?x96 ?x62) 2) (=> (and (distinct ?x96 ?x62) true) (< (ite $x57 2 ?x24) ?x60)))))
(not $x37)))))))))))
(check-sat)

; upper_0_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x80 (+ ?x8 3)))
 (>= ?x80 0))))
(assert
 (let ((?x41 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x131 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x41)))
(let ((?x10 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x80 (+ ?x8 3)))
(let ((?x53 (- (+ ?x80 ?x10) 0)))
(let ((?x122 (ite (= (mod ?x53 4) 2) 1 0)))
(let (($x143 (=> (and (distinct ?x53 ?x80) true) (< (ite (= (mod ?x53 2) 1) 2 ?x122) ?x131))))
(let (($x32 (and (>= ?x53 0) (>= (- ?x53 ?x80) (- 2)) (<= (- ?x53 ?x80) 2) $x143)))
(not $x32)))))))))))
(check-sat)

; upper_0_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x80 (+ ?x8 3)))
 (>= ?x80 0))))
(assert
 (let ((?x41 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x131 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x41)))
(let ((?x10 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x80 (+ ?x8 3)))
(let ((?x53 (- (+ ?x80 ?x10) 0)))
(let ((?x122 (ite (= (mod ?x53 4) 2) 1 0)))
(let (($x143 (=> (and (distinct ?x53 ?x80) true) (< (ite (= (mod ?x53 2) 1) 2 ?x122) ?x131))))
(let (($x32 (and (>= ?x53 0) (>= (- ?x53 ?x80) (- 2)) (<= (- ?x53 ?x80) 2) $x143)))
(not $x32)))))))))))
(check-sat)

; upper_0_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x80 (+ ?x8 3)))
 (>= ?x80 0))))
(assert
 (let ((?x41 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x131 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x41)))
(let ((?x10 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x80 (+ ?x8 3)))
(let ((?x53 (- (+ ?x80 ?x10) 0)))
(let ((?x122 (ite (= (mod ?x53 4) 2) 1 0)))
(let (($x143 (=> (and (distinct ?x53 ?x80) true) (< (ite (= (mod ?x53 2) 1) 2 ?x122) ?x131))))
(let (($x32 (and (>= ?x53 0) (>= (- ?x53 ?x80) (- 2)) (<= (- ?x53 ?x80) 2) $x143)))
(not $x32)))))))))))
(check-sat)

; upper_0_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x80 (+ ?x8 3)))
 (>= ?x80 0))))
(assert
 (let ((?x41 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x131 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x41)))
(let ((?x10 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x80 (+ ?x8 3)))
(let ((?x53 (- (+ ?x80 ?x10) 0)))
(let ((?x122 (ite (= (mod ?x53 4) 2) 1 0)))
(let (($x143 (=> (and (distinct ?x53 ?x80) true) (< (ite (= (mod ?x53 2) 1) 2 ?x122) ?x131))))
(let (($x32 (and (>= ?x53 0) (>= (- ?x53 ?x80) (- 2)) (<= (- ?x53 ?x80) 2) $x143)))
(not $x32)))))))))))
(check-sat)

; upper_1_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x54 (+ ?x8 0)))
 (>= ?x54 0))))
(assert
 (let ((?x27 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x25 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x27)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x100 (- (+ (+ (* 4 gap_quotient) 0) ?x93) ?x93)))
(let ((?x94 (ite (= (mod ?x100 4) 2) 1 0)))
(let (($x47 (=> (and (distinct ?x100 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x100 2) 1) 2 ?x94) ?x25))))
(let (($x124 (and (>= ?x100 0) (>= (- ?x100 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x100 (+ (* 4 gap_quotient) 0)) 2) $x47)))
(not $x124)))))))))
(check-sat)

; upper_1_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x54 (+ ?x8 0)))
 (>= ?x54 0))))
(assert
 (let ((?x27 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x25 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x27)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x100 (- (+ (+ (* 4 gap_quotient) 0) ?x93) ?x93)))
(let ((?x94 (ite (= (mod ?x100 4) 2) 1 0)))
(let (($x47 (=> (and (distinct ?x100 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x100 2) 1) 2 ?x94) ?x25))))
(let (($x124 (and (>= ?x100 0) (>= (- ?x100 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x100 (+ (* 4 gap_quotient) 0)) 2) $x47)))
(not $x124)))))))))
(check-sat)

; upper_1_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x54 (+ ?x8 0)))
 (>= ?x54 0))))
(assert
 (let ((?x27 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x25 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x27)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x100 (- (+ (+ (* 4 gap_quotient) 0) ?x93) ?x93)))
(let ((?x94 (ite (= (mod ?x100 4) 2) 1 0)))
(let (($x47 (=> (and (distinct ?x100 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x100 2) 1) 2 ?x94) ?x25))))
(let (($x124 (and (>= ?x100 0) (>= (- ?x100 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x100 (+ (* 4 gap_quotient) 0)) 2) $x47)))
(not $x124)))))))))
(check-sat)

; upper_1_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x54 (+ ?x8 0)))
 (>= ?x54 0))))
(assert
 (let ((?x27 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x25 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x27)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x100 (- (+ (+ (* 4 gap_quotient) 0) ?x93) ?x93)))
(let ((?x94 (ite (= (mod ?x100 4) 2) 1 0)))
(let (($x47 (=> (and (distinct ?x100 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x100 2) 1) 2 ?x94) ?x25))))
(let (($x124 (and (>= ?x100 0) (>= (- ?x100 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x100 (+ (* 4 gap_quotient) 0)) 2) $x47)))
(not $x124)))))))))
(check-sat)

; upper_1_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x57 (+ ?x8 1)))
 (>= ?x57 0))))
(assert
 (let ((?x89 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x78 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x89)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x37 (- (+ (+ (* 4 gap_quotient) 1) 0) ?x93)))
(let ((?x113 (ite (= (mod ?x37 2) 1) 2 (ite (= (mod ?x37 4) 2) 1 0))))
(let (($x39 (and (>= ?x37 0) (>= (- ?x37 (+ (* 4 gap_quotient) 1)) (- 2)) (<= (- ?x37 (+ (* 4 gap_quotient) 1)) 2) (=> (and (distinct ?x37 (+ (* 4 gap_quotient) 1)) true) (< ?x113 ?x78)))))
(not $x39))))))))
(check-sat)

; upper_1_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x57 (+ ?x8 1)))
 (>= ?x57 0))))
(assert
 (let ((?x89 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x78 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x89)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x37 (- (+ (+ (* 4 gap_quotient) 1) 0) ?x93)))
(let ((?x113 (ite (= (mod ?x37 2) 1) 2 (ite (= (mod ?x37 4) 2) 1 0))))
(let (($x39 (and (>= ?x37 0) (>= (- ?x37 (+ (* 4 gap_quotient) 1)) (- 2)) (<= (- ?x37 (+ (* 4 gap_quotient) 1)) 2) (=> (and (distinct ?x37 (+ (* 4 gap_quotient) 1)) true) (< ?x113 ?x78)))))
(not $x39))))))))
(check-sat)

; upper_1_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x57 (+ ?x8 1)))
 (>= ?x57 0))))
(assert
 (let ((?x89 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x78 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x89)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x37 (- (+ (+ (* 4 gap_quotient) 1) 0) ?x93)))
(let ((?x113 (ite (= (mod ?x37 2) 1) 2 (ite (= (mod ?x37 4) 2) 1 0))))
(let (($x39 (and (>= ?x37 0) (>= (- ?x37 (+ (* 4 gap_quotient) 1)) (- 2)) (<= (- ?x37 (+ (* 4 gap_quotient) 1)) 2) (=> (and (distinct ?x37 (+ (* 4 gap_quotient) 1)) true) (< ?x113 ?x78)))))
(not $x39))))))))
(check-sat)

; upper_1_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x57 (+ ?x8 1)))
 (>= ?x57 0))))
(assert
 (let ((?x89 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x78 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x89)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x37 (- (+ (+ (* 4 gap_quotient) 1) 0) ?x93)))
(let ((?x113 (ite (= (mod ?x37 2) 1) 2 (ite (= (mod ?x37 4) 2) 1 0))))
(let (($x39 (and (>= ?x37 0) (>= (- ?x37 (+ (* 4 gap_quotient) 1)) (- 2)) (<= (- ?x37 (+ (* 4 gap_quotient) 1)) 2) (=> (and (distinct ?x37 (+ (* 4 gap_quotient) 1)) true) (< ?x113 ?x78)))))
(not $x39))))))))
(check-sat)

; upper_1_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x124 (+ ?x8 2)))
 (>= ?x124 0))))
(assert
 (let ((?x117 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x141 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x117)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x120 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x124 (+ ?x8 2)))
(let ((?x98 (- (+ ?x124 ?x120) ?x93)))
(let ((?x158 (ite (= (mod ?x98 2) 1) 2 (ite (= (mod ?x98 4) 2) 1 0))))
(let (($x23 (and (>= ?x98 0) (>= (- ?x98 ?x124) (- 2)) (<= (- ?x98 ?x124) 2) (=> (and (distinct ?x98 ?x124) true) (< ?x158 ?x141)))))
(not $x23)))))))))))
(check-sat)

; upper_1_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x124 (+ ?x8 2)))
 (>= ?x124 0))))
(assert
 (let ((?x117 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x141 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x117)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x120 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x124 (+ ?x8 2)))
(let ((?x98 (- (+ ?x124 ?x120) ?x93)))
(let ((?x158 (ite (= (mod ?x98 2) 1) 2 (ite (= (mod ?x98 4) 2) 1 0))))
(let (($x23 (and (>= ?x98 0) (>= (- ?x98 ?x124) (- 2)) (<= (- ?x98 ?x124) 2) (=> (and (distinct ?x98 ?x124) true) (< ?x158 ?x141)))))
(not $x23)))))))))))
(check-sat)

; upper_1_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x124 (+ ?x8 2)))
 (>= ?x124 0))))
(assert
 (let ((?x117 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x141 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x117)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x120 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x124 (+ ?x8 2)))
(let ((?x98 (- (+ ?x124 ?x120) ?x93)))
(let ((?x158 (ite (= (mod ?x98 2) 1) 2 (ite (= (mod ?x98 4) 2) 1 0))))
(let (($x23 (and (>= ?x98 0) (>= (- ?x98 ?x124) (- 2)) (<= (- ?x98 ?x124) 2) (=> (and (distinct ?x98 ?x124) true) (< ?x158 ?x141)))))
(not $x23)))))))))))
(check-sat)

; upper_1_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x124 (+ ?x8 2)))
 (>= ?x124 0))))
(assert
 (let ((?x117 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x141 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x117)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x120 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x124 (+ ?x8 2)))
(let ((?x98 (- (+ ?x124 ?x120) ?x93)))
(let ((?x158 (ite (= (mod ?x98 2) 1) 2 (ite (= (mod ?x98 4) 2) 1 0))))
(let (($x23 (and (>= ?x98 0) (>= (- ?x98 ?x124) (- 2)) (<= (- ?x98 ?x124) 2) (=> (and (distinct ?x98 ?x124) true) (< ?x158 ?x141)))))
(not $x23)))))))))))
(check-sat)

; upper_1_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x48 (+ ?x8 3)))
 (>= ?x48 0))))
(assert
 (let ((?x72 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x92 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x72)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x161 (- (+ (+ (* 4 gap_quotient) 3) 0) ?x93)))
(let ((?x27 (ite (= (mod ?x161 2) 1) 2 (ite (= (mod ?x161 4) 2) 1 0))))
(let (($x114 (and (>= ?x161 0) (>= (- ?x161 (+ (* 4 gap_quotient) 3)) (- 2)) (<= (- ?x161 (+ (* 4 gap_quotient) 3)) 2) (=> (and (distinct ?x161 (+ (* 4 gap_quotient) 3)) true) (< ?x27 ?x92)))))
(not $x114))))))))
(check-sat)

; upper_1_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x48 (+ ?x8 3)))
 (>= ?x48 0))))
(assert
 (let ((?x72 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x92 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x72)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x161 (- (+ (+ (* 4 gap_quotient) 3) 0) ?x93)))
(let ((?x27 (ite (= (mod ?x161 2) 1) 2 (ite (= (mod ?x161 4) 2) 1 0))))
(let (($x114 (and (>= ?x161 0) (>= (- ?x161 (+ (* 4 gap_quotient) 3)) (- 2)) (<= (- ?x161 (+ (* 4 gap_quotient) 3)) 2) (=> (and (distinct ?x161 (+ (* 4 gap_quotient) 3)) true) (< ?x27 ?x92)))))
(not $x114))))))))
(check-sat)

; upper_1_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x48 (+ ?x8 3)))
 (>= ?x48 0))))
(assert
 (let ((?x72 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x92 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x72)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x161 (- (+ (+ (* 4 gap_quotient) 3) 0) ?x93)))
(let ((?x27 (ite (= (mod ?x161 2) 1) 2 (ite (= (mod ?x161 4) 2) 1 0))))
(let (($x114 (and (>= ?x161 0) (>= (- ?x161 (+ (* 4 gap_quotient) 3)) (- 2)) (<= (- ?x161 (+ (* 4 gap_quotient) 3)) 2) (=> (and (distinct ?x161 (+ (* 4 gap_quotient) 3)) true) (< ?x27 ?x92)))))
(not $x114))))))))
(check-sat)

; upper_1_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x48 (+ ?x8 3)))
 (>= ?x48 0))))
(assert
 (let ((?x72 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x92 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x72)))
(let ((?x93 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x161 (- (+ (+ (* 4 gap_quotient) 3) 0) ?x93)))
(let ((?x27 (ite (= (mod ?x161 2) 1) 2 (ite (= (mod ?x161 4) 2) 1 0))))
(let (($x114 (and (>= ?x161 0) (>= (- ?x161 (+ (* 4 gap_quotient) 3)) (- 2)) (<= (- ?x161 (+ (* 4 gap_quotient) 3)) 2) (=> (and (distinct ?x161 (+ (* 4 gap_quotient) 3)) true) (< ?x27 ?x92)))))
(not $x114))))))))
(check-sat)

; upper_2_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x105 (+ ?x8 0)))
 (>= ?x105 0))))
(assert
 (let ((?x157 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x34 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x157)))
(let (($x128 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 4) 2)))
(let ((?x132 (ite $x128 1 0)))
(let (($x130 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x105 (+ ?x8 0)))
(let ((?x104 (- (+ ?x105 0) 0)))
(let (($x43 (and (>= ?x104 0) (>= (- ?x104 ?x105) (- 2)) (<= (- ?x104 ?x105) 2) (=> (and (distinct ?x104 ?x105) true) (< (ite $x130 2 ?x132) ?x34)))))
(not $x43)))))))))))
(check-sat)

; upper_2_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x105 (+ ?x8 0)))
 (>= ?x105 0))))
(assert
 (let ((?x157 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x34 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x157)))
(let (($x128 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 4) 2)))
(let ((?x132 (ite $x128 1 0)))
(let (($x130 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x105 (+ ?x8 0)))
(let ((?x104 (- (+ ?x105 0) 0)))
(let (($x43 (and (>= ?x104 0) (>= (- ?x104 ?x105) (- 2)) (<= (- ?x104 ?x105) 2) (=> (and (distinct ?x104 ?x105) true) (< (ite $x130 2 ?x132) ?x34)))))
(not $x43)))))))))))
(check-sat)

; upper_2_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x105 (+ ?x8 0)))
 (>= ?x105 0))))
(assert
 (let ((?x157 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x34 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x157)))
(let (($x128 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 4) 2)))
(let ((?x132 (ite $x128 1 0)))
(let (($x130 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x105 (+ ?x8 0)))
(let ((?x104 (- (+ ?x105 0) 0)))
(let (($x43 (and (>= ?x104 0) (>= (- ?x104 ?x105) (- 2)) (<= (- ?x104 ?x105) 2) (=> (and (distinct ?x104 ?x105) true) (< (ite $x130 2 ?x132) ?x34)))))
(not $x43)))))))))))
(check-sat)

; upper_2_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x105 (+ ?x8 0)))
 (>= ?x105 0))))
(assert
 (let ((?x157 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x34 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x157)))
(let (($x128 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 4) 2)))
(let ((?x132 (ite $x128 1 0)))
(let (($x130 (= (mod (- (+ (+ (* 4 gap_quotient) 0) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x105 (+ ?x8 0)))
(let ((?x104 (- (+ ?x105 0) 0)))
(let (($x43 (and (>= ?x104 0) (>= (- ?x104 ?x105) (- 2)) (<= (- ?x104 ?x105) 2) (=> (and (distinct ?x104 ?x105) true) (< (ite $x130 2 ?x132) ?x34)))))
(not $x43)))))))))))
(check-sat)

; upper_2_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x123 (+ ?x8 1)))
 (>= ?x123 0))))
(assert
 (let ((?x136 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x62 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x136)))
(let ((?x77 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x123 (+ ?x8 1)))
(let ((?x40 (- (+ ?x123 ?x77) 0)))
(let ((?x155 (ite (= (mod ?x40 4) 2) 1 0)))
(let (($x87 (=> (and (distinct ?x40 ?x123) true) (< (ite (= (mod ?x40 2) 1) 2 ?x155) ?x62))))
(let (($x23 (and (>= ?x40 0) (>= (- ?x40 ?x123) (- 2)) (<= (- ?x40 ?x123) 2) $x87)))
(not $x23)))))))))))
(check-sat)

; upper_2_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x123 (+ ?x8 1)))
 (>= ?x123 0))))
(assert
 (let ((?x136 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x62 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x136)))
(let ((?x77 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x123 (+ ?x8 1)))
(let ((?x40 (- (+ ?x123 ?x77) 0)))
(let ((?x155 (ite (= (mod ?x40 4) 2) 1 0)))
(let (($x87 (=> (and (distinct ?x40 ?x123) true) (< (ite (= (mod ?x40 2) 1) 2 ?x155) ?x62))))
(let (($x23 (and (>= ?x40 0) (>= (- ?x40 ?x123) (- 2)) (<= (- ?x40 ?x123) 2) $x87)))
(not $x23)))))))))))
(check-sat)

; upper_2_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x123 (+ ?x8 1)))
 (>= ?x123 0))))
(assert
 (let ((?x136 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x62 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x136)))
(let ((?x77 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x123 (+ ?x8 1)))
(let ((?x40 (- (+ ?x123 ?x77) 0)))
(let ((?x155 (ite (= (mod ?x40 4) 2) 1 0)))
(let (($x87 (=> (and (distinct ?x40 ?x123) true) (< (ite (= (mod ?x40 2) 1) 2 ?x155) ?x62))))
(let (($x23 (and (>= ?x40 0) (>= (- ?x40 ?x123) (- 2)) (<= (- ?x40 ?x123) 2) $x87)))
(not $x23)))))))))))
(check-sat)

; upper_2_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x123 (+ ?x8 1)))
 (>= ?x123 0))))
(assert
 (let ((?x136 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x62 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x136)))
(let ((?x77 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x123 (+ ?x8 1)))
(let ((?x40 (- (+ ?x123 ?x77) 0)))
(let ((?x155 (ite (= (mod ?x40 4) 2) 1 0)))
(let (($x87 (=> (and (distinct ?x40 ?x123) true) (< (ite (= (mod ?x40 2) 1) 2 ?x155) ?x62))))
(let (($x23 (and (>= ?x40 0) (>= (- ?x40 ?x123) (- 2)) (<= (- ?x40 ?x123) 2) $x87)))
(not $x23)))))))))))
(check-sat)

; upper_2_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x131 (+ ?x8 2)))
 (>= ?x131 0))))
(assert
 (let ((?x67 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x154 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x67)))
(let (($x83 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 4) 2)))
(let ((?x59 (ite $x83 1 0)))
(let (($x53 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x131 (+ ?x8 2)))
(let ((?x99 (- (+ ?x131 0) 0)))
(let (($x165 (and (>= ?x99 0) (>= (- ?x99 ?x131) (- 2)) (<= (- ?x99 ?x131) 2) (=> (and (distinct ?x99 ?x131) true) (< (ite $x53 2 ?x59) ?x154)))))
(not $x165)))))))))))
(check-sat)

; upper_2_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x131 (+ ?x8 2)))
 (>= ?x131 0))))
(assert
 (let ((?x67 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x154 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x67)))
(let (($x83 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 4) 2)))
(let ((?x59 (ite $x83 1 0)))
(let (($x53 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x131 (+ ?x8 2)))
(let ((?x99 (- (+ ?x131 0) 0)))
(let (($x165 (and (>= ?x99 0) (>= (- ?x99 ?x131) (- 2)) (<= (- ?x99 ?x131) 2) (=> (and (distinct ?x99 ?x131) true) (< (ite $x53 2 ?x59) ?x154)))))
(not $x165)))))))))))
(check-sat)

; upper_2_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x131 (+ ?x8 2)))
 (>= ?x131 0))))
(assert
 (let ((?x67 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x154 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x67)))
(let (($x83 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 4) 2)))
(let ((?x59 (ite $x83 1 0)))
(let (($x53 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x131 (+ ?x8 2)))
(let ((?x99 (- (+ ?x131 0) 0)))
(let (($x165 (and (>= ?x99 0) (>= (- ?x99 ?x131) (- 2)) (<= (- ?x99 ?x131) 2) (=> (and (distinct ?x99 ?x131) true) (< (ite $x53 2 ?x59) ?x154)))))
(not $x165)))))))))))
(check-sat)

; upper_2_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x131 (+ ?x8 2)))
 (>= ?x131 0))))
(assert
 (let ((?x67 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x154 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x67)))
(let (($x83 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 4) 2)))
(let ((?x59 (ite $x83 1 0)))
(let (($x53 (= (mod (- (+ (+ (* 4 gap_quotient) 2) 0) 0) 2) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x131 (+ ?x8 2)))
(let ((?x99 (- (+ ?x131 0) 0)))
(let (($x165 (and (>= ?x99 0) (>= (- ?x99 ?x131) (- 2)) (<= (- ?x99 ?x131) 2) (=> (and (distinct ?x99 ?x131) true) (< (ite $x53 2 ?x59) ?x154)))))
(not $x165)))))))))))
(check-sat)

; upper_2_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x28 (+ ?x8 3)))
 (>= ?x28 0))))
(assert
 (let ((?x66 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x64 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x66)))
(let ((?x90 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x28 (+ ?x8 3)))
(let ((?x65 (- (+ ?x28 ?x90) 0)))
(let ((?x61 (ite (= (mod ?x65 2) 1) 2 (ite (= (mod ?x65 4) 2) 1 0))))
(let (($x57 (and (>= ?x65 0) (>= (- ?x65 ?x28) (- 2)) (<= (- ?x65 ?x28) 2) (=> (and (distinct ?x65 ?x28) true) (< ?x61 ?x64)))))
(not $x57))))))))))
(check-sat)

; upper_2_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x28 (+ ?x8 3)))
 (>= ?x28 0))))
(assert
 (let ((?x66 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x64 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x66)))
(let ((?x90 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x28 (+ ?x8 3)))
(let ((?x65 (- (+ ?x28 ?x90) 0)))
(let ((?x61 (ite (= (mod ?x65 2) 1) 2 (ite (= (mod ?x65 4) 2) 1 0))))
(let (($x57 (and (>= ?x65 0) (>= (- ?x65 ?x28) (- 2)) (<= (- ?x65 ?x28) 2) (=> (and (distinct ?x65 ?x28) true) (< ?x61 ?x64)))))
(not $x57))))))))))
(check-sat)

; upper_2_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x28 (+ ?x8 3)))
 (>= ?x28 0))))
(assert
 (let ((?x66 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x64 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x66)))
(let ((?x90 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x28 (+ ?x8 3)))
(let ((?x65 (- (+ ?x28 ?x90) 0)))
(let ((?x61 (ite (= (mod ?x65 2) 1) 2 (ite (= (mod ?x65 4) 2) 1 0))))
(let (($x57 (and (>= ?x65 0) (>= (- ?x65 ?x28) (- 2)) (<= (- ?x65 ?x28) 2) (=> (and (distinct ?x65 ?x28) true) (< ?x61 ?x64)))))
(not $x57))))))))))
(check-sat)

; upper_2_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x28 (+ ?x8 3)))
 (>= ?x28 0))))
(assert
 (let ((?x66 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x64 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x66)))
(let ((?x90 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x28 (+ ?x8 3)))
(let ((?x65 (- (+ ?x28 ?x90) 0)))
(let ((?x61 (ite (= (mod ?x65 2) 1) 2 (ite (= (mod ?x65 4) 2) 1 0))))
(let (($x57 (and (>= ?x65 0) (>= (- ?x65 ?x28) (- 2)) (<= (- ?x65 ?x28) 2) (=> (and (distinct ?x65 ?x28) true) (< ?x61 ?x64)))))
(not $x57))))))))))
(check-sat)

; upper_3_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x117 (+ ?x8 0)))
 (>= ?x117 0))))
(assert
 (let ((?x156 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x78 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x156)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x118 (- (+ (+ (* 4 gap_quotient) 0) ?x30) ?x30)))
(let ((?x52 (ite (= (mod ?x118 4) 2) 1 0)))
(let (($x55 (=> (and (distinct ?x118 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x118 2) 1) 2 ?x52) ?x78))))
(let (($x150 (and (>= ?x118 0) (>= (- ?x118 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x118 (+ (* 4 gap_quotient) 0)) 2) $x55)))
(not $x150)))))))))
(check-sat)

; upper_3_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x117 (+ ?x8 0)))
 (>= ?x117 0))))
(assert
 (let ((?x156 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x78 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x156)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x118 (- (+ (+ (* 4 gap_quotient) 0) ?x30) ?x30)))
(let ((?x52 (ite (= (mod ?x118 4) 2) 1 0)))
(let (($x55 (=> (and (distinct ?x118 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x118 2) 1) 2 ?x52) ?x78))))
(let (($x150 (and (>= ?x118 0) (>= (- ?x118 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x118 (+ (* 4 gap_quotient) 0)) 2) $x55)))
(not $x150)))))))))
(check-sat)

; upper_3_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x117 (+ ?x8 0)))
 (>= ?x117 0))))
(assert
 (let ((?x156 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x78 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x156)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x118 (- (+ (+ (* 4 gap_quotient) 0) ?x30) ?x30)))
(let ((?x52 (ite (= (mod ?x118 4) 2) 1 0)))
(let (($x55 (=> (and (distinct ?x118 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x118 2) 1) 2 ?x52) ?x78))))
(let (($x150 (and (>= ?x118 0) (>= (- ?x118 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x118 (+ (* 4 gap_quotient) 0)) 2) $x55)))
(not $x150)))))))))
(check-sat)

; upper_3_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x117 (+ ?x8 0)))
 (>= ?x117 0))))
(assert
 (let ((?x156 (ite (= (mod (+ (* 4 gap_quotient) 0) 4) 2) 1 0)))
(let ((?x78 (ite (= (mod (+ (* 4 gap_quotient) 0) 2) 1) 2 ?x156)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x118 (- (+ (+ (* 4 gap_quotient) 0) ?x30) ?x30)))
(let ((?x52 (ite (= (mod ?x118 4) 2) 1 0)))
(let (($x55 (=> (and (distinct ?x118 (+ (* 4 gap_quotient) 0)) true) (< (ite (= (mod ?x118 2) 1) 2 ?x52) ?x78))))
(let (($x150 (and (>= ?x118 0) (>= (- ?x118 (+ (* 4 gap_quotient) 0)) (- 2)) (<= (- ?x118 (+ (* 4 gap_quotient) 0)) 2) $x55)))
(not $x150)))))))))
(check-sat)

; upper_3_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x24 (+ ?x8 1)))
 (>= ?x24 0))))
(assert
 (let ((?x37 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x124 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x37)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x125 (- (+ (+ (* 4 gap_quotient) 1) 0) ?x30)))
(let ((?x145 (ite (= (mod ?x125 4) 2) 1 0)))
(let (($x123 (=> (and (distinct ?x125 (+ (* 4 gap_quotient) 1)) true) (< (ite (= (mod ?x125 2) 1) 2 ?x145) ?x124))))
(let (($x45 (and (>= ?x125 0) (>= (- ?x125 (+ (* 4 gap_quotient) 1)) (- 2)) (<= (- ?x125 (+ (* 4 gap_quotient) 1)) 2) $x123)))
(not $x45)))))))))
(check-sat)

; upper_3_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x24 (+ ?x8 1)))
 (>= ?x24 0))))
(assert
 (let ((?x37 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x124 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x37)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x125 (- (+ (+ (* 4 gap_quotient) 1) 0) ?x30)))
(let ((?x145 (ite (= (mod ?x125 4) 2) 1 0)))
(let (($x123 (=> (and (distinct ?x125 (+ (* 4 gap_quotient) 1)) true) (< (ite (= (mod ?x125 2) 1) 2 ?x145) ?x124))))
(let (($x45 (and (>= ?x125 0) (>= (- ?x125 (+ (* 4 gap_quotient) 1)) (- 2)) (<= (- ?x125 (+ (* 4 gap_quotient) 1)) 2) $x123)))
(not $x45)))))))))
(check-sat)

; upper_3_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x24 (+ ?x8 1)))
 (>= ?x24 0))))
(assert
 (let ((?x37 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x124 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x37)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x125 (- (+ (+ (* 4 gap_quotient) 1) 0) ?x30)))
(let ((?x145 (ite (= (mod ?x125 4) 2) 1 0)))
(let (($x123 (=> (and (distinct ?x125 (+ (* 4 gap_quotient) 1)) true) (< (ite (= (mod ?x125 2) 1) 2 ?x145) ?x124))))
(let (($x45 (and (>= ?x125 0) (>= (- ?x125 (+ (* 4 gap_quotient) 1)) (- 2)) (<= (- ?x125 (+ (* 4 gap_quotient) 1)) 2) $x123)))
(not $x45)))))))))
(check-sat)

; upper_3_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x24 (+ ?x8 1)))
 (>= ?x24 0))))
(assert
 (let ((?x37 (ite (= (mod (+ (* 4 gap_quotient) 1) 4) 2) 1 0)))
(let ((?x124 (ite (= (mod (+ (* 4 gap_quotient) 1) 2) 1) 2 ?x37)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x125 (- (+ (+ (* 4 gap_quotient) 1) 0) ?x30)))
(let ((?x145 (ite (= (mod ?x125 4) 2) 1 0)))
(let (($x123 (=> (and (distinct ?x125 (+ (* 4 gap_quotient) 1)) true) (< (ite (= (mod ?x125 2) 1) 2 ?x145) ?x124))))
(let (($x45 (and (>= ?x125 0) (>= (- ?x125 (+ (* 4 gap_quotient) 1)) (- 2)) (<= (- ?x125 (+ (* 4 gap_quotient) 1)) 2) $x123)))
(not $x45)))))))))
(check-sat)

; upper_3_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x107 (+ ?x8 2)))
 (>= ?x107 0))))
(assert
 (let ((?x50 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x47 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x50)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x132 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x107 (+ ?x8 2)))
(let ((?x120 (- (+ ?x107 ?x132) ?x30)))
(let ((?x115 (ite (= (mod ?x120 2) 1) 2 (ite (= (mod ?x120 4) 2) 1 0))))
(let (($x106 (and (>= ?x120 0) (>= (- ?x120 ?x107) (- 2)) (<= (- ?x120 ?x107) 2) (=> (and (distinct ?x120 ?x107) true) (< ?x115 ?x47)))))
(not $x106)))))))))))
(check-sat)

; upper_3_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x107 (+ ?x8 2)))
 (>= ?x107 0))))
(assert
 (let ((?x50 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x47 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x50)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x132 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x107 (+ ?x8 2)))
(let ((?x120 (- (+ ?x107 ?x132) ?x30)))
(let ((?x115 (ite (= (mod ?x120 2) 1) 2 (ite (= (mod ?x120 4) 2) 1 0))))
(let (($x106 (and (>= ?x120 0) (>= (- ?x120 ?x107) (- 2)) (<= (- ?x120 ?x107) 2) (=> (and (distinct ?x120 ?x107) true) (< ?x115 ?x47)))))
(not $x106)))))))))))
(check-sat)

; upper_3_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x107 (+ ?x8 2)))
 (>= ?x107 0))))
(assert
 (let ((?x50 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x47 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x50)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x132 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x107 (+ ?x8 2)))
(let ((?x120 (- (+ ?x107 ?x132) ?x30)))
(let ((?x115 (ite (= (mod ?x120 2) 1) 2 (ite (= (mod ?x120 4) 2) 1 0))))
(let (($x106 (and (>= ?x120 0) (>= (- ?x120 ?x107) (- 2)) (<= (- ?x120 ?x107) 2) (=> (and (distinct ?x120 ?x107) true) (< ?x115 ?x47)))))
(not $x106)))))))))))
(check-sat)

; upper_3_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x107 (+ ?x8 2)))
 (>= ?x107 0))))
(assert
 (let ((?x50 (ite (= (mod (+ (* 4 gap_quotient) 2) 4) 2) 1 0)))
(let ((?x47 (ite (= (mod (+ (* 4 gap_quotient) 2) 2) 1) 2 ?x50)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x132 (ite (and (= fraction 0.0) true) (- 1) 1)))
(let ((?x8 (* 4 gap_quotient)))
(let ((?x107 (+ ?x8 2)))
(let ((?x120 (- (+ ?x107 ?x132) ?x30)))
(let ((?x115 (ite (= (mod ?x120 2) 1) 2 (ite (= (mod ?x120 4) 2) 1 0))))
(let (($x106 (and (>= ?x120 0) (>= (- ?x120 ?x107) (- 2)) (<= (- ?x120 ?x107) 2) (=> (and (distinct ?x120 ?x107) true) (< ?x115 ?x47)))))
(not $x106)))))))))))
(check-sat)

; upper_3_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x121 (+ ?x8 3)))
 (>= ?x121 0))))
(assert
 (let ((?x83 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x56 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x83)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x100 (- (+ (+ (* 4 gap_quotient) 3) 0) ?x30)))
(let ((?x98 (ite (= (mod ?x100 4) 2) 1 0)))
(let (($x129 (=> (and (distinct ?x100 (+ (* 4 gap_quotient) 3)) true) (< (ite (= (mod ?x100 2) 1) 2 ?x98) ?x56))))
(let (($x75 (and (>= ?x100 0) (>= (- ?x100 (+ (* 4 gap_quotient) 3)) (- 2)) (<= (- ?x100 (+ (* 4 gap_quotient) 3)) 2) $x129)))
(not $x75)))))))))
(check-sat)

; upper_3_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (> fraction 0.0) (> (/ 1.0 2.0) fraction)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x121 (+ ?x8 3)))
 (>= ?x121 0))))
(assert
 (let ((?x83 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x56 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x83)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x100 (- (+ (+ (* 4 gap_quotient) 3) 0) ?x30)))
(let ((?x98 (ite (= (mod ?x100 4) 2) 1 0)))
(let (($x129 (=> (and (distinct ?x100 (+ (* 4 gap_quotient) 3)) true) (< (ite (= (mod ?x100 2) 1) 2 ?x98) ?x56))))
(let (($x75 (and (>= ?x100 0) (>= (- ?x100 (+ (* 4 gap_quotient) 3)) (- 2)) (<= (- ?x100 (+ (* 4 gap_quotient) 3)) 2) $x129)))
(not $x75)))))))))
(check-sat)

; upper_3_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x121 (+ ?x8 3)))
 (>= ?x121 0))))
(assert
 (let ((?x83 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x56 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x83)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x100 (- (+ (+ (* 4 gap_quotient) 3) 0) ?x30)))
(let ((?x98 (ite (= (mod ?x100 4) 2) 1 0)))
(let (($x129 (=> (and (distinct ?x100 (+ (* 4 gap_quotient) 3)) true) (< (ite (= (mod ?x100 2) 1) 2 ?x98) ?x56))))
(let (($x75 (and (>= ?x100 0) (>= (- ?x100 (+ (* 4 gap_quotient) 3)) (- 2)) (<= (- ?x100 (+ (* 4 gap_quotient) 3)) 2) $x129)))
(not $x75)))))))))
(check-sat)

; upper_3_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (and (< (/ 1.0 2.0) fraction) (< fraction 1.0)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x121 (+ ?x8 3)))
 (>= ?x121 0))))
(assert
 (let ((?x83 (ite (= (mod (+ (* 4 gap_quotient) 3) 4) 2) 1 0)))
(let ((?x56 (ite (= (mod (+ (* 4 gap_quotient) 3) 2) 1) 2 ?x83)))
(let ((?x30 (ite (and (= fraction 0.0) false) (- 1) 1)))
(let ((?x100 (- (+ (+ (* 4 gap_quotient) 3) 0) ?x30)))
(let ((?x98 (ite (= (mod ?x100 4) 2) 1 0)))
(let (($x129 (=> (and (distinct ?x100 (+ (* 4 gap_quotient) 3)) true) (< (ite (= (mod ?x100 2) 1) 2 ?x98) ?x56))))
(let (($x75 (and (>= ?x100 0) (>= (- ?x100 (+ (* 4 gap_quotient) 3)) (- 2)) (<= (- ?x100 (+ (* 4 gap_quotient) 3)) 2) $x129)))
(not $x75)))))))))
(check-sat)

; crossing_0_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x165 (+ ?x8 0)))
 (> ?x165 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x165 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x131 (- (+ ?x165 0) ?x114)))
(let ((?x71 (- ?x131 ?x165)))
(let (($x55 (and (>= ?x131 0) (>= ?x71 (- 1)) (<= ?x71 1))))
(not $x55)))))))))
(check-sat)

; crossing_0_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x165 (+ ?x8 0)))
 (> ?x165 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x165 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x131 (- (+ ?x165 0) ?x114)))
(let ((?x71 (- ?x131 ?x165)))
(let (($x55 (and (>= ?x131 0) (>= ?x71 (- 1)) (<= ?x71 1))))
(not $x55)))))))))
(check-sat)

; crossing_0_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x165 (+ ?x8 0)))
 (> ?x165 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x165 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x131 (- (+ ?x165 0) ?x114)))
(let ((?x71 (- ?x131 ?x165)))
(let (($x55 (and (>= ?x131 0) (>= ?x71 (- 1)) (<= ?x71 1))))
(not $x55)))))))))
(check-sat)

; crossing_0_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x165 (+ ?x8 0)))
 (> ?x165 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x165 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x131 (- (+ ?x165 0) ?x114)))
(let ((?x71 (- ?x131 ?x165)))
(let (($x55 (and (>= ?x131 0) (>= ?x71 (- 1)) (<= ?x71 1))))
(not $x55)))))))))
(check-sat)

; crossing_0_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x106 (+ ?x8 1)))
 (> ?x106 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x106 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x66 (- (+ ?x106 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x114)))
(let ((?x167 (- ?x66 ?x106)))
(let (($x159 (and (>= ?x66 0) (>= ?x167 (- 1)) (<= ?x167 1))))
(not $x159)))))))))
(check-sat)

; crossing_0_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x106 (+ ?x8 1)))
 (> ?x106 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x106 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x66 (- (+ ?x106 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x114)))
(let ((?x167 (- ?x66 ?x106)))
(let (($x159 (and (>= ?x66 0) (>= ?x167 (- 1)) (<= ?x167 1))))
(not $x159)))))))))
(check-sat)

; crossing_0_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x106 (+ ?x8 1)))
 (> ?x106 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x106 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x66 (- (+ ?x106 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x114)))
(let ((?x167 (- ?x66 ?x106)))
(let (($x159 (and (>= ?x66 0) (>= ?x167 (- 1)) (<= ?x167 1))))
(not $x159)))))))))
(check-sat)

; crossing_0_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x106 (+ ?x8 1)))
 (> ?x106 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x106 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x66 (- (+ ?x106 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x114)))
(let ((?x167 (- ?x66 ?x106)))
(let (($x159 (and (>= ?x66 0) (>= ?x167 (- 1)) (<= ?x167 1))))
(not $x159)))))))))
(check-sat)

; crossing_0_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x127 (+ ?x8 2)))
 (> ?x127 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x127 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x136 (- (+ ?x127 0) ?x114)))
(let ((?x50 (- ?x136 ?x127)))
(let (($x32 (and (>= ?x136 0) (>= ?x50 (- 1)) (<= ?x50 1))))
(not $x32)))))))))
(check-sat)

; crossing_0_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x127 (+ ?x8 2)))
 (> ?x127 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x127 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x136 (- (+ ?x127 0) ?x114)))
(let ((?x50 (- ?x136 ?x127)))
(let (($x32 (and (>= ?x136 0) (>= ?x50 (- 1)) (<= ?x50 1))))
(not $x32)))))))))
(check-sat)

; crossing_0_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x127 (+ ?x8 2)))
 (> ?x127 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x127 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x136 (- (+ ?x127 0) ?x114)))
(let ((?x50 (- ?x136 ?x127)))
(let (($x32 (and (>= ?x136 0) (>= ?x50 (- 1)) (<= ?x50 1))))
(not $x32)))))))))
(check-sat)

; crossing_0_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x127 (+ ?x8 2)))
 (> ?x127 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x127 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x136 (- (+ ?x127 0) ?x114)))
(let ((?x50 (- ?x136 ?x127)))
(let (($x32 (and (>= ?x136 0) (>= ?x50 (- 1)) (<= ?x50 1))))
(not $x32)))))))))
(check-sat)

; crossing_0_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x95 (+ ?x8 3)))
 (> ?x95 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x95 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x111 (- (+ ?x95 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x114)))
(let ((?x26 (- ?x111 ?x95)))
(let (($x100 (and (>= ?x111 0) (>= ?x26 (- 1)) (<= ?x26 1))))
(not $x100)))))))))
(check-sat)

; crossing_0_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x95 (+ ?x8 3)))
 (> ?x95 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x95 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x111 (- (+ ?x95 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x114)))
(let ((?x26 (- ?x111 ?x95)))
(let (($x100 (and (>= ?x111 0) (>= ?x26 (- 1)) (<= ?x26 1))))
(not $x100)))))))))
(check-sat)

; crossing_0_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x95 (+ ?x8 3)))
 (> ?x95 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x95 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x111 (- (+ ?x95 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x114)))
(let ((?x26 (- ?x111 ?x95)))
(let (($x100 (and (>= ?x111 0) (>= ?x26 (- 1)) (<= ?x26 1))))
(not $x100)))))))))
(check-sat)

; crossing_0_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x95 (+ ?x8 3)))
 (> ?x95 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x95 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x114 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x111 (- (+ ?x95 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x114)))
(let ((?x26 (- ?x111 ?x95)))
(let (($x100 (and (>= ?x111 0) (>= ?x26 (- 1)) (<= ?x26 1))))
(not $x100)))))))))
(check-sat)

; crossing_1_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x63 (+ ?x8 0)))
 (> ?x63 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x63 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x121 (- (+ ?x63 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x139)))
(let ((?x88 (- ?x121 ?x63)))
(let (($x107 (and (>= ?x121 0) (>= ?x88 (- 1)) (<= ?x88 1))))
(not $x107)))))))))
(check-sat)

; crossing_1_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x63 (+ ?x8 0)))
 (> ?x63 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x63 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x121 (- (+ ?x63 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x139)))
(let ((?x88 (- ?x121 ?x63)))
(let (($x107 (and (>= ?x121 0) (>= ?x88 (- 1)) (<= ?x88 1))))
(not $x107)))))))))
(check-sat)

; crossing_1_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x63 (+ ?x8 0)))
 (> ?x63 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x63 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x121 (- (+ ?x63 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x139)))
(let ((?x88 (- ?x121 ?x63)))
(let (($x107 (and (>= ?x121 0) (>= ?x88 (- 1)) (<= ?x88 1))))
(not $x107)))))))))
(check-sat)

; crossing_1_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x63 (+ ?x8 0)))
 (> ?x63 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x63 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x121 (- (+ ?x63 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x139)))
(let ((?x88 (- ?x121 ?x63)))
(let (($x107 (and (>= ?x121 0) (>= ?x88 (- 1)) (<= ?x88 1))))
(not $x107)))))))))
(check-sat)

; crossing_1_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x133 (+ ?x8 1)))
 (> ?x133 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x133 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x33 (- (+ ?x133 0) ?x139)))
(let ((?x142 (- ?x33 ?x133)))
(let (($x132 (and (>= ?x33 0) (>= ?x142 (- 1)) (<= ?x142 1))))
(not $x132)))))))))
(check-sat)

; crossing_1_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x133 (+ ?x8 1)))
 (> ?x133 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x133 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x33 (- (+ ?x133 0) ?x139)))
(let ((?x142 (- ?x33 ?x133)))
(let (($x132 (and (>= ?x33 0) (>= ?x142 (- 1)) (<= ?x142 1))))
(not $x132)))))))))
(check-sat)

; crossing_1_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x133 (+ ?x8 1)))
 (> ?x133 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x133 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x33 (- (+ ?x133 0) ?x139)))
(let ((?x142 (- ?x33 ?x133)))
(let (($x132 (and (>= ?x33 0) (>= ?x142 (- 1)) (<= ?x142 1))))
(not $x132)))))))))
(check-sat)

; crossing_1_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x133 (+ ?x8 1)))
 (> ?x133 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x133 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x33 (- (+ ?x133 0) ?x139)))
(let ((?x142 (- ?x33 ?x133)))
(let (($x132 (and (>= ?x33 0) (>= ?x142 (- 1)) (<= ?x142 1))))
(not $x132)))))))))
(check-sat)

; crossing_1_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x54 (+ ?x8 2)))
 (> ?x54 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x54 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x30 (- (+ ?x54 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x139)))
(let ((?x153 (- ?x30 ?x54)))
(let (($x119 (and (>= ?x30 0) (>= ?x153 (- 1)) (<= ?x153 1))))
(not $x119)))))))))
(check-sat)

; crossing_1_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x54 (+ ?x8 2)))
 (> ?x54 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x54 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x30 (- (+ ?x54 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x139)))
(let ((?x153 (- ?x30 ?x54)))
(let (($x119 (and (>= ?x30 0) (>= ?x153 (- 1)) (<= ?x153 1))))
(not $x119)))))))))
(check-sat)

; crossing_1_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x54 (+ ?x8 2)))
 (> ?x54 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x54 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x30 (- (+ ?x54 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x139)))
(let ((?x153 (- ?x30 ?x54)))
(let (($x119 (and (>= ?x30 0) (>= ?x153 (- 1)) (<= ?x153 1))))
(not $x119)))))))))
(check-sat)

; crossing_1_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x54 (+ ?x8 2)))
 (> ?x54 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x54 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x30 (- (+ ?x54 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x139)))
(let ((?x153 (- ?x30 ?x54)))
(let (($x119 (and (>= ?x30 0) (>= ?x153 (- 1)) (<= ?x153 1))))
(not $x119)))))))))
(check-sat)

; crossing_1_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x24 (+ ?x8 3)))
 (> ?x24 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x24 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x55 (- (+ ?x24 0) ?x139)))
(let ((?x29 (- ?x55 ?x24)))
(let (($x112 (and (>= ?x55 0) (>= ?x29 (- 1)) (<= ?x29 1))))
(not $x112)))))))))
(check-sat)

; crossing_1_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x24 (+ ?x8 3)))
 (> ?x24 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x24 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x55 (- (+ ?x24 0) ?x139)))
(let ((?x29 (- ?x55 ?x24)))
(let (($x112 (and (>= ?x55 0) (>= ?x29 (- 1)) (<= ?x29 1))))
(not $x112)))))))))
(check-sat)

; crossing_1_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x24 (+ ?x8 3)))
 (> ?x24 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x24 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x55 (- (+ ?x24 0) ?x139)))
(let ((?x29 (- ?x55 ?x24)))
(let (($x112 (and (>= ?x55 0) (>= ?x29 (- 1)) (<= ?x29 1))))
(not $x112)))))))))
(check-sat)

; crossing_1_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x24 (+ ?x8 3)))
 (> ?x24 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x24 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x139 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x55 (- (+ ?x24 0) ?x139)))
(let ((?x29 (- ?x55 ?x24)))
(let (($x112 (and (>= ?x55 0) (>= ?x29 (- 1)) (<= ?x29 1))))
(not $x112)))))))))
(check-sat)

; crossing_2_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x87 (+ ?x8 0)))
 (> ?x87 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x87 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x67 (- (+ ?x87 0) ?x48)))
(let ((?x138 (- ?x67 ?x87)))
(let (($x83 (and (>= ?x67 0) (>= ?x138 (- 1)) (<= ?x138 1))))
(not $x83)))))))))
(check-sat)

; crossing_2_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x87 (+ ?x8 0)))
 (> ?x87 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x87 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x67 (- (+ ?x87 0) ?x48)))
(let ((?x138 (- ?x67 ?x87)))
(let (($x83 (and (>= ?x67 0) (>= ?x138 (- 1)) (<= ?x138 1))))
(not $x83)))))))))
(check-sat)

; crossing_2_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x87 (+ ?x8 0)))
 (> ?x87 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x87 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x67 (- (+ ?x87 0) ?x48)))
(let ((?x138 (- ?x67 ?x87)))
(let (($x83 (and (>= ?x67 0) (>= ?x138 (- 1)) (<= ?x138 1))))
(not $x83)))))))))
(check-sat)

; crossing_2_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x87 (+ ?x8 0)))
 (> ?x87 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x87 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x67 (- (+ ?x87 0) ?x48)))
(let ((?x138 (- ?x67 ?x87)))
(let (($x83 (and (>= ?x67 0) (>= ?x138 (- 1)) (<= ?x138 1))))
(not $x83)))))))))
(check-sat)

; crossing_2_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x56 (+ ?x8 1)))
 (> ?x56 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x56 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x69 (- (+ ?x56 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x48)))
(let ((?x98 (- ?x69 ?x56)))
(let (($x111 (and (>= ?x69 0) (>= ?x98 (- 1)) (<= ?x98 1))))
(not $x111)))))))))
(check-sat)

; crossing_2_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x56 (+ ?x8 1)))
 (> ?x56 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x56 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x69 (- (+ ?x56 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x48)))
(let ((?x98 (- ?x69 ?x56)))
(let (($x111 (and (>= ?x69 0) (>= ?x98 (- 1)) (<= ?x98 1))))
(not $x111)))))))))
(check-sat)

; crossing_2_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x56 (+ ?x8 1)))
 (> ?x56 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x56 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x69 (- (+ ?x56 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x48)))
(let ((?x98 (- ?x69 ?x56)))
(let (($x111 (and (>= ?x69 0) (>= ?x98 (- 1)) (<= ?x98 1))))
(not $x111)))))))))
(check-sat)

; crossing_2_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x56 (+ ?x8 1)))
 (> ?x56 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x56 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x69 (- (+ ?x56 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x48)))
(let ((?x98 (- ?x69 ?x56)))
(let (($x111 (and (>= ?x69 0) (>= ?x98 (- 1)) (<= ?x98 1))))
(not $x111)))))))))
(check-sat)

; crossing_2_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x51 (+ ?x8 2)))
 (> ?x51 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x51 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x156 (- (+ ?x51 0) ?x48)))
(let ((?x75 (- ?x156 ?x51)))
(let (($x105 (and (>= ?x156 0) (>= ?x75 (- 1)) (<= ?x75 1))))
(not $x105)))))))))
(check-sat)

; crossing_2_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x51 (+ ?x8 2)))
 (> ?x51 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x51 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x156 (- (+ ?x51 0) ?x48)))
(let ((?x75 (- ?x156 ?x51)))
(let (($x105 (and (>= ?x156 0) (>= ?x75 (- 1)) (<= ?x75 1))))
(not $x105)))))))))
(check-sat)

; crossing_2_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x51 (+ ?x8 2)))
 (> ?x51 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x51 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x156 (- (+ ?x51 0) ?x48)))
(let ((?x75 (- ?x156 ?x51)))
(let (($x105 (and (>= ?x156 0) (>= ?x75 (- 1)) (<= ?x75 1))))
(not $x105)))))))))
(check-sat)

; crossing_2_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x51 (+ ?x8 2)))
 (> ?x51 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x51 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x156 (- (+ ?x51 0) ?x48)))
(let ((?x75 (- ?x156 ?x51)))
(let (($x105 (and (>= ?x156 0) (>= ?x75 (- 1)) (<= ?x75 1))))
(not $x105)))))))))
(check-sat)

; crossing_2_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x160 (+ ?x8 3)))
 (> ?x160 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x160 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x106 (- (+ ?x160 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x48)))
(let ((?x66 (- ?x106 ?x160)))
(let (($x37 (and (>= ?x106 0) (>= ?x66 (- 1)) (<= ?x66 1))))
(not $x37)))))))))
(check-sat)

; crossing_2_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x160 (+ ?x8 3)))
 (> ?x160 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x160 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x106 (- (+ ?x160 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x48)))
(let ((?x66 (- ?x106 ?x160)))
(let (($x37 (and (>= ?x106 0) (>= ?x66 (- 1)) (<= ?x66 1))))
(not $x37)))))))))
(check-sat)

; crossing_2_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x160 (+ ?x8 3)))
 (> ?x160 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x160 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x106 (- (+ ?x160 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x48)))
(let ((?x66 (- ?x106 ?x160)))
(let (($x37 (and (>= ?x106 0) (>= ?x66 (- 1)) (<= ?x66 1))))
(not $x37)))))))))
(check-sat)

; crossing_2_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x160 (+ ?x8 3)))
 (> ?x160 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x160 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x48 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 0))))
(let ((?x106 (- (+ ?x160 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x48)))
(let ((?x66 (- ?x106 ?x160)))
(let (($x37 (and (>= ?x106 0) (>= ?x66 (- 1)) (<= ?x66 1))))
(not $x37)))))))))
(check-sat)

; crossing_3_0_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x133 (+ ?x8 0)))
 (> ?x133 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x133 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x90 (- (+ ?x133 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x41)))
(let ((?x40 (- ?x90 ?x133)))
(let (($x35 (and (>= ?x90 0) (>= ?x40 (- 1)) (<= ?x40 1))))
(not $x35)))))))))
(check-sat)

; crossing_3_0_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x133 (+ ?x8 0)))
 (> ?x133 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x133 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x90 (- (+ ?x133 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x41)))
(let ((?x40 (- ?x90 ?x133)))
(let (($x35 (and (>= ?x90 0) (>= ?x40 (- 1)) (<= ?x40 1))))
(not $x35)))))))))
(check-sat)

; crossing_3_0_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x133 (+ ?x8 0)))
 (> ?x133 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x133 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x90 (- (+ ?x133 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x41)))
(let ((?x40 (- ?x90 ?x133)))
(let (($x35 (and (>= ?x90 0) (>= ?x40 (- 1)) (<= ?x40 1))))
(not $x35)))))))))
(check-sat)

; crossing_3_0_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x133 (+ ?x8 0)))
 (> ?x133 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x133 (+ ?x8 0)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x90 (- (+ ?x133 (ite (and (= fraction 0.0) false) (- 1) 1)) ?x41)))
(let ((?x40 (- ?x90 ?x133)))
(let (($x35 (and (>= ?x90 0) (>= ?x40 (- 1)) (<= ?x40 1))))
(not $x35)))))))))
(check-sat)

; crossing_3_1_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x138 (+ ?x8 1)))
 (> ?x138 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x138 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x136 (- (+ ?x138 0) ?x41)))
(let ((?x69 (- ?x136 ?x138)))
(let (($x98 (and (>= ?x136 0) (>= ?x69 (- 1)) (<= ?x69 1))))
(not $x98)))))))))
(check-sat)

; crossing_3_1_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x138 (+ ?x8 1)))
 (> ?x138 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x138 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x136 (- (+ ?x138 0) ?x41)))
(let ((?x69 (- ?x136 ?x138)))
(let (($x98 (and (>= ?x136 0) (>= ?x69 (- 1)) (<= ?x69 1))))
(not $x98)))))))))
(check-sat)

; crossing_3_1_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x138 (+ ?x8 1)))
 (> ?x138 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x138 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x136 (- (+ ?x138 0) ?x41)))
(let ((?x69 (- ?x136 ?x138)))
(let (($x98 (and (>= ?x136 0) (>= ?x69 (- 1)) (<= ?x69 1))))
(not $x98)))))))))
(check-sat)

; crossing_3_1_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x138 (+ ?x8 1)))
 (> ?x138 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x138 (+ ?x8 1)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x136 (- (+ ?x138 0) ?x41)))
(let ((?x69 (- ?x136 ?x138)))
(let (($x98 (and (>= ?x136 0) (>= ?x69 (- 1)) (<= ?x69 1))))
(not $x98)))))))))
(check-sat)

; crossing_3_2_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x50 (+ ?x8 2)))
 (> ?x50 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x50 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x116 (- (+ ?x50 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x41)))
(let ((?x56 (- ?x116 ?x50)))
(let (($x27 (and (>= ?x116 0) (>= ?x56 (- 1)) (<= ?x56 1))))
(not $x27)))))))))
(check-sat)

; crossing_3_2_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x50 (+ ?x8 2)))
 (> ?x50 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x50 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x116 (- (+ ?x50 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x41)))
(let ((?x56 (- ?x116 ?x50)))
(let (($x27 (and (>= ?x116 0) (>= ?x56 (- 1)) (<= ?x56 1))))
(not $x27)))))))))
(check-sat)

; crossing_3_2_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x50 (+ ?x8 2)))
 (> ?x50 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x50 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x116 (- (+ ?x50 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x41)))
(let ((?x56 (- ?x116 ?x50)))
(let (($x27 (and (>= ?x116 0) (>= ?x56 (- 1)) (<= ?x56 1))))
(not $x27)))))))))
(check-sat)

; crossing_3_2_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x50 (+ ?x8 2)))
 (> ?x50 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x50 (+ ?x8 2)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x116 (- (+ ?x50 (ite (and (= fraction 0.0) true) (- 1) 1)) ?x41)))
(let ((?x56 (- ?x116 ?x50)))
(let (($x27 (and (>= ?x116 0) (>= ?x56 (- 1)) (<= ?x56 1))))
(not $x27)))))))))
(check-sat)

; crossing_3_3_0
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= fraction 0.0))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x66 (+ ?x8 3)))
 (> ?x66 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x66 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x143 (- (+ ?x66 0) ?x41)))
(let ((?x29 (- ?x143 ?x66)))
(let (($x99 (and (>= ?x143 0) (>= ?x29 (- 1)) (<= ?x29 1))))
(not $x99)))))))))
(check-sat)

; crossing_3_3_1
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x15 (> (/ 1.0 2.0) fraction)))
 (and (> fraction 0.0) $x15)))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x66 (+ ?x8 3)))
 (> ?x66 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x66 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x143 (- (+ ?x66 0) ?x41)))
(let ((?x29 (- ?x143 ?x66)))
(let (($x99 (and (>= ?x143 0) (>= ?x29 (- 1)) (<= ?x29 1))))
(not $x99)))))))))
(check-sat)

; crossing_3_3_2
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (= (/ 1.0 2.0) fraction))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x66 (+ ?x8 3)))
 (> ?x66 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x66 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x143 (- (+ ?x66 0) ?x41)))
(let ((?x29 (- ?x143 ?x66)))
(let (($x99 (and (>= ?x143 0) (>= ?x29 (- 1)) (<= ?x29 1))))
(not $x99)))))))))
(check-sat)

; crossing_3_3_3
(reset)
; benchmark generated from python API
(set-info :status unknown)
(declare-fun gap_quotient () Int)
(declare-fun fraction () Real)
(assert
 (>= gap_quotient 0))
(assert
 (let (($x18 (< (/ 1.0 2.0) fraction)))
 (and $x18 (< fraction 1.0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
 (let ((?x66 (+ ?x8 3)))
 (> ?x66 0))))
(assert
 (let ((?x8 (* 4 gap_quotient)))
(let ((?x66 (+ ?x8 3)))
(let (($x15 (> (/ 1.0 2.0) fraction)))
(let ((?x41 (ite $x15 0 (ite (< (/ 1.0 2.0) fraction) 1 1))))
(let ((?x143 (- (+ ?x66 0) ?x41)))
(let ((?x29 (- ?x143 ?x66)))
(let (($x99 (and (>= ?x143 0) (>= ?x29 (- 1)) (<= ?x29 1))))
(not $x99)))))))))
(check-sat)
