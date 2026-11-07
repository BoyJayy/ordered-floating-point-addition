	.build_version macos, 26, 0	sdk_version 26, 5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	sub	sp, sp, #2512
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	mov	w0, #0                          ; =0x0
	bl	_fesetround
	cbnz	w0, LBB0_2
; %bb.1:
	bl	_fegetround
	cbz	w0, LBB0_4
LBB0_2:
	mov	w0, #2                          ; =0x2
LBB0_3:
	add	sp, sp, #2512
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_4:
	mov	w8, #10483                      ; =0x28f3
	movk	w8, #309, lsl #16
	str	x8, [sp, #8]
	mov	w9, #1                          ; =0x1
	mov	x10, #32557                     ; =0x7f2d
	movk	x10, #19605, lsl #16
	movk	x10, #62509, lsl #32
	movk	x10, #22609, lsl #48
	add	x11, sp, #8
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	eor	x8, x8, x8, lsr #62
	madd	x8, x8, x10, x9
	str	x8, [x11, x9, lsl #3]
	add	x9, x9, #1
	cmp	x9, #312
	b.ne	LBB0_5
; %bb.6:
	str	xzr, [sp, #2504]
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	add	x1, sp, #8
	bl	__Z8validateIDF16_Lj11EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	add	x1, sp, #8
	bl	__Z8validateIfLj24EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
Lloh4:
	adrp	x0, l_.str.2@PAGE
Lloh5:
	add	x0, x0, l_.str.2@PAGEOFF
	add	x1, sp, #8
	bl	__Z8validateIdLj53EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
	mov	w0, #0                          ; =0x0
	b	LBB0_3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function _Z8validateIDF16_Lj11EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
lCPI1_0:
	.quad	8                               ; 0x8
	.quad	2044                            ; 0x7fc
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z8validateIDF16_Lj11EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
	.weak_def_can_be_hidden	__Z8validateIDF16_Lj11EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
	.p2align	2
__Z8validateIDF16_Lj11EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE: ; @_Z8validateIDF16_Lj11EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	sub	sp, sp, #352
	stp	d9, d8, [sp, #240]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #256]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #272]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #288]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #304]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #320]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #336]            ; 16-byte Folded Spill
	add	x29, sp, #336
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	mov	x20, x1
	str	x0, [sp, #64]                   ; 8-byte Folded Spill
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	str	x0, [sp, #56]                   ; 8-byte Folded Spill
	stp	xzr, xzr, [sp, #128]            ; 16-byte Folded Spill
	mov	x9, #0                          ; =0x0
	sub	x8, x29, #128
	add	x8, x8, #8
	str	x8, [sp, #120]                  ; 8-byte Folded Spill
Lloh6:
	adrp	x8, lCPI1_0@PAGE
Lloh7:
	ldr	q0, [x8, lCPI1_0@PAGEOFF]
	str	q0, [sp, #80]                   ; 16-byte Folded Spill
	b	LBB1_2
LBB1_1:                                 ;   in Loop: Header=BB1_2 Depth=1
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	cmp	x9, #28
	b.eq	LBB1_88
LBB1_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_4 Depth 2
                                        ;       Child Loop BB1_8 Depth 3
                                        ;         Child Loop BB1_11 Depth 4
                                        ;       Child Loop BB1_24 Depth 3
                                        ;       Child Loop BB1_48 Depth 3
                                        ;       Child Loop BB1_72 Depth 3
                                        ;       Child Loop BB1_78 Depth 3
                                        ;         Child Loop BB1_80 Depth 4
	mov	w19, #0                         ; =0x0
Lloh8:
	adrp	x8, l_constinit.7@PAGE
Lloh9:
	add	x8, x8, l_constinit.7@PAGEOFF
	ldr	w10, [x8, x9]
	cmp	w10, #510
	mov	w8, #510                        ; =0x1fe
	str	w10, [sp, #108]                 ; 4-byte Folded Spill
	csel	w8, w10, w8, lo
	str	x8, [sp, #144]                  ; 8-byte Folded Spill
	add	x9, x9, #4
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	b	LBB1_4
LBB1_3:                                 ;   in Loop: Header=BB1_4 Depth=2
	ldur	x1, [x29, #-120]
	sub	x0, x29, #128
	bl	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	add	w19, w19, #1
	cmp	w19, #4
	b.eq	LBB1_1
LBB1_4:                                 ;   Parent Loop BB1_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB1_8 Depth 3
                                        ;         Child Loop BB1_11 Depth 4
                                        ;       Child Loop BB1_24 Depth 3
                                        ;       Child Loop BB1_48 Depth 3
                                        ;       Child Loop BB1_72 Depth 3
                                        ;       Child Loop BB1_78 Depth 3
                                        ;         Child Loop BB1_80 Depth 4
	str	w19, [sp, #104]                 ; 4-byte Folded Spill
	ldr	x8, [sp, #120]                  ; 8-byte Folded Reload
	stp	xzr, xzr, [x8]
	mov	x1, x8
	stur	x8, [x29, #-128]
	ldr	w8, [sp, #108]                  ; 4-byte Folded Reload
	cbz	w8, LBB1_19
; %bb.5:                                ;   in Loop: Header=BB1_4 Depth=2
	mov	x8, #0                          ; =0x0
	b	LBB1_8
LBB1_6:                                 ;   in Loop: Header=BB1_8 Depth=3
	ldur	x0, [x29, #-120]
	bl	__ZNSt3__127__tree_balance_after_insertB9nqe210106IPNS_16__tree_node_baseIPvEEEEvT_S5_
	ldur	x8, [x29, #-112]
	add	x8, x8, #1
	stur	x8, [x29, #-112]
LBB1_7:                                 ;   in Loop: Header=BB1_8 Depth=3
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	cmp	x8, x9
	b.hs	LBB1_18
LBB1_8:                                 ;   Parent Loop BB1_2 Depth=1
                                        ;     Parent Loop BB1_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_11 Depth 4
	ldr	x9, [x20, #2496]
	add	x10, x9, #1
	lsr	x11, x10, #3
	mov	x15, #3361                      ; =0xd21
	movk	x15, #8402, lsl #16
	movk	x15, #53773, lsl #32
	movk	x15, #3360, lsl #48
	umulh	x11, x11, x15
	lsr	x11, x11, #1
	mov	w16, #312                       ; =0x138
	msub	x10, x11, x16, x10
	ldr	x11, [x20, x9, lsl #3]
	and	x11, x11, #0xffffffff80000000
	ldr	x12, [x20, x10, lsl #3]
	and	x13, x12, #0x7ffffffe
	orr	x11, x13, x11
	add	x13, x9, #156
	lsr	x14, x13, #3
	umulh	x14, x14, x15
	lsr	x14, x14, #1
	msub	x13, x14, x16, x13
	ldr	x13, [x20, x13, lsl #3]
	tst	w12, #0x1
	mov	x12, #6633                      ; =0x19e9
	movk	x12, #43366, lsl #16
	movk	x12, #28506, lsl #32
	movk	x12, #46338, lsl #48
	csel	x12, x12, xzr, ne
	eor	x12, x12, x13
	eor	x11, x12, x11, lsr #1
	str	x11, [x20, x9, lsl #3]
	mov	x9, #6148914691236517205        ; =0x5555555555555555
	and	x9, x9, #0xfffffffff
	and	x9, x9, x11, lsr #29
	eor	x9, x9, x11
	str	x10, [x20, #2496]
	mov	x10, #3987079168                ; =0xeda60000
	movk	x10, #32767, lsl #32
	movk	x10, #29142, lsl #48
	and	x10, x10, x9, lsl #17
	eor	x9, x10, x9
	mov	x10, #262645840084992           ; =0xeee000000000
	movk	x10, #65527, lsl #48
	and	x10, x10, x9, lsl #37
	eor	x9, x10, x9
	eor	x9, x9, x9, lsr #43
	mov	x10, #-9187201950435737472      ; =0x8080808080808080
	movk	x10, #32897
	umulh	x10, x9, x10
	lsr	x10, x10, #8
	mov	w11, #510                       ; =0x1fe
	msub	x9, x10, x11, x9
	lsl	x9, x9, #2
	add	x21, x9, #8
	ldur	x23, [x29, #-120]
	ldr	x22, [sp, #120]                 ; 8-byte Folded Reload
	mov	x24, x22
	cbz	x23, LBB1_15
; %bb.9:                                ;   in Loop: Header=BB1_8 Depth=3
	mov	x9, x23
	b	LBB1_11
LBB1_10:                                ;   in Loop: Header=BB1_11 Depth=4
	ldr	x9, [x22]
	mov	x24, x22
	cbz	x9, LBB1_15
LBB1_11:                                ;   Parent Loop BB1_2 Depth=1
                                        ;     Parent Loop BB1_4 Depth=2
                                        ;       Parent Loop BB1_8 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	mov	x22, x9
	ldr	x9, [x9, #32]
	cmp	x21, x9
	b.lo	LBB1_10
; %bb.12:                               ;   in Loop: Header=BB1_11 Depth=4
	cmp	x9, x21
	b.hs	LBB1_7
; %bb.13:                               ;   in Loop: Header=BB1_11 Depth=4
	ldr	x9, [x22, #8]
	cbnz	x9, LBB1_11
; %bb.14:                               ;   in Loop: Header=BB1_8 Depth=3
	add	x24, x22, #8
LBB1_15:                                ;   in Loop: Header=BB1_8 Depth=3
Ltmp0:
	mov	w0, #40                         ; =0x28
	bl	__Znwm
	mov	x1, x0
Ltmp1:
; %bb.16:                               ;   in Loop: Header=BB1_8 Depth=3
	str	x21, [x1, #32]
	stp	xzr, xzr, [x1]
	str	x22, [x1, #16]
	str	x1, [x24]
	ldur	x8, [x29, #-128]
	ldr	x8, [x8]
	cbz	x8, LBB1_6
; %bb.17:                               ;   in Loop: Header=BB1_8 Depth=3
	stur	x8, [x29, #-128]
	b	LBB1_6
LBB1_18:                                ;   in Loop: Header=BB1_4 Depth=2
	ldur	x1, [x29, #-128]
LBB1_19:                                ;   in Loop: Header=BB1_4 Depth=2
Ltmp3:
	sub	x0, x29, #152
	ldr	x2, [sp, #120]                  ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEEC2B9nqe210106INS_21__tree_const_iteratorIyPNS_11__tree_nodeIyPvEElEELi0EEET_SB_
Ltmp4:
; %bb.20:                               ;   in Loop: Header=BB1_4 Depth=2
	stp	xzr, xzr, [sp, #160]
	str	xzr, [sp, #176]
	ldr	w8, [sp, #108]                  ; 4-byte Folded Reload
	cbz	w8, LBB1_38
; %bb.21:                               ;   in Loop: Header=BB1_4 Depth=2
	mov	x22, #0                         ; =0x0
	mov	x21, #0                         ; =0x0
	b	LBB1_24
LBB1_22:                                ;   in Loop: Header=BB1_24 Depth=3
	str	h8, [x22], #2
LBB1_23:                                ;   in Loop: Header=BB1_24 Depth=3
	str	x22, [sp, #168]
	add	x21, x21, #1
	ldr	x8, [sp, #144]                  ; 8-byte Folded Reload
	cmp	x8, x21
	b.eq	LBB1_37
LBB1_24:                                ;   Parent Loop BB1_2 Depth=1
                                        ;     Parent Loop BB1_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	tst	x21, #0x1
	mov	w8, #2052                       ; =0x804
	mov	w9, #2049                       ; =0x801
	csel	x8, x9, x8, eq
	ldur	x9, [x29, #-152]
	ldr	x9, [x9, x21, lsl #3]
	sub	x26, x8, x9
	ucvtf	h8, x26
	ldr	x28, [sp, #176]
	cmp	x22, x28
	b.hs	LBB1_26
; %bb.25:                               ;   in Loop: Header=BB1_24 Depth=3
	str	h8, [x22], #2
	b	LBB1_31
LBB1_26:                                ;   in Loop: Header=BB1_24 Depth=3
	ldr	x23, [sp, #160]
	sub	x24, x22, x23
	asr	x25, x24, #1
	cmn	x25, #2
	b.le	LBB1_94
; %bb.27:                               ;   in Loop: Header=BB1_24 Depth=3
	add	x8, x25, #1
	sub	x9, x28, x23
	cmp	x9, x8
	csinc	x8, x9, x25, hi
	mov	x10, #9223372036854775806       ; =0x7ffffffffffffffe
	cmp	x9, x10
	mov	x9, #9223372036854775807        ; =0x7fffffffffffffff
	csel	x19, x8, x9, lo
	tbnz	x19, #63, LBB1_92
; %bb.28:                               ;   in Loop: Header=BB1_24 Depth=3
	lsl	x0, x19, #1
Ltmp6:
	bl	__Znwm
Ltmp7:
; %bb.29:                               ;   in Loop: Header=BB1_24 Depth=3
	add	x22, x0, x24
	add	x28, x0, x19, lsl #1
	sub	x25, x22, x25, lsl #1
	str	h8, [x22], #2
	mov	x0, x25
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	stp	x25, x22, [sp, #160]
	str	x28, [sp, #176]
	cbz	x23, LBB1_31
; %bb.30:                               ;   in Loop: Header=BB1_24 Depth=3
	mov	x0, x23
	bl	__ZdlPv
	ldr	x28, [sp, #176]
LBB1_31:                                ;   in Loop: Header=BB1_24 Depth=3
	str	x22, [sp, #168]
	neg	x8, x26
	scvtf	h8, x8
	cmp	x22, x28
	b.lo	LBB1_22
; %bb.32:                               ;   in Loop: Header=BB1_24 Depth=3
	ldr	x23, [sp, #160]
	sub	x24, x22, x23
	asr	x25, x24, #1
	cmn	x25, #2
	b.le	LBB1_93
; %bb.33:                               ;   in Loop: Header=BB1_24 Depth=3
	add	x8, x25, #1
	sub	x9, x28, x23
	cmp	x9, x8
	csinc	x8, x9, x25, hi
	mov	x10, #9223372036854775806       ; =0x7ffffffffffffffe
	cmp	x9, x10
	mov	x9, #9223372036854775807        ; =0x7fffffffffffffff
	csel	x19, x8, x9, lo
	tbnz	x19, #63, LBB1_95
; %bb.34:                               ;   in Loop: Header=BB1_24 Depth=3
	lsl	x0, x19, #1
Ltmp14:
	bl	__Znwm
Ltmp15:
; %bb.35:                               ;   in Loop: Header=BB1_24 Depth=3
	add	x22, x0, x24
	add	x19, x0, x19, lsl #1
	sub	x25, x22, x25, lsl #1
	str	h8, [x22], #2
	mov	x0, x25
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	stp	x25, x22, [sp, #160]
	str	x19, [sp, #176]
	cbz	x23, LBB1_23
; %bb.36:                               ;   in Loop: Header=BB1_24 Depth=3
	mov	x0, x23
	bl	__ZdlPv
	b	LBB1_23
LBB1_37:                                ;   in Loop: Header=BB1_4 Depth=2
	ldr	x8, [sp, #160]
	b	LBB1_39
LBB1_38:                                ;   in Loop: Header=BB1_4 Depth=2
	mov	x8, #0                          ; =0x0
	mov	x22, #0                         ; =0x0
LBB1_39:                                ;   in Loop: Header=BB1_4 Depth=2
	scvtf	h0, wzr
	str	h0, [sp, #158]
	sub	x9, x22, x8
	asr	x10, x9, #1
	cmp	x10, #1023
	b.hi	LBB1_41
; %bb.40:                               ;   in Loop: Header=BB1_4 Depth=2
	mov	w8, #1024                       ; =0x400
	sub	x1, x8, x10
Ltmp22:
	add	x0, sp, #160
	add	x2, sp, #158
	bl	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE8__appendEmRKDF16_
Ltmp23:
	b	LBB1_43
LBB1_41:                                ;   in Loop: Header=BB1_4 Depth=2
	cmp	x9, #2048
	b.eq	LBB1_43
; %bb.42:                               ;   in Loop: Header=BB1_4 Depth=2
	add	x8, x8, #2048
	str	x8, [sp, #168]
LBB1_43:                                ;   in Loop: Header=BB1_4 Depth=2
	scvtf	h0, wzr
	add	x0, sp, #160
	bl	__Z12ordered_foldIDF16_ET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	scvtf	h1, wzr
	fcmp	h0, h1
	b.ne	LBB1_103
; %bb.44:                               ;   in Loop: Header=BB1_4 Depth=2
Ltmp25:
	mov	w0, #16                         ; =0x10
	bl	__Znwm
Ltmp26:
; %bb.45:                               ;   in Loop: Header=BB1_4 Depth=2
	mov	x23, x0
	mov	x25, x0
	ldr	q0, [sp, #80]                   ; 16-byte Folded Reload
	str	q0, [x25], #16
	ldp	x22, x8, [x29, #-152]
	mov	x28, x25
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
	b	LBB1_48
LBB1_46:                                ;   in Loop: Header=BB1_48 Depth=3
	str	x21, [x25], #8
LBB1_47:                                ;   in Loop: Header=BB1_48 Depth=3
	add	x22, x22, #8
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
LBB1_48:                                ;   Parent Loop BB1_2 Depth=1
                                        ;     Parent Loop BB1_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	cmp	x22, x8
	b.eq	LBB1_69
; %bb.49:                               ;   in Loop: Header=BB1_48 Depth=3
	ldr	x21, [x22]
	cmp	x25, x28
	b.hs	LBB1_51
; %bb.50:                               ;   in Loop: Header=BB1_48 Depth=3
	str	x21, [x25]
	b	LBB1_55
LBB1_51:                                ;   in Loop: Header=BB1_48 Depth=3
	sub	x24, x25, x23
	asr	x26, x24, #3
	add	x8, x26, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB1_96
; %bb.52:                               ;   in Loop: Header=BB1_48 Depth=3
	sub	x9, x28, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x19, x8, x9, lo
	lsr	x8, x19, #61
	cbnz	x8, LBB1_97
; %bb.53:                               ;   in Loop: Header=BB1_48 Depth=3
	lsl	x0, x19, #3
Ltmp28:
	bl	__Znwm
Ltmp29:
; %bb.54:                               ;   in Loop: Header=BB1_48 Depth=3
	mov	x28, x0
	add	x25, x0, x24
	str	x21, [x25]
	sub	x26, x25, x26, lsl #3
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x28, x28, x19, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
LBB1_55:                                ;   in Loop: Header=BB1_48 Depth=3
	add	x8, x25, #8
	cmp	x21, #8
	b.ls	LBB1_58
; %bb.56:                               ;   in Loop: Header=BB1_48 Depth=3
	sub	x27, x21, #4
	cmp	x8, x28
	b.hs	LBB1_59
; %bb.57:                               ;   in Loop: Header=BB1_48 Depth=3
	str	x27, [x25, #8]
	add	x25, x25, #16
	b	LBB1_63
LBB1_58:                                ;   in Loop: Header=BB1_48 Depth=3
	add	x21, x21, #4
	mov	x25, x8
	b	LBB1_64
LBB1_59:                                ;   in Loop: Header=BB1_48 Depth=3
	sub	x24, x8, x23
	asr	x26, x24, #3
	add	x8, x26, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB1_100
; %bb.60:                               ;   in Loop: Header=BB1_48 Depth=3
	sub	x9, x28, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x19, x8, x9, lo
	lsr	x8, x19, #61
	cbnz	x8, LBB1_101
; %bb.61:                               ;   in Loop: Header=BB1_48 Depth=3
	lsl	x0, x19, #3
Ltmp36:
	bl	__Znwm
Ltmp37:
; %bb.62:                               ;   in Loop: Header=BB1_48 Depth=3
	mov	x28, x0
	add	x25, x0, x24
	sub	x26, x25, x26, lsl #3
	str	x27, [x25], #8
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x28, x28, x19, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
LBB1_63:                                ;   in Loop: Header=BB1_48 Depth=3
	add	x21, x21, #4
	cmp	x21, #2047
	b.hi	LBB1_47
LBB1_64:                                ;   in Loop: Header=BB1_48 Depth=3
	cmp	x25, x28
	b.lo	LBB1_46
; %bb.65:                               ;   in Loop: Header=BB1_48 Depth=3
	sub	x24, x25, x23
	asr	x19, x24, #3
	add	x8, x19, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB1_98
; %bb.66:                               ;   in Loop: Header=BB1_48 Depth=3
	sub	x9, x28, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x27, x8, x9, lo
	lsr	x8, x27, #61
	cbnz	x8, LBB1_99
; %bb.67:                               ;   in Loop: Header=BB1_48 Depth=3
	lsl	x0, x27, #3
Ltmp44:
	bl	__Znwm
Ltmp45:
; %bb.68:                               ;   in Loop: Header=BB1_48 Depth=3
	mov	x28, x0
	add	x25, x0, x24
	sub	x26, x25, x19, lsl #3
	str	x21, [x25], #8
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x28, x28, x27, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
	b	LBB1_47
LBB1_69:                                ;   in Loop: Header=BB1_4 Depth=2
	mov	w21, #512                       ; =0x200
	b	LBB1_72
LBB1_70:                                ;   in Loop: Header=BB1_72 Depth=3
	str	x26, [x25]
	mov	x22, x25
LBB1_71:                                ;   in Loop: Header=BB1_72 Depth=3
	add	x25, x22, #8
	subs	w21, w21, #1
	b.eq	LBB1_77
LBB1_72:                                ;   Parent Loop BB1_2 Depth=1
                                        ;     Parent Loop BB1_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	x8, [x20, #2496]
	add	x9, x8, #1
	lsr	x10, x9, #3
	mov	x14, #3361                      ; =0xd21
	movk	x14, #8402, lsl #16
	movk	x14, #53773, lsl #32
	movk	x14, #3360, lsl #48
	umulh	x10, x10, x14
	lsr	x10, x10, #1
	mov	w15, #312                       ; =0x138
	msub	x9, x10, x15, x9
	ldr	x10, [x20, x8, lsl #3]
	ldr	x11, [x20, x9, lsl #3]
	and	x10, x10, #0xffffffff80000000
	and	x12, x11, #0x7ffffffe
	orr	x10, x12, x10
	add	x12, x8, #156
	lsr	x13, x12, #3
	umulh	x13, x13, x14
	lsr	x13, x13, #1
	msub	x12, x13, x15, x12
	ldr	x12, [x20, x12, lsl #3]
	tst	w11, #0x1
	mov	x11, #6633                      ; =0x19e9
	movk	x11, #43366, lsl #16
	movk	x11, #28506, lsl #32
	movk	x11, #46338, lsl #48
	csel	x11, x11, xzr, ne
	eor	x11, x11, x12
	eor	x10, x11, x10, lsr #1
	str	x10, [x20, x8, lsl #3]
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	and	x8, x8, #0xfffffffff
	and	x8, x8, x10, lsr #29
	eor	x8, x8, x10
	str	x9, [x20, #2496]
	mov	x9, #3987079168                 ; =0xeda60000
	movk	x9, #32767, lsl #32
	movk	x9, #29142, lsl #48
	and	x9, x9, x8, lsl #17
	eor	x8, x9, x8
	mov	x9, #262645840084992            ; =0xeee000000000
	movk	x9, #65527, lsl #48
	and	x9, x9, x8, lsl #37
	eor	x8, x9, x8
	eor	x8, x8, x8, lsr #43
	mov	x9, #-9187201950435737472       ; =0x8080808080808080
	movk	x9, #32897
	umulh	x9, x8, x9
	lsr	x9, x9, #8
	mov	w10, #510                       ; =0x1fe
	msub	x8, x9, x10, x8
	lsl	x8, x8, #2
	add	x26, x8, #8
	cmp	x25, x28
	b.lo	LBB1_70
; %bb.73:                               ;   in Loop: Header=BB1_72 Depth=3
	sub	x24, x25, x23
	asr	x27, x24, #3
	add	x8, x27, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB1_90
; %bb.74:                               ;   in Loop: Header=BB1_72 Depth=3
	sub	x9, x28, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x19, x8, x9, lo
	lsr	x8, x19, #61
	cbnz	x8, LBB1_91
; %bb.75:                               ;   in Loop: Header=BB1_72 Depth=3
	lsl	x0, x19, #3
Ltmp52:
	bl	__Znwm
Ltmp53:
; %bb.76:                               ;   in Loop: Header=BB1_72 Depth=3
	mov	x25, x0
	add	x22, x0, x24
	str	x26, [x22]
	sub	x26, x22, x27, lsl #3
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x28, x25, x19, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
	b	LBB1_71
LBB1_77:                                ;   in Loop: Header=BB1_4 Depth=2
	mov	x21, x23
	cmp	x23, x25
	b.eq	LBB1_84
LBB1_78:                                ;   Parent Loop BB1_2 Depth=1
                                        ;     Parent Loop BB1_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB1_80 Depth 4
	ldr	x24, [x21]
	ldp	x8, x9, [x29, #-152]
	subs	x9, x9, x8
	b.eq	LBB1_81
; %bb.79:                               ;   in Loop: Header=BB1_78 Depth=3
	asr	x10, x9, #3
	mov	x9, x8
LBB1_80:                                ;   Parent Loop BB1_2 Depth=1
                                        ;     Parent Loop BB1_4 Depth=2
                                        ;       Parent Loop BB1_78 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	lsr	x11, x10, #1
	add	x12, x9, x11, lsl #3
	ldr	x13, [x12], #8
	mvn	x14, x11
	add	x10, x10, x14
	cmp	x24, x13
	csel	x9, x9, x12, lo
	csel	x10, x11, x10, lo
	cbnz	x10, LBB1_80
	b	LBB1_82
LBB1_81:                                ;   in Loop: Header=BB1_78 Depth=3
	mov	x9, x8
LBB1_82:                                ;   in Loop: Header=BB1_78 Depth=3
	sub	x8, x9, x8
	asr	x8, x8, #3
	and	x9, x8, #0x1
	cmp	x8, #0
	cneg	x25, x9, lt
	sub	x19, x24, x25
	ucvtf	h0, x24
	add	x0, sp, #160
	bl	__Z12ordered_foldIDF16_ET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	ucvtf	h1, x19
	fcmp	h0, h1
	b.ne	LBB1_89
; %bb.83:                               ;   in Loop: Header=BB1_78 Depth=3
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	add	x9, x8, #1
	cmp	x25, #0
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	cinc	x8, x8, ne
	stp	x8, x9, [sp, #128]              ; 16-byte Folded Spill
	cmp	x21, x22
	add	x21, x21, #8
	b.ne	LBB1_78
LBB1_84:                                ;   in Loop: Header=BB1_4 Depth=2
	mov	x0, x23
	bl	__ZdlPv
	ldr	x0, [sp, #160]
	cbz	x0, LBB1_86
; %bb.85:                               ;   in Loop: Header=BB1_4 Depth=2
	str	x0, [sp, #168]
	bl	__ZdlPv
LBB1_86:                                ;   in Loop: Header=BB1_4 Depth=2
	ldur	x0, [x29, #-152]
	ldr	w19, [sp, #104]                 ; 4-byte Folded Reload
	cbz	x0, LBB1_3
; %bb.87:                               ;   in Loop: Header=BB1_4 Depth=2
	stur	x0, [x29, #-144]
	bl	__ZdlPv
	b	LBB1_3
LBB1_88:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	sub	x8, x0, x8
	str	x8, [sp, #40]
	ldp	x8, x9, [sp, #128]              ; 16-byte Folded Reload
	stp	x9, x8, [sp, #24]
	mov	w8, #28                         ; =0x1c
	str	x8, [sp, #16]
	mov	w8, #11                         ; =0xb
	str	x8, [sp, #8]
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	str	x8, [sp]
Lloh10:
	adrp	x0, l_.str.4@PAGE
Lloh11:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #336]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #320]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #304]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #288]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #272]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #256]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #240]              ; 16-byte Folded Reload
	add	sp, sp, #352
	ret
LBB1_89:
Lloh12:
	adrp	x8, ___stderrp@GOTPAGE
Lloh13:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh14:
	ldr	x0, [x8]
	fcvt	d0, h0
	str	d0, [sp, #24]
	stp	x24, x19, [sp, #8]
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	str	x8, [sp]
Lloh15:
	adrp	x1, l_.str.3@PAGE
Lloh16:
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
Ltmp60:
	mov	w0, #1                          ; =0x1
	bl	_exit
Ltmp61:
	b	LBB1_102
LBB1_90:
Ltmp57:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp58:
	b	LBB1_102
LBB1_91:
Ltmp55:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp56:
	b	LBB1_102
LBB1_92:
Ltmp9:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp10:
	b	LBB1_102
LBB1_93:
Ltmp19:
	bl	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE20__throw_length_errorB9nqe210106Ev
Ltmp20:
	b	LBB1_102
LBB1_94:
Ltmp11:
	bl	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE20__throw_length_errorB9nqe210106Ev
Ltmp12:
	b	LBB1_102
LBB1_95:
Ltmp17:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp18:
	b	LBB1_102
LBB1_96:
Ltmp33:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp34:
	b	LBB1_102
LBB1_97:
Ltmp31:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp32:
	b	LBB1_102
LBB1_98:
Ltmp49:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp50:
	b	LBB1_102
LBB1_99:
Ltmp47:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp48:
	b	LBB1_102
LBB1_100:
Ltmp41:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp42:
	b	LBB1_102
LBB1_101:
Ltmp39:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp40:
LBB1_102:
	brk	#0x1
LBB1_103:
	bl	_abort
LBB1_104:
Ltmp24:
	mov	x19, x0
	b	LBB1_122
LBB1_105:
Ltmp27:
	mov	x19, x0
	b	LBB1_122
LBB1_106:
Ltmp5:
	mov	x19, x0
	b	LBB1_126
LBB1_107:
Ltmp38:
	b	LBB1_121
LBB1_108:
Ltmp46:
	b	LBB1_121
LBB1_109:
Ltmp30:
	b	LBB1_121
LBB1_110:
Ltmp43:
	b	LBB1_121
LBB1_111:
Ltmp8:
	mov	x19, x0
	b	LBB1_122
LBB1_112:
Ltmp16:
	mov	x19, x0
	b	LBB1_122
LBB1_113:
Ltmp51:
	b	LBB1_121
LBB1_114:
Ltmp2:
	mov	x19, x0
	b	LBB1_127
LBB1_115:
Ltmp54:
	b	LBB1_121
LBB1_116:
Ltmp62:
	b	LBB1_121
LBB1_117:
Ltmp35:
	b	LBB1_121
LBB1_118:
Ltmp21:
	mov	x19, x0
	b	LBB1_122
LBB1_119:
Ltmp13:
	mov	x19, x0
	b	LBB1_122
LBB1_120:
Ltmp59:
LBB1_121:
	mov	x19, x0
	mov	x0, x23
	bl	__ZdlPv
LBB1_122:
	ldr	x0, [sp, #160]
	cbz	x0, LBB1_124
; %bb.123:
	str	x0, [sp, #168]
	bl	__ZdlPv
LBB1_124:
	ldur	x0, [x29, #-152]
	cbz	x0, LBB1_126
; %bb.125:
	stur	x0, [x29, #-144]
	bl	__ZdlPv
LBB1_126:
	ldur	x23, [x29, #-120]
LBB1_127:
	sub	x0, x29, #128
	mov	x1, x23
	bl	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpLdr	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh11
	.loh AdrpAdd	Lloh15, Lloh16
	.loh AdrpLdrGotLdr	Lloh12, Lloh13, Lloh14
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table1:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 1 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0             ;     jumps to Ltmp2
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp3-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp4-Ltmp3                    ;   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin0             ;     jumps to Ltmp5
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Ltmp7-Ltmp6                    ;   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp8-Lfunc_begin0             ;     jumps to Ltmp8
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp7-Lfunc_begin0             ; >> Call Site 4 <<
	.uleb128 Ltmp14-Ltmp7                   ;   Call between Ltmp7 and Ltmp14
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp14-Lfunc_begin0            ; >> Call Site 5 <<
	.uleb128 Ltmp15-Ltmp14                  ;   Call between Ltmp14 and Ltmp15
	.uleb128 Ltmp16-Lfunc_begin0            ;     jumps to Ltmp16
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp15-Lfunc_begin0            ; >> Call Site 6 <<
	.uleb128 Ltmp22-Ltmp15                  ;   Call between Ltmp15 and Ltmp22
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp22-Lfunc_begin0            ; >> Call Site 7 <<
	.uleb128 Ltmp23-Ltmp22                  ;   Call between Ltmp22 and Ltmp23
	.uleb128 Ltmp24-Lfunc_begin0            ;     jumps to Ltmp24
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp25-Lfunc_begin0            ; >> Call Site 8 <<
	.uleb128 Ltmp26-Ltmp25                  ;   Call between Ltmp25 and Ltmp26
	.uleb128 Ltmp27-Lfunc_begin0            ;     jumps to Ltmp27
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp28-Lfunc_begin0            ; >> Call Site 9 <<
	.uleb128 Ltmp29-Ltmp28                  ;   Call between Ltmp28 and Ltmp29
	.uleb128 Ltmp30-Lfunc_begin0            ;     jumps to Ltmp30
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp29-Lfunc_begin0            ; >> Call Site 10 <<
	.uleb128 Ltmp36-Ltmp29                  ;   Call between Ltmp29 and Ltmp36
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp36-Lfunc_begin0            ; >> Call Site 11 <<
	.uleb128 Ltmp37-Ltmp36                  ;   Call between Ltmp36 and Ltmp37
	.uleb128 Ltmp38-Lfunc_begin0            ;     jumps to Ltmp38
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp37-Lfunc_begin0            ; >> Call Site 12 <<
	.uleb128 Ltmp44-Ltmp37                  ;   Call between Ltmp37 and Ltmp44
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp44-Lfunc_begin0            ; >> Call Site 13 <<
	.uleb128 Ltmp45-Ltmp44                  ;   Call between Ltmp44 and Ltmp45
	.uleb128 Ltmp46-Lfunc_begin0            ;     jumps to Ltmp46
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp45-Lfunc_begin0            ; >> Call Site 14 <<
	.uleb128 Ltmp52-Ltmp45                  ;   Call between Ltmp45 and Ltmp52
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp52-Lfunc_begin0            ; >> Call Site 15 <<
	.uleb128 Ltmp53-Ltmp52                  ;   Call between Ltmp52 and Ltmp53
	.uleb128 Ltmp54-Lfunc_begin0            ;     jumps to Ltmp54
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp53-Lfunc_begin0            ; >> Call Site 16 <<
	.uleb128 Ltmp60-Ltmp53                  ;   Call between Ltmp53 and Ltmp60
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp60-Lfunc_begin0            ; >> Call Site 17 <<
	.uleb128 Ltmp61-Ltmp60                  ;   Call between Ltmp60 and Ltmp61
	.uleb128 Ltmp62-Lfunc_begin0            ;     jumps to Ltmp62
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp57-Lfunc_begin0            ; >> Call Site 18 <<
	.uleb128 Ltmp56-Ltmp57                  ;   Call between Ltmp57 and Ltmp56
	.uleb128 Ltmp59-Lfunc_begin0            ;     jumps to Ltmp59
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp9-Lfunc_begin0             ; >> Call Site 19 <<
	.uleb128 Ltmp10-Ltmp9                   ;   Call between Ltmp9 and Ltmp10
	.uleb128 Ltmp13-Lfunc_begin0            ;     jumps to Ltmp13
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp19-Lfunc_begin0            ; >> Call Site 20 <<
	.uleb128 Ltmp20-Ltmp19                  ;   Call between Ltmp19 and Ltmp20
	.uleb128 Ltmp21-Lfunc_begin0            ;     jumps to Ltmp21
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp11-Lfunc_begin0            ; >> Call Site 21 <<
	.uleb128 Ltmp12-Ltmp11                  ;   Call between Ltmp11 and Ltmp12
	.uleb128 Ltmp13-Lfunc_begin0            ;     jumps to Ltmp13
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp17-Lfunc_begin0            ; >> Call Site 22 <<
	.uleb128 Ltmp18-Ltmp17                  ;   Call between Ltmp17 and Ltmp18
	.uleb128 Ltmp21-Lfunc_begin0            ;     jumps to Ltmp21
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp33-Lfunc_begin0            ; >> Call Site 23 <<
	.uleb128 Ltmp32-Ltmp33                  ;   Call between Ltmp33 and Ltmp32
	.uleb128 Ltmp35-Lfunc_begin0            ;     jumps to Ltmp35
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp49-Lfunc_begin0            ; >> Call Site 24 <<
	.uleb128 Ltmp48-Ltmp49                  ;   Call between Ltmp49 and Ltmp48
	.uleb128 Ltmp51-Lfunc_begin0            ;     jumps to Ltmp51
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp41-Lfunc_begin0            ; >> Call Site 25 <<
	.uleb128 Ltmp40-Ltmp41                  ;   Call between Ltmp41 and Ltmp40
	.uleb128 Ltmp43-Lfunc_begin0            ;     jumps to Ltmp43
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp40-Lfunc_begin0            ; >> Call Site 26 <<
	.uleb128 Lfunc_end0-Ltmp40              ;   Call between Ltmp40 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function _Z8validateIfLj24EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
lCPI2_0:
	.quad	8                               ; 0x8
	.quad	16777212                        ; 0xfffffc
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z8validateIfLj24EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
	.weak_def_can_be_hidden	__Z8validateIfLj24EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
	.p2align	2
__Z8validateIfLj24EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE: ; @_Z8validateIfLj24EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	sub	sp, sp, #352
	stp	d9, d8, [sp, #240]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #256]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #272]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #288]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #304]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #320]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #336]            ; 16-byte Folded Spill
	add	x29, sp, #336
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	mov	x20, x1
	str	x0, [sp, #64]                   ; 8-byte Folded Spill
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	str	x0, [sp, #56]                   ; 8-byte Folded Spill
	mov	x28, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
	sub	x8, x29, #128
	add	x8, x8, #8
	stp	x8, xzr, [sp, #128]             ; 16-byte Folded Spill
Lloh17:
	adrp	x8, lCPI2_0@PAGE
Lloh18:
	ldr	q0, [x8, lCPI2_0@PAGEOFF]
	str	q0, [sp, #80]                   ; 16-byte Folded Spill
	b	LBB2_2
LBB2_1:                                 ;   in Loop: Header=BB2_2 Depth=1
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	cmp	x9, #28
	b.eq	LBB2_87
LBB2_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_4 Depth 2
                                        ;       Child Loop BB2_8 Depth 3
                                        ;         Child Loop BB2_11 Depth 4
                                        ;       Child Loop BB2_24 Depth 3
                                        ;       Child Loop BB2_56 Depth 3
                                        ;       Child Loop BB2_49 Depth 3
                                        ;       Child Loop BB2_77 Depth 3
                                        ;         Child Loop BB2_79 Depth 4
	mov	w19, #0                         ; =0x0
Lloh19:
	adrp	x8, l_constinit.7@PAGE
Lloh20:
	add	x8, x8, l_constinit.7@PAGEOFF
	ldr	w10, [x8, x9]
	mov	w8, #4194302                    ; =0x3ffffe
	cmp	w10, w8
	str	w10, [sp, #108]                 ; 4-byte Folded Spill
	csel	w8, w10, w8, lo
	str	x8, [sp, #144]                  ; 8-byte Folded Spill
	add	x9, x9, #4
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	b	LBB2_4
LBB2_3:                                 ;   in Loop: Header=BB2_4 Depth=2
	ldur	x1, [x29, #-120]
	sub	x0, x29, #128
	bl	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	add	w19, w19, #1
	cmp	w19, #4
	b.eq	LBB2_1
LBB2_4:                                 ;   Parent Loop BB2_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB2_8 Depth 3
                                        ;         Child Loop BB2_11 Depth 4
                                        ;       Child Loop BB2_24 Depth 3
                                        ;       Child Loop BB2_56 Depth 3
                                        ;       Child Loop BB2_49 Depth 3
                                        ;       Child Loop BB2_77 Depth 3
                                        ;         Child Loop BB2_79 Depth 4
	str	w19, [sp, #104]                 ; 4-byte Folded Spill
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	stp	xzr, xzr, [x8]
	mov	x1, x8
	stur	x8, [x29, #-128]
	ldr	w8, [sp, #108]                  ; 4-byte Folded Reload
	cbz	w8, LBB2_19
; %bb.5:                                ;   in Loop: Header=BB2_4 Depth=2
	mov	x8, #0                          ; =0x0
	b	LBB2_8
LBB2_6:                                 ;   in Loop: Header=BB2_8 Depth=3
	ldur	x0, [x29, #-120]
	bl	__ZNSt3__127__tree_balance_after_insertB9nqe210106IPNS_16__tree_node_baseIPvEEEEvT_S5_
	ldur	x8, [x29, #-112]
	add	x8, x8, #1
	stur	x8, [x29, #-112]
LBB2_7:                                 ;   in Loop: Header=BB2_8 Depth=3
	ldr	x9, [sp, #144]                  ; 8-byte Folded Reload
	cmp	x8, x9
	b.hs	LBB2_18
LBB2_8:                                 ;   Parent Loop BB2_2 Depth=1
                                        ;     Parent Loop BB2_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB2_11 Depth 4
	ldr	x9, [x20, #2496]
	add	x10, x9, #1
	lsr	x11, x10, #3
	mov	x15, #3361                      ; =0xd21
	movk	x15, #8402, lsl #16
	movk	x15, #53773, lsl #32
	movk	x15, #3360, lsl #48
	umulh	x11, x11, x15
	lsr	x11, x11, #1
	mov	w16, #312                       ; =0x138
	msub	x10, x11, x16, x10
	ldr	x11, [x20, x9, lsl #3]
	and	x11, x11, #0xffffffff80000000
	ldr	x12, [x20, x10, lsl #3]
	and	x13, x12, #0x7ffffffe
	orr	x11, x13, x11
	add	x13, x9, #156
	lsr	x14, x13, #3
	umulh	x14, x14, x15
	lsr	x14, x14, #1
	msub	x13, x14, x16, x13
	ldr	x13, [x20, x13, lsl #3]
	tst	w12, #0x1
	mov	x12, #6633                      ; =0x19e9
	movk	x12, #43366, lsl #16
	movk	x12, #28506, lsl #32
	movk	x12, #46338, lsl #48
	csel	x12, x12, xzr, ne
	eor	x12, x12, x13
	eor	x11, x12, x11, lsr #1
	str	x11, [x20, x9, lsl #3]
	mov	x9, #6148914691236517205        ; =0x5555555555555555
	and	x9, x9, #0xfffffffff
	and	x9, x9, x11, lsr #29
	eor	x9, x9, x11
	str	x10, [x20, #2496]
	mov	x10, #3987079168                ; =0xeda60000
	movk	x10, #32767, lsl #32
	movk	x10, #29142, lsl #48
	and	x10, x10, x9, lsl #17
	eor	x9, x10, x9
	mov	x10, #262645840084992           ; =0xeee000000000
	movk	x10, #65527, lsl #48
	and	x10, x10, x9, lsl #37
	eor	x9, x10, x9
	eor	x9, x9, x9, lsr #43
	lsr	x10, x9, #1
	mov	x11, #1                         ; =0x1
	movk	x11, #16, lsl #16
	movk	x11, #512, lsl #32
	movk	x11, #16384, lsl #48
	umulh	x10, x10, x11
	lsr	x10, x10, #19
	mov	w11, #4194302                   ; =0x3ffffe
	msub	x9, x10, x11, x9
	lsl	x9, x9, #2
	add	x19, x9, #8
	ldur	x23, [x29, #-120]
	ldr	x21, [sp, #128]                 ; 8-byte Folded Reload
	mov	x22, x21
	cbz	x23, LBB2_15
; %bb.9:                                ;   in Loop: Header=BB2_8 Depth=3
	mov	x9, x23
	b	LBB2_11
LBB2_10:                                ;   in Loop: Header=BB2_11 Depth=4
	ldr	x9, [x21]
	mov	x22, x21
	cbz	x9, LBB2_15
LBB2_11:                                ;   Parent Loop BB2_2 Depth=1
                                        ;     Parent Loop BB2_4 Depth=2
                                        ;       Parent Loop BB2_8 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	mov	x21, x9
	ldr	x9, [x9, #32]
	cmp	x19, x9
	b.lo	LBB2_10
; %bb.12:                               ;   in Loop: Header=BB2_11 Depth=4
	cmp	x9, x19
	b.hs	LBB2_7
; %bb.13:                               ;   in Loop: Header=BB2_11 Depth=4
	ldr	x9, [x21, #8]
	cbnz	x9, LBB2_11
; %bb.14:                               ;   in Loop: Header=BB2_8 Depth=3
	add	x22, x21, #8
LBB2_15:                                ;   in Loop: Header=BB2_8 Depth=3
Ltmp63:
	mov	w0, #40                         ; =0x28
	bl	__Znwm
	mov	x1, x0
Ltmp64:
; %bb.16:                               ;   in Loop: Header=BB2_8 Depth=3
	str	x19, [x1, #32]
	stp	xzr, xzr, [x1]
	str	x21, [x1, #16]
	str	x1, [x22]
	ldur	x8, [x29, #-128]
	ldr	x8, [x8]
	cbz	x8, LBB2_6
; %bb.17:                               ;   in Loop: Header=BB2_8 Depth=3
	stur	x8, [x29, #-128]
	b	LBB2_6
LBB2_18:                                ;   in Loop: Header=BB2_4 Depth=2
	ldur	x1, [x29, #-128]
LBB2_19:                                ;   in Loop: Header=BB2_4 Depth=2
Ltmp66:
	sub	x0, x29, #152
	ldr	x2, [sp, #128]                  ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEEC2B9nqe210106INS_21__tree_const_iteratorIyPNS_11__tree_nodeIyPvEElEELi0EEET_SB_
Ltmp67:
; %bb.20:                               ;   in Loop: Header=BB2_4 Depth=2
	stp	xzr, xzr, [sp, #160]
	str	xzr, [sp, #176]
	ldr	w8, [sp, #108]                  ; 4-byte Folded Reload
	cbz	w8, LBB2_38
; %bb.21:                               ;   in Loop: Header=BB2_4 Depth=2
	mov	x21, #0                         ; =0x0
	mov	x19, #0                         ; =0x0
	b	LBB2_24
LBB2_22:                                ;   in Loop: Header=BB2_24 Depth=3
	str	s8, [x21], #4
LBB2_23:                                ;   in Loop: Header=BB2_24 Depth=3
	str	x21, [sp, #168]
	add	x19, x19, #1
	ldr	x8, [sp, #144]                  ; 8-byte Folded Reload
	cmp	x8, x19
	b.eq	LBB2_37
LBB2_24:                                ;   Parent Loop BB2_2 Depth=1
                                        ;     Parent Loop BB2_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	w10, #1                         ; =0x1
	movk	w10, #256, lsl #16
	add	x8, x10, #3
	tst	x19, #0x1
	ldur	x9, [x29, #-152]
	ldr	x9, [x9, x19, lsl #3]
	csel	x8, x10, x8, eq
	sub	x22, x8, x9
	ucvtf	s8, x22
	ldr	x26, [sp, #176]
	cmp	x21, x26
	b.hs	LBB2_26
; %bb.25:                               ;   in Loop: Header=BB2_24 Depth=3
	str	s8, [x21], #4
	b	LBB2_31
LBB2_26:                                ;   in Loop: Header=BB2_24 Depth=3
	ldr	x23, [sp, #160]
	sub	x24, x21, x23
	asr	x25, x24, #2
	add	x8, x25, #1
	lsr	x9, x8, #62
	cbnz	x9, LBB2_93
; %bb.27:                               ;   in Loop: Header=BB2_24 Depth=3
	sub	x9, x26, x23
	asr	x10, x9, #1
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775804       ; =0x7ffffffffffffffc
	cmp	x9, x10
	mov	x9, #4611686018427387903        ; =0x3fffffffffffffff
	csel	x26, x8, x9, lo
	lsr	x8, x26, #62
	cbnz	x8, LBB2_91
; %bb.28:                               ;   in Loop: Header=BB2_24 Depth=3
	lsl	x0, x26, #2
Ltmp69:
	bl	__Znwm
Ltmp70:
; %bb.29:                               ;   in Loop: Header=BB2_24 Depth=3
	add	x21, x0, x24
	add	x26, x0, x26, lsl #2
	sub	x25, x21, x25, lsl #2
	str	s8, [x21], #4
	mov	x0, x25
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	stp	x25, x21, [sp, #160]
	str	x26, [sp, #176]
	cbz	x23, LBB2_31
; %bb.30:                               ;   in Loop: Header=BB2_24 Depth=3
	mov	x0, x23
	bl	__ZdlPv
	ldr	x26, [sp, #176]
LBB2_31:                                ;   in Loop: Header=BB2_24 Depth=3
	str	x21, [sp, #168]
	neg	x8, x22
	scvtf	s8, x8
	cmp	x21, x26
	b.lo	LBB2_22
; %bb.32:                               ;   in Loop: Header=BB2_24 Depth=3
	ldr	x23, [sp, #160]
	sub	x24, x21, x23
	asr	x22, x24, #2
	add	x8, x22, #1
	lsr	x9, x8, #62
	cbnz	x9, LBB2_92
; %bb.33:                               ;   in Loop: Header=BB2_24 Depth=3
	sub	x9, x26, x23
	asr	x10, x9, #1
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775804       ; =0x7ffffffffffffffc
	cmp	x9, x10
	mov	x9, #4611686018427387903        ; =0x3fffffffffffffff
	csel	x25, x8, x9, lo
	lsr	x8, x25, #62
	cbnz	x8, LBB2_94
; %bb.34:                               ;   in Loop: Header=BB2_24 Depth=3
	lsl	x0, x25, #2
Ltmp77:
	bl	__Znwm
Ltmp78:
; %bb.35:                               ;   in Loop: Header=BB2_24 Depth=3
	add	x21, x0, x24
	add	x26, x0, x25, lsl #2
	sub	x25, x21, x22, lsl #2
	str	s8, [x21], #4
	mov	x0, x25
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	stp	x25, x21, [sp, #160]
	str	x26, [sp, #176]
	cbz	x23, LBB2_23
; %bb.36:                               ;   in Loop: Header=BB2_24 Depth=3
	mov	x0, x23
	bl	__ZdlPv
	b	LBB2_23
LBB2_37:                                ;   in Loop: Header=BB2_4 Depth=2
	ldr	x8, [sp, #160]
	b	LBB2_39
LBB2_38:                                ;   in Loop: Header=BB2_4 Depth=2
	mov	x8, #0                          ; =0x0
	mov	x21, #0                         ; =0x0
LBB2_39:                                ;   in Loop: Header=BB2_4 Depth=2
	scvtf	s0, wzr
	str	s0, [sp, #156]
	sub	x9, x21, x8
	asr	x10, x9, #2
	cmp	x10, #1023
	b.hi	LBB2_41
; %bb.40:                               ;   in Loop: Header=BB2_4 Depth=2
	mov	w8, #1024                       ; =0x400
	sub	x1, x8, x10
Ltmp85:
	add	x0, sp, #160
	add	x2, sp, #156
	bl	__ZNSt3__16vectorIfNS_9allocatorIfEEE8__appendEmRKf
Ltmp86:
	b	LBB2_43
LBB2_41:                                ;   in Loop: Header=BB2_4 Depth=2
	cmp	x9, #1, lsl #12                 ; =4096
	b.eq	LBB2_43
; %bb.42:                               ;   in Loop: Header=BB2_4 Depth=2
	add	x8, x8, #1, lsl #12             ; =4096
	str	x8, [sp, #168]
LBB2_43:                                ;   in Loop: Header=BB2_4 Depth=2
	scvtf	s0, wzr
	add	x0, sp, #160
	bl	__Z12ordered_foldIfET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	scvtf	s1, wzr
	fcmp	s0, s1
	b.ne	LBB2_102
; %bb.44:                               ;   in Loop: Header=BB2_4 Depth=2
Ltmp88:
	mov	w0, #16                         ; =0x10
	bl	__Znwm
Ltmp89:
; %bb.45:                               ;   in Loop: Header=BB2_4 Depth=2
	mov	x23, x0
	mov	x25, x0
	ldr	q0, [sp, #80]                   ; 16-byte Folded Reload
	str	q0, [x25], #16
	ldp	x22, x8, [x29, #-152]
	mov	x21, x25
	stp	x28, x8, [sp, #112]             ; 16-byte Folded Spill
	cmp	x22, x8
	b.ne	LBB2_56
LBB2_46:                                ;   in Loop: Header=BB2_4 Depth=2
	mov	w19, #512                       ; =0x200
	b	LBB2_49
LBB2_47:                                ;   in Loop: Header=BB2_49 Depth=3
	str	x26, [x25]
	mov	x22, x25
LBB2_48:                                ;   in Loop: Header=BB2_49 Depth=3
	add	x25, x22, #8
	subs	w19, w19, #1
	b.eq	LBB2_76
LBB2_49:                                ;   Parent Loop BB2_2 Depth=1
                                        ;     Parent Loop BB2_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	x8, [x20, #2496]
	add	x9, x8, #1
	lsr	x10, x9, #3
	mov	x14, #3361                      ; =0xd21
	movk	x14, #8402, lsl #16
	movk	x14, #53773, lsl #32
	movk	x14, #3360, lsl #48
	umulh	x10, x10, x14
	lsr	x10, x10, #1
	mov	w15, #312                       ; =0x138
	msub	x9, x10, x15, x9
	ldr	x10, [x20, x8, lsl #3]
	and	x10, x10, #0xffffffff80000000
	ldr	x11, [x20, x9, lsl #3]
	and	x12, x11, #0x7ffffffe
	orr	x10, x12, x10
	add	x12, x8, #156
	lsr	x13, x12, #3
	umulh	x13, x13, x14
	lsr	x13, x13, #1
	msub	x12, x13, x15, x12
	ldr	x12, [x20, x12, lsl #3]
	tst	w11, #0x1
	mov	x11, #6633                      ; =0x19e9
	movk	x11, #43366, lsl #16
	movk	x11, #28506, lsl #32
	movk	x11, #46338, lsl #48
	csel	x11, x11, xzr, ne
	eor	x11, x11, x12
	eor	x10, x11, x10, lsr #1
	str	x10, [x20, x8, lsl #3]
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	and	x8, x8, #0xfffffffff
	and	x8, x8, x10, lsr #29
	eor	x8, x8, x10
	str	x9, [x20, #2496]
	mov	x9, #3987079168                 ; =0xeda60000
	movk	x9, #32767, lsl #32
	movk	x9, #29142, lsl #48
	and	x9, x9, x8, lsl #17
	eor	x8, x9, x8
	mov	x9, #262645840084992            ; =0xeee000000000
	movk	x9, #65527, lsl #48
	and	x9, x9, x8, lsl #37
	eor	x8, x9, x8
	eor	x8, x8, x8, lsr #43
	lsr	x9, x8, #1
	mov	x10, #1                         ; =0x1
	movk	x10, #16, lsl #16
	movk	x10, #512, lsl #32
	movk	x10, #16384, lsl #48
	umulh	x9, x9, x10
	lsr	x9, x9, #19
	mov	w10, #4194302                   ; =0x3ffffe
	msub	x8, x9, x10, x8
	lsl	x8, x8, #2
	add	x26, x8, #8
	cmp	x25, x21
	b.lo	LBB2_47
; %bb.50:                               ;   in Loop: Header=BB2_49 Depth=3
	sub	x24, x25, x23
	asr	x27, x24, #3
	add	x8, x27, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB2_89
; %bb.51:                               ;   in Loop: Header=BB2_49 Depth=3
	sub	x9, x21, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x21, x8, x9, lo
	lsr	x8, x21, #61
	cbnz	x8, LBB2_90
; %bb.52:                               ;   in Loop: Header=BB2_49 Depth=3
	lsl	x0, x21, #3
Ltmp115:
	bl	__Znwm
Ltmp116:
; %bb.53:                               ;   in Loop: Header=BB2_49 Depth=3
	mov	x25, x0
	add	x22, x0, x24
	str	x26, [x22]
	sub	x26, x22, x27, lsl #3
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x21, x25, x21, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
	b	LBB2_48
LBB2_54:                                ;   in Loop: Header=BB2_56 Depth=3
	str	x19, [x25], #8
LBB2_55:                                ;   in Loop: Header=BB2_56 Depth=3
	add	x22, x22, #8
	ldr	x8, [sp, #120]                  ; 8-byte Folded Reload
	cmp	x22, x8
	b.eq	LBB2_46
LBB2_56:                                ;   Parent Loop BB2_2 Depth=1
                                        ;     Parent Loop BB2_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	x19, [x22]
	cmp	x25, x21
	b.hs	LBB2_58
; %bb.57:                               ;   in Loop: Header=BB2_56 Depth=3
	str	x19, [x25]
	b	LBB2_62
LBB2_58:                                ;   in Loop: Header=BB2_56 Depth=3
	sub	x24, x25, x23
	asr	x26, x24, #3
	add	x8, x26, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB2_95
; %bb.59:                               ;   in Loop: Header=BB2_56 Depth=3
	sub	x9, x21, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x27, x8, x9, lo
	lsr	x8, x27, #61
	cbnz	x8, LBB2_96
; %bb.60:                               ;   in Loop: Header=BB2_56 Depth=3
	lsl	x0, x27, #3
Ltmp91:
	bl	__Znwm
Ltmp92:
; %bb.61:                               ;   in Loop: Header=BB2_56 Depth=3
	mov	x21, x0
	add	x25, x0, x24
	str	x19, [x25]
	sub	x26, x25, x26, lsl #3
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x21, x21, x27, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
LBB2_62:                                ;   in Loop: Header=BB2_56 Depth=3
	add	x8, x25, #8
	cmp	x19, #8
	b.ls	LBB2_65
; %bb.63:                               ;   in Loop: Header=BB2_56 Depth=3
	sub	x27, x19, #4
	cmp	x8, x21
	b.hs	LBB2_66
; %bb.64:                               ;   in Loop: Header=BB2_56 Depth=3
	str	x27, [x25, #8]
	add	x25, x25, #16
	b	LBB2_70
LBB2_65:                                ;   in Loop: Header=BB2_56 Depth=3
	add	x19, x19, #4
	mov	x25, x8
	b	LBB2_71
LBB2_66:                                ;   in Loop: Header=BB2_56 Depth=3
	sub	x24, x8, x23
	asr	x26, x24, #3
	add	x8, x26, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB2_100
; %bb.67:                               ;   in Loop: Header=BB2_56 Depth=3
	sub	x9, x21, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x28, x8, x9, lo
	lsr	x8, x28, #61
	cbnz	x8, LBB2_99
; %bb.68:                               ;   in Loop: Header=BB2_56 Depth=3
	lsl	x0, x28, #3
Ltmp99:
	bl	__Znwm
Ltmp100:
; %bb.69:                               ;   in Loop: Header=BB2_56 Depth=3
	mov	x21, x0
	add	x25, x0, x24
	sub	x26, x25, x26, lsl #3
	str	x27, [x25], #8
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x21, x21, x28, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
	ldr	x28, [sp, #112]                 ; 8-byte Folded Reload
LBB2_70:                                ;   in Loop: Header=BB2_56 Depth=3
	add	x19, x19, #4
	lsr	x8, x19, #24
	cbnz	x8, LBB2_55
LBB2_71:                                ;   in Loop: Header=BB2_56 Depth=3
	cmp	x25, x21
	b.lo	LBB2_54
; %bb.72:                               ;   in Loop: Header=BB2_56 Depth=3
	sub	x24, x25, x23
	asr	x26, x24, #3
	add	x8, x26, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB2_98
; %bb.73:                               ;   in Loop: Header=BB2_56 Depth=3
	sub	x9, x21, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x27, x8, x9, lo
	lsr	x8, x27, #61
	cbnz	x8, LBB2_97
; %bb.74:                               ;   in Loop: Header=BB2_56 Depth=3
	lsl	x0, x27, #3
Ltmp107:
	bl	__Znwm
Ltmp108:
; %bb.75:                               ;   in Loop: Header=BB2_56 Depth=3
	mov	x21, x0
	add	x25, x0, x24
	sub	x26, x25, x26, lsl #3
	str	x19, [x25], #8
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x21, x21, x27, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
	b	LBB2_55
LBB2_76:                                ;   in Loop: Header=BB2_4 Depth=2
	mov	x19, x23
	cmp	x23, x25
	b.eq	LBB2_83
LBB2_77:                                ;   Parent Loop BB2_2 Depth=1
                                        ;     Parent Loop BB2_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB2_79 Depth 4
	ldr	x21, [x19]
	ldp	x8, x9, [x29, #-152]
	subs	x9, x9, x8
	b.eq	LBB2_80
; %bb.78:                               ;   in Loop: Header=BB2_77 Depth=3
	asr	x10, x9, #3
	mov	x9, x8
LBB2_79:                                ;   Parent Loop BB2_2 Depth=1
                                        ;     Parent Loop BB2_4 Depth=2
                                        ;       Parent Loop BB2_77 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	lsr	x11, x10, #1
	add	x12, x9, x11, lsl #3
	ldr	x13, [x12], #8
	mvn	x14, x11
	add	x10, x10, x14
	cmp	x21, x13
	csel	x9, x9, x12, lo
	csel	x10, x11, x10, lo
	cbnz	x10, LBB2_79
	b	LBB2_81
LBB2_80:                                ;   in Loop: Header=BB2_77 Depth=3
	mov	x9, x8
LBB2_81:                                ;   in Loop: Header=BB2_77 Depth=3
	sub	x8, x9, x8
	asr	x8, x8, #3
	and	x9, x8, #0x1
	cmp	x8, #0
	cneg	x25, x9, lt
	sub	x24, x21, x25
	ucvtf	s0, x21
	add	x0, sp, #160
	bl	__Z12ordered_foldIfET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	ucvtf	s1, x24
	fcmp	s0, s1
	b.ne	LBB2_88
; %bb.82:                               ;   in Loop: Header=BB2_77 Depth=3
	add	x28, x28, #1
	cmp	x25, #0
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	cinc	x8, x8, ne
	str	x8, [sp, #136]                  ; 8-byte Folded Spill
	cmp	x19, x22
	add	x19, x19, #8
	b.ne	LBB2_77
LBB2_83:                                ;   in Loop: Header=BB2_4 Depth=2
	mov	x0, x23
	bl	__ZdlPv
	ldr	x0, [sp, #160]
	cbz	x0, LBB2_85
; %bb.84:                               ;   in Loop: Header=BB2_4 Depth=2
	str	x0, [sp, #168]
	bl	__ZdlPv
LBB2_85:                                ;   in Loop: Header=BB2_4 Depth=2
	ldur	x0, [x29, #-152]
	ldr	w19, [sp, #104]                 ; 4-byte Folded Reload
	cbz	x0, LBB2_3
; %bb.86:                               ;   in Loop: Header=BB2_4 Depth=2
	stur	x0, [x29, #-144]
	bl	__ZdlPv
	b	LBB2_3
LBB2_87:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	sub	x8, x0, x8
	str	x8, [sp, #40]
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	stp	x28, x8, [sp, #24]
	mov	w8, #28                         ; =0x1c
	str	x8, [sp, #16]
	mov	w8, #24                         ; =0x18
	str	x8, [sp, #8]
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	str	x8, [sp]
Lloh21:
	adrp	x0, l_.str.4@PAGE
Lloh22:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #336]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #320]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #304]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #288]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #272]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #256]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #240]              ; 16-byte Folded Reload
	add	sp, sp, #352
	ret
LBB2_88:
Lloh23:
	adrp	x8, ___stderrp@GOTPAGE
Lloh24:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh25:
	ldr	x0, [x8]
	fcvt	d0, s0
	str	d0, [sp, #24]
	stp	x21, x24, [sp, #8]
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	str	x8, [sp]
Lloh26:
	adrp	x1, l_.str.3@PAGE
Lloh27:
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
Ltmp123:
	mov	w0, #1                          ; =0x1
	bl	_exit
Ltmp124:
	b	LBB2_101
LBB2_89:
Ltmp120:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp121:
	b	LBB2_101
LBB2_90:
Ltmp118:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp119:
	b	LBB2_101
LBB2_91:
Ltmp72:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp73:
	b	LBB2_101
LBB2_92:
Ltmp82:
	bl	__ZNSt3__16vectorIfNS_9allocatorIfEEE20__throw_length_errorB9nqe210106Ev
Ltmp83:
	b	LBB2_101
LBB2_93:
Ltmp74:
	bl	__ZNSt3__16vectorIfNS_9allocatorIfEEE20__throw_length_errorB9nqe210106Ev
Ltmp75:
	b	LBB2_101
LBB2_94:
Ltmp80:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp81:
	b	LBB2_101
LBB2_95:
Ltmp96:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp97:
	b	LBB2_101
LBB2_96:
Ltmp94:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp95:
	b	LBB2_101
LBB2_97:
Ltmp110:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp111:
	b	LBB2_101
LBB2_98:
Ltmp112:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp113:
	b	LBB2_101
LBB2_99:
Ltmp102:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp103:
	b	LBB2_101
LBB2_100:
Ltmp104:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp105:
LBB2_101:
	brk	#0x1
LBB2_102:
	bl	_abort
LBB2_103:
Ltmp87:
	mov	x19, x0
	b	LBB2_121
LBB2_104:
Ltmp90:
	mov	x19, x0
	b	LBB2_121
LBB2_105:
Ltmp68:
	mov	x19, x0
	b	LBB2_125
LBB2_106:
Ltmp101:
	b	LBB2_120
LBB2_107:
Ltmp109:
	b	LBB2_120
LBB2_108:
Ltmp106:
	b	LBB2_120
LBB2_109:
Ltmp93:
	b	LBB2_120
LBB2_110:
Ltmp71:
	mov	x19, x0
	b	LBB2_121
LBB2_111:
Ltmp79:
	mov	x19, x0
	b	LBB2_121
LBB2_112:
Ltmp114:
	b	LBB2_120
LBB2_113:
Ltmp65:
	mov	x19, x0
	b	LBB2_126
LBB2_114:
Ltmp117:
	b	LBB2_120
LBB2_115:
Ltmp125:
	b	LBB2_120
LBB2_116:
Ltmp98:
	b	LBB2_120
LBB2_117:
Ltmp84:
	mov	x19, x0
	b	LBB2_121
LBB2_118:
Ltmp76:
	mov	x19, x0
	b	LBB2_121
LBB2_119:
Ltmp122:
LBB2_120:
	mov	x19, x0
	mov	x0, x23
	bl	__ZdlPv
LBB2_121:
	ldr	x0, [sp, #160]
	cbz	x0, LBB2_123
; %bb.122:
	str	x0, [sp, #168]
	bl	__ZdlPv
LBB2_123:
	ldur	x0, [x29, #-152]
	cbz	x0, LBB2_125
; %bb.124:
	stur	x0, [x29, #-144]
	bl	__ZdlPv
LBB2_125:
	ldur	x23, [x29, #-120]
LBB2_126:
	sub	x0, x29, #128
	mov	x1, x23
	bl	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpLdr	Lloh17, Lloh18
	.loh AdrpAdd	Lloh19, Lloh20
	.loh AdrpAdd	Lloh21, Lloh22
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpLdrGotLdr	Lloh23, Lloh24, Lloh25
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table2:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Ltmp63-Lfunc_begin1            ; >> Call Site 1 <<
	.uleb128 Ltmp64-Ltmp63                  ;   Call between Ltmp63 and Ltmp64
	.uleb128 Ltmp65-Lfunc_begin1            ;     jumps to Ltmp65
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp66-Lfunc_begin1            ; >> Call Site 2 <<
	.uleb128 Ltmp67-Ltmp66                  ;   Call between Ltmp66 and Ltmp67
	.uleb128 Ltmp68-Lfunc_begin1            ;     jumps to Ltmp68
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp69-Lfunc_begin1            ; >> Call Site 3 <<
	.uleb128 Ltmp70-Ltmp69                  ;   Call between Ltmp69 and Ltmp70
	.uleb128 Ltmp71-Lfunc_begin1            ;     jumps to Ltmp71
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp70-Lfunc_begin1            ; >> Call Site 4 <<
	.uleb128 Ltmp77-Ltmp70                  ;   Call between Ltmp70 and Ltmp77
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp77-Lfunc_begin1            ; >> Call Site 5 <<
	.uleb128 Ltmp78-Ltmp77                  ;   Call between Ltmp77 and Ltmp78
	.uleb128 Ltmp79-Lfunc_begin1            ;     jumps to Ltmp79
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp78-Lfunc_begin1            ; >> Call Site 6 <<
	.uleb128 Ltmp85-Ltmp78                  ;   Call between Ltmp78 and Ltmp85
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp85-Lfunc_begin1            ; >> Call Site 7 <<
	.uleb128 Ltmp86-Ltmp85                  ;   Call between Ltmp85 and Ltmp86
	.uleb128 Ltmp87-Lfunc_begin1            ;     jumps to Ltmp87
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp88-Lfunc_begin1            ; >> Call Site 8 <<
	.uleb128 Ltmp89-Ltmp88                  ;   Call between Ltmp88 and Ltmp89
	.uleb128 Ltmp90-Lfunc_begin1            ;     jumps to Ltmp90
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp115-Lfunc_begin1           ; >> Call Site 9 <<
	.uleb128 Ltmp116-Ltmp115                ;   Call between Ltmp115 and Ltmp116
	.uleb128 Ltmp117-Lfunc_begin1           ;     jumps to Ltmp117
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp116-Lfunc_begin1           ; >> Call Site 10 <<
	.uleb128 Ltmp91-Ltmp116                 ;   Call between Ltmp116 and Ltmp91
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp91-Lfunc_begin1            ; >> Call Site 11 <<
	.uleb128 Ltmp92-Ltmp91                  ;   Call between Ltmp91 and Ltmp92
	.uleb128 Ltmp93-Lfunc_begin1            ;     jumps to Ltmp93
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp92-Lfunc_begin1            ; >> Call Site 12 <<
	.uleb128 Ltmp99-Ltmp92                  ;   Call between Ltmp92 and Ltmp99
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp99-Lfunc_begin1            ; >> Call Site 13 <<
	.uleb128 Ltmp100-Ltmp99                 ;   Call between Ltmp99 and Ltmp100
	.uleb128 Ltmp101-Lfunc_begin1           ;     jumps to Ltmp101
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp100-Lfunc_begin1           ; >> Call Site 14 <<
	.uleb128 Ltmp107-Ltmp100                ;   Call between Ltmp100 and Ltmp107
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp107-Lfunc_begin1           ; >> Call Site 15 <<
	.uleb128 Ltmp108-Ltmp107                ;   Call between Ltmp107 and Ltmp108
	.uleb128 Ltmp109-Lfunc_begin1           ;     jumps to Ltmp109
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp108-Lfunc_begin1           ; >> Call Site 16 <<
	.uleb128 Ltmp123-Ltmp108                ;   Call between Ltmp108 and Ltmp123
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp123-Lfunc_begin1           ; >> Call Site 17 <<
	.uleb128 Ltmp124-Ltmp123                ;   Call between Ltmp123 and Ltmp124
	.uleb128 Ltmp125-Lfunc_begin1           ;     jumps to Ltmp125
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp120-Lfunc_begin1           ; >> Call Site 18 <<
	.uleb128 Ltmp119-Ltmp120                ;   Call between Ltmp120 and Ltmp119
	.uleb128 Ltmp122-Lfunc_begin1           ;     jumps to Ltmp122
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp72-Lfunc_begin1            ; >> Call Site 19 <<
	.uleb128 Ltmp73-Ltmp72                  ;   Call between Ltmp72 and Ltmp73
	.uleb128 Ltmp76-Lfunc_begin1            ;     jumps to Ltmp76
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp82-Lfunc_begin1            ; >> Call Site 20 <<
	.uleb128 Ltmp83-Ltmp82                  ;   Call between Ltmp82 and Ltmp83
	.uleb128 Ltmp84-Lfunc_begin1            ;     jumps to Ltmp84
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp74-Lfunc_begin1            ; >> Call Site 21 <<
	.uleb128 Ltmp75-Ltmp74                  ;   Call between Ltmp74 and Ltmp75
	.uleb128 Ltmp76-Lfunc_begin1            ;     jumps to Ltmp76
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp80-Lfunc_begin1            ; >> Call Site 22 <<
	.uleb128 Ltmp81-Ltmp80                  ;   Call between Ltmp80 and Ltmp81
	.uleb128 Ltmp84-Lfunc_begin1            ;     jumps to Ltmp84
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp96-Lfunc_begin1            ; >> Call Site 23 <<
	.uleb128 Ltmp95-Ltmp96                  ;   Call between Ltmp96 and Ltmp95
	.uleb128 Ltmp98-Lfunc_begin1            ;     jumps to Ltmp98
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp110-Lfunc_begin1           ; >> Call Site 24 <<
	.uleb128 Ltmp113-Ltmp110                ;   Call between Ltmp110 and Ltmp113
	.uleb128 Ltmp114-Lfunc_begin1           ;     jumps to Ltmp114
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp102-Lfunc_begin1           ; >> Call Site 25 <<
	.uleb128 Ltmp105-Ltmp102                ;   Call between Ltmp102 and Ltmp105
	.uleb128 Ltmp106-Lfunc_begin1           ;     jumps to Ltmp106
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp105-Lfunc_begin1           ; >> Call Site 26 <<
	.uleb128 Lfunc_end1-Ltmp105             ;   Call between Ltmp105 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4, 0x0                          ; -- Begin function _Z8validateIdLj53EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
lCPI3_0:
	.quad	8                               ; 0x8
	.quad	9007199254740988                ; 0x1ffffffffffffc
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z8validateIdLj53EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
	.weak_def_can_be_hidden	__Z8validateIdLj53EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
	.p2align	2
__Z8validateIdLj53EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE: ; @_Z8validateIdLj53EEvPKcRNSt3__123mersenne_twister_engineIyLm64ELm312ELm156ELm31ELy13043109905998158313ELm29ELy6148914691236517205ELm17ELy8202884508482404352ELm37ELy18444473444759240704ELm43ELy6364136223846793005EEE
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
; %bb.0:
	sub	sp, sp, #352
	stp	d9, d8, [sp, #240]              ; 16-byte Folded Spill
	stp	x28, x27, [sp, #256]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #272]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #288]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #304]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #320]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #336]            ; 16-byte Folded Spill
	add	x29, sp, #336
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	mov	x20, x1
	str	x0, [sp, #64]                   ; 8-byte Folded Spill
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	str	x0, [sp, #56]                   ; 8-byte Folded Spill
	stp	xzr, xzr, [sp, #136]            ; 16-byte Folded Spill
	mov	x9, #0                          ; =0x0
	sub	x8, x29, #128
	add	x8, x8, #8
	str	x8, [sp, #128]                  ; 8-byte Folded Spill
Lloh28:
	adrp	x8, lCPI3_0@PAGE
Lloh29:
	ldr	q0, [x8, lCPI3_0@PAGEOFF]
	str	q0, [sp, #80]                   ; 16-byte Folded Spill
	b	LBB3_2
LBB3_1:                                 ;   in Loop: Header=BB3_2 Depth=1
	ldr	x9, [sp, #72]                   ; 8-byte Folded Reload
	cmp	x9, #28
	b.eq	LBB3_90
LBB3_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_4 Depth 2
                                        ;       Child Loop BB3_8 Depth 3
                                        ;         Child Loop BB3_11 Depth 4
                                        ;       Child Loop BB3_24 Depth 3
                                        ;       Child Loop BB3_50 Depth 3
                                        ;       Child Loop BB3_74 Depth 3
                                        ;       Child Loop BB3_80 Depth 3
                                        ;         Child Loop BB3_82 Depth 4
	mov	w19, #0                         ; =0x0
Lloh30:
	adrp	x8, l_constinit.7@PAGE
Lloh31:
	add	x8, x8, l_constinit.7@PAGEOFF
	ldr	w25, [x8, x9]
	add	x9, x9, #4
	str	x9, [sp, #72]                   ; 8-byte Folded Spill
	str	x25, [sp, #120]                 ; 8-byte Folded Spill
	b	LBB3_4
LBB3_3:                                 ;   in Loop: Header=BB3_4 Depth=2
	ldur	x1, [x29, #-120]
	sub	x0, x29, #128
	bl	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	add	w19, w19, #1
	cmp	w19, #4
	b.eq	LBB3_1
LBB3_4:                                 ;   Parent Loop BB3_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_8 Depth 3
                                        ;         Child Loop BB3_11 Depth 4
                                        ;       Child Loop BB3_24 Depth 3
                                        ;       Child Loop BB3_50 Depth 3
                                        ;       Child Loop BB3_74 Depth 3
                                        ;       Child Loop BB3_80 Depth 3
                                        ;         Child Loop BB3_82 Depth 4
	str	w19, [sp, #108]                 ; 4-byte Folded Spill
	ldr	x8, [sp, #128]                  ; 8-byte Folded Reload
	stp	xzr, xzr, [x8]
	mov	x1, x8
	stur	x8, [x29, #-128]
	cbz	w25, LBB3_19
; %bb.5:                                ;   in Loop: Header=BB3_4 Depth=2
	mov	x8, #0                          ; =0x0
	b	LBB3_8
LBB3_6:                                 ;   in Loop: Header=BB3_8 Depth=3
	ldur	x0, [x29, #-120]
	bl	__ZNSt3__127__tree_balance_after_insertB9nqe210106IPNS_16__tree_node_baseIPvEEEEvT_S5_
	ldur	x8, [x29, #-112]
	add	x8, x8, #1
	stur	x8, [x29, #-112]
LBB3_7:                                 ;   in Loop: Header=BB3_8 Depth=3
	cmp	x8, x25
	b.hs	LBB3_18
LBB3_8:                                 ;   Parent Loop BB3_2 Depth=1
                                        ;     Parent Loop BB3_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB3_11 Depth 4
	ldr	x9, [x20, #2496]
	add	x10, x9, #1
	lsr	x11, x10, #3
	mov	x15, #3361                      ; =0xd21
	movk	x15, #8402, lsl #16
	movk	x15, #53773, lsl #32
	movk	x15, #3360, lsl #48
	umulh	x11, x11, x15
	lsr	x11, x11, #1
	mov	w16, #312                       ; =0x138
	msub	x10, x11, x16, x10
	ldr	x11, [x20, x9, lsl #3]
	and	x11, x11, #0xffffffff80000000
	ldr	x12, [x20, x10, lsl #3]
	and	x13, x12, #0x7ffffffe
	orr	x11, x13, x11
	add	x13, x9, #156
	lsr	x14, x13, #3
	umulh	x14, x14, x15
	lsr	x14, x14, #1
	msub	x13, x14, x16, x13
	ldr	x13, [x20, x13, lsl #3]
	tst	w12, #0x1
	mov	x12, #6633                      ; =0x19e9
	movk	x12, #43366, lsl #16
	movk	x12, #28506, lsl #32
	movk	x12, #46338, lsl #48
	csel	x12, x12, xzr, ne
	eor	x12, x12, x13
	eor	x11, x12, x11, lsr #1
	str	x11, [x20, x9, lsl #3]
	mov	x9, #6148914691236517205        ; =0x5555555555555555
	and	x9, x9, #0xfffffffff
	and	x9, x9, x11, lsr #29
	eor	x9, x9, x11
	str	x10, [x20, #2496]
	mov	x10, #3987079168                ; =0xeda60000
	movk	x10, #32767, lsl #32
	movk	x10, #29142, lsl #48
	and	x10, x10, x9, lsl #17
	eor	x9, x10, x9
	mov	x10, #262645840084992           ; =0xeee000000000
	movk	x10, #65527, lsl #48
	and	x10, x10, x9, lsl #37
	eor	x9, x10, x9
	eor	x9, x9, x9, lsr #43
	lsr	x10, x9, #1
	mov	x11, #8193                      ; =0x2001
	movk	x11, #32768, lsl #48
	umulh	x10, x10, x11
	lsr	x10, x10, #49
	mov	x11, #2251799813685246          ; =0x7fffffffffffe
	msub	x9, x10, x11, x9
	lsl	x9, x9, #2
	add	x19, x9, #8
	ldur	x23, [x29, #-120]
	ldr	x22, [sp, #128]                 ; 8-byte Folded Reload
	mov	x24, x22
	cbz	x23, LBB3_15
; %bb.9:                                ;   in Loop: Header=BB3_8 Depth=3
	mov	x9, x23
	b	LBB3_11
LBB3_10:                                ;   in Loop: Header=BB3_11 Depth=4
	ldr	x9, [x22]
	mov	x24, x22
	cbz	x9, LBB3_15
LBB3_11:                                ;   Parent Loop BB3_2 Depth=1
                                        ;     Parent Loop BB3_4 Depth=2
                                        ;       Parent Loop BB3_8 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	mov	x22, x9
	ldr	x9, [x9, #32]
	cmp	x19, x9
	b.lo	LBB3_10
; %bb.12:                               ;   in Loop: Header=BB3_11 Depth=4
	cmp	x9, x19
	b.hs	LBB3_7
; %bb.13:                               ;   in Loop: Header=BB3_11 Depth=4
	ldr	x9, [x22, #8]
	cbnz	x9, LBB3_11
; %bb.14:                               ;   in Loop: Header=BB3_8 Depth=3
	add	x24, x22, #8
LBB3_15:                                ;   in Loop: Header=BB3_8 Depth=3
Ltmp126:
	mov	w0, #40                         ; =0x28
	bl	__Znwm
	mov	x1, x0
Ltmp127:
; %bb.16:                               ;   in Loop: Header=BB3_8 Depth=3
	str	x19, [x1, #32]
	stp	xzr, xzr, [x1]
	str	x22, [x1, #16]
	str	x1, [x24]
	ldur	x8, [x29, #-128]
	ldr	x8, [x8]
	cbz	x8, LBB3_6
; %bb.17:                               ;   in Loop: Header=BB3_8 Depth=3
	stur	x8, [x29, #-128]
	b	LBB3_6
LBB3_18:                                ;   in Loop: Header=BB3_4 Depth=2
	ldur	x1, [x29, #-128]
LBB3_19:                                ;   in Loop: Header=BB3_4 Depth=2
Ltmp129:
	sub	x0, x29, #152
	ldr	x2, [sp, #128]                  ; 8-byte Folded Reload
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEEC2B9nqe210106INS_21__tree_const_iteratorIyPNS_11__tree_nodeIyPvEElEELi0EEET_SB_
Ltmp130:
; %bb.20:                               ;   in Loop: Header=BB3_4 Depth=2
	stp	xzr, xzr, [sp, #160]
	str	xzr, [sp, #176]
	cbz	w25, LBB3_40
; %bb.21:                               ;   in Loop: Header=BB3_4 Depth=2
	mov	x22, #0                         ; =0x0
	mov	x19, #0                         ; =0x0
	b	LBB3_24
LBB3_22:                                ;   in Loop: Header=BB3_24 Depth=3
	str	d8, [x22], #8
LBB3_23:                                ;   in Loop: Header=BB3_24 Depth=3
	str	x22, [sp, #168]
	add	x19, x19, #1
	cmp	x25, x19
	b.eq	LBB3_39
LBB3_24:                                ;   Parent Loop BB3_2 Depth=1
                                        ;     Parent Loop BB3_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	x10, #1                         ; =0x1
	movk	x10, #32, lsl #48
	add	x8, x10, #3
	tst	x19, #0x1
	ldur	x9, [x29, #-152]
	ldr	x9, [x9, x19, lsl #3]
	csel	x8, x10, x8, eq
	sub	x26, x8, x9
	ucvtf	d8, x26
	ldr	x28, [sp, #176]
	cmp	x22, x28
	b.hs	LBB3_26
; %bb.25:                               ;   in Loop: Header=BB3_24 Depth=3
	str	d8, [x22], #8
	b	LBB3_32
LBB3_26:                                ;   in Loop: Header=BB3_24 Depth=3
	ldr	x23, [sp, #160]
	sub	x24, x22, x23
	asr	x25, x24, #3
	add	x8, x25, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB3_96
; %bb.27:                               ;   in Loop: Header=BB3_24 Depth=3
	sub	x9, x28, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x21, x8, x9, lo
	lsr	x8, x21, #61
	cbnz	x8, LBB3_94
; %bb.28:                               ;   in Loop: Header=BB3_24 Depth=3
	lsl	x0, x21, #3
Ltmp132:
	bl	__Znwm
Ltmp133:
; %bb.29:                               ;   in Loop: Header=BB3_24 Depth=3
	add	x22, x0, x24
	add	x28, x0, x21, lsl #3
	sub	x25, x22, x25, lsl #3
	str	d8, [x22], #8
	mov	x0, x25
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	stp	x25, x22, [sp, #160]
	str	x28, [sp, #176]
	cbz	x23, LBB3_31
; %bb.30:                               ;   in Loop: Header=BB3_24 Depth=3
	mov	x0, x23
	bl	__ZdlPv
	ldr	x28, [sp, #176]
LBB3_31:                                ;   in Loop: Header=BB3_24 Depth=3
	ldr	x25, [sp, #120]                 ; 8-byte Folded Reload
LBB3_32:                                ;   in Loop: Header=BB3_24 Depth=3
	str	x22, [sp, #168]
	neg	x8, x26
	scvtf	d8, x8
	cmp	x22, x28
	b.lo	LBB3_22
; %bb.33:                               ;   in Loop: Header=BB3_24 Depth=3
	ldr	x23, [sp, #160]
	sub	x24, x22, x23
	asr	x25, x24, #3
	add	x8, x25, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB3_95
; %bb.34:                               ;   in Loop: Header=BB3_24 Depth=3
	sub	x9, x28, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x21, x8, x9, lo
	lsr	x8, x21, #61
	cbnz	x8, LBB3_97
; %bb.35:                               ;   in Loop: Header=BB3_24 Depth=3
	lsl	x0, x21, #3
Ltmp140:
	bl	__Znwm
Ltmp141:
; %bb.36:                               ;   in Loop: Header=BB3_24 Depth=3
	add	x22, x0, x24
	add	x21, x0, x21, lsl #3
	sub	x25, x22, x25, lsl #3
	str	d8, [x22], #8
	mov	x0, x25
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	stp	x25, x22, [sp, #160]
	str	x21, [sp, #176]
	cbz	x23, LBB3_38
; %bb.37:                               ;   in Loop: Header=BB3_24 Depth=3
	mov	x0, x23
	bl	__ZdlPv
LBB3_38:                                ;   in Loop: Header=BB3_24 Depth=3
	ldr	x25, [sp, #120]                 ; 8-byte Folded Reload
	b	LBB3_23
LBB3_39:                                ;   in Loop: Header=BB3_4 Depth=2
	ldr	x8, [sp, #160]
	b	LBB3_41
LBB3_40:                                ;   in Loop: Header=BB3_4 Depth=2
	mov	x8, #0                          ; =0x0
	mov	x22, #0                         ; =0x0
LBB3_41:                                ;   in Loop: Header=BB3_4 Depth=2
	scvtf	d0, wzr
	str	d0, [sp, #152]
	sub	x9, x22, x8
	asr	x10, x9, #3
	cmp	x10, #1023
	b.hi	LBB3_43
; %bb.42:                               ;   in Loop: Header=BB3_4 Depth=2
	mov	w8, #1024                       ; =0x400
	sub	x1, x8, x10
Ltmp148:
	add	x0, sp, #160
	add	x2, sp, #152
	bl	__ZNSt3__16vectorIdNS_9allocatorIdEEE8__appendEmRKd
Ltmp149:
	b	LBB3_45
LBB3_43:                                ;   in Loop: Header=BB3_4 Depth=2
	cmp	x9, #2, lsl #12                 ; =8192
	b.eq	LBB3_45
; %bb.44:                               ;   in Loop: Header=BB3_4 Depth=2
	add	x8, x8, #2, lsl #12             ; =8192
	str	x8, [sp, #168]
LBB3_45:                                ;   in Loop: Header=BB3_4 Depth=2
	scvtf	d0, wzr
	add	x0, sp, #160
	bl	__Z12ordered_foldIdET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	scvtf	d1, wzr
	fcmp	d0, d1
	b.ne	LBB3_105
; %bb.46:                               ;   in Loop: Header=BB3_4 Depth=2
Ltmp151:
	mov	w0, #16                         ; =0x10
	bl	__Znwm
Ltmp152:
; %bb.47:                               ;   in Loop: Header=BB3_4 Depth=2
	mov	x23, x0
	mov	x25, x0
	ldr	q0, [sp, #80]                   ; 16-byte Folded Reload
	str	q0, [x25], #16
	ldp	x22, x8, [x29, #-152]
	mov	x19, x25
	str	x8, [sp, #112]                  ; 8-byte Folded Spill
	b	LBB3_50
LBB3_48:                                ;   in Loop: Header=BB3_50 Depth=3
	str	x28, [x25], #8
LBB3_49:                                ;   in Loop: Header=BB3_50 Depth=3
	add	x22, x22, #8
	ldr	x8, [sp, #112]                  ; 8-byte Folded Reload
LBB3_50:                                ;   Parent Loop BB3_2 Depth=1
                                        ;     Parent Loop BB3_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	cmp	x22, x8
	b.eq	LBB3_71
; %bb.51:                               ;   in Loop: Header=BB3_50 Depth=3
	ldr	x28, [x22]
	cmp	x25, x19
	b.hs	LBB3_53
; %bb.52:                               ;   in Loop: Header=BB3_50 Depth=3
	str	x28, [x25]
	b	LBB3_57
LBB3_53:                                ;   in Loop: Header=BB3_50 Depth=3
	sub	x24, x25, x23
	asr	x26, x24, #3
	add	x8, x26, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB3_98
; %bb.54:                               ;   in Loop: Header=BB3_50 Depth=3
	sub	x9, x19, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x21, x8, x9, lo
	lsr	x8, x21, #61
	cbnz	x8, LBB3_99
; %bb.55:                               ;   in Loop: Header=BB3_50 Depth=3
	lsl	x0, x21, #3
Ltmp154:
	bl	__Znwm
Ltmp155:
; %bb.56:                               ;   in Loop: Header=BB3_50 Depth=3
	mov	x19, x0
	add	x25, x0, x24
	str	x28, [x25]
	sub	x26, x25, x26, lsl #3
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x19, x19, x21, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
LBB3_57:                                ;   in Loop: Header=BB3_50 Depth=3
	add	x8, x25, #8
	cmp	x28, #8
	b.ls	LBB3_60
; %bb.58:                               ;   in Loop: Header=BB3_50 Depth=3
	sub	x27, x28, #4
	cmp	x8, x19
	b.hs	LBB3_61
; %bb.59:                               ;   in Loop: Header=BB3_50 Depth=3
	str	x27, [x25, #8]
	add	x25, x25, #16
	b	LBB3_65
LBB3_60:                                ;   in Loop: Header=BB3_50 Depth=3
	add	x28, x28, #4
	mov	x25, x8
	b	LBB3_66
LBB3_61:                                ;   in Loop: Header=BB3_50 Depth=3
	sub	x24, x8, x23
	asr	x26, x24, #3
	add	x8, x26, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB3_102
; %bb.62:                               ;   in Loop: Header=BB3_50 Depth=3
	sub	x9, x19, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x21, x8, x9, lo
	lsr	x8, x21, #61
	cbnz	x8, LBB3_103
; %bb.63:                               ;   in Loop: Header=BB3_50 Depth=3
	lsl	x0, x21, #3
Ltmp162:
	bl	__Znwm
Ltmp163:
; %bb.64:                               ;   in Loop: Header=BB3_50 Depth=3
	mov	x19, x0
	add	x25, x0, x24
	sub	x26, x25, x26, lsl #3
	str	x27, [x25], #8
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x19, x19, x21, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
LBB3_65:                                ;   in Loop: Header=BB3_50 Depth=3
	add	x28, x28, #4
	lsr	x8, x28, #53
	cbnz	x8, LBB3_49
LBB3_66:                                ;   in Loop: Header=BB3_50 Depth=3
	cmp	x25, x19
	b.lo	LBB3_48
; %bb.67:                               ;   in Loop: Header=BB3_50 Depth=3
	sub	x24, x25, x23
	asr	x21, x24, #3
	add	x8, x21, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB3_100
; %bb.68:                               ;   in Loop: Header=BB3_50 Depth=3
	sub	x9, x19, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x27, x8, x9, lo
	lsr	x8, x27, #61
	cbnz	x8, LBB3_101
; %bb.69:                               ;   in Loop: Header=BB3_50 Depth=3
	lsl	x0, x27, #3
Ltmp170:
	bl	__Znwm
Ltmp171:
; %bb.70:                               ;   in Loop: Header=BB3_50 Depth=3
	mov	x19, x0
	add	x25, x0, x24
	sub	x26, x25, x21, lsl #3
	str	x28, [x25], #8
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x19, x19, x27, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
	b	LBB3_49
LBB3_71:                                ;   in Loop: Header=BB3_4 Depth=2
	mov	w22, #512                       ; =0x200
	b	LBB3_74
LBB3_72:                                ;   in Loop: Header=BB3_74 Depth=3
	str	x26, [x25]
	mov	x28, x25
LBB3_73:                                ;   in Loop: Header=BB3_74 Depth=3
	add	x25, x28, #8
	subs	w22, w22, #1
	b.eq	LBB3_79
LBB3_74:                                ;   Parent Loop BB3_2 Depth=1
                                        ;     Parent Loop BB3_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	ldr	x8, [x20, #2496]
	add	x9, x8, #1
	lsr	x10, x9, #3
	mov	x14, #3361                      ; =0xd21
	movk	x14, #8402, lsl #16
	movk	x14, #53773, lsl #32
	movk	x14, #3360, lsl #48
	umulh	x10, x10, x14
	lsr	x10, x10, #1
	mov	w15, #312                       ; =0x138
	msub	x9, x10, x15, x9
	ldr	x10, [x20, x8, lsl #3]
	and	x10, x10, #0xffffffff80000000
	ldr	x11, [x20, x9, lsl #3]
	and	x12, x11, #0x7ffffffe
	orr	x10, x12, x10
	add	x12, x8, #156
	lsr	x13, x12, #3
	umulh	x13, x13, x14
	lsr	x13, x13, #1
	msub	x12, x13, x15, x12
	ldr	x12, [x20, x12, lsl #3]
	tst	w11, #0x1
	mov	x11, #6633                      ; =0x19e9
	movk	x11, #43366, lsl #16
	movk	x11, #28506, lsl #32
	movk	x11, #46338, lsl #48
	csel	x11, x11, xzr, ne
	eor	x11, x11, x12
	eor	x10, x11, x10, lsr #1
	str	x10, [x20, x8, lsl #3]
	mov	x8, #6148914691236517205        ; =0x5555555555555555
	and	x8, x8, #0xfffffffff
	and	x8, x8, x10, lsr #29
	eor	x8, x8, x10
	str	x9, [x20, #2496]
	mov	x9, #3987079168                 ; =0xeda60000
	movk	x9, #32767, lsl #32
	movk	x9, #29142, lsl #48
	and	x9, x9, x8, lsl #17
	eor	x8, x9, x8
	mov	x9, #262645840084992            ; =0xeee000000000
	movk	x9, #65527, lsl #48
	and	x9, x9, x8, lsl #37
	eor	x8, x9, x8
	eor	x8, x8, x8, lsr #43
	lsr	x9, x8, #1
	mov	x10, #8193                      ; =0x2001
	movk	x10, #32768, lsl #48
	umulh	x9, x9, x10
	lsr	x9, x9, #49
	mov	x10, #2251799813685246          ; =0x7fffffffffffe
	msub	x8, x9, x10, x8
	lsl	x8, x8, #2
	add	x26, x8, #8
	cmp	x25, x19
	b.lo	LBB3_72
; %bb.75:                               ;   in Loop: Header=BB3_74 Depth=3
	sub	x24, x25, x23
	asr	x27, x24, #3
	add	x8, x27, #1
	lsr	x9, x8, #61
	cbnz	x9, LBB3_92
; %bb.76:                               ;   in Loop: Header=BB3_74 Depth=3
	sub	x9, x19, x23
	asr	x10, x9, #2
	cmp	x10, x8
	csel	x8, x10, x8, hi
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	cmp	x9, x10
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x19, x8, x9, lo
	lsr	x8, x19, #61
	cbnz	x8, LBB3_93
; %bb.77:                               ;   in Loop: Header=BB3_74 Depth=3
	lsl	x0, x19, #3
Ltmp178:
	bl	__Znwm
Ltmp179:
; %bb.78:                               ;   in Loop: Header=BB3_74 Depth=3
	mov	x25, x0
	add	x28, x0, x24
	str	x26, [x28]
	sub	x26, x28, x27, lsl #3
	mov	x0, x26
	mov	x1, x23
	mov	x2, x24
	bl	_memcpy
	add	x19, x25, x19, lsl #3
	mov	x0, x23
	bl	__ZdlPv
	mov	x23, x26
	b	LBB3_73
LBB3_79:                                ;   in Loop: Header=BB3_4 Depth=2
	mov	x19, x23
	cmp	x23, x25
	ldr	x25, [sp, #120]                 ; 8-byte Folded Reload
	b.eq	LBB3_86
LBB3_80:                                ;   Parent Loop BB3_2 Depth=1
                                        ;     Parent Loop BB3_4 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB3_82 Depth 4
	ldr	x22, [x19]
	ldp	x8, x9, [x29, #-152]
	subs	x9, x9, x8
	b.eq	LBB3_83
; %bb.81:                               ;   in Loop: Header=BB3_80 Depth=3
	asr	x10, x9, #3
	mov	x9, x8
LBB3_82:                                ;   Parent Loop BB3_2 Depth=1
                                        ;     Parent Loop BB3_4 Depth=2
                                        ;       Parent Loop BB3_80 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	lsr	x11, x10, #1
	add	x12, x9, x11, lsl #3
	ldr	x13, [x12], #8
	mvn	x14, x11
	add	x10, x10, x14
	cmp	x22, x13
	csel	x9, x9, x12, lo
	csel	x10, x11, x10, lo
	cbnz	x10, LBB3_82
	b	LBB3_84
LBB3_83:                                ;   in Loop: Header=BB3_80 Depth=3
	mov	x9, x8
LBB3_84:                                ;   in Loop: Header=BB3_80 Depth=3
	sub	x8, x9, x8
	asr	x8, x8, #3
	and	x9, x8, #0x1
	cmp	x8, #0
	cneg	x24, x9, lt
	sub	x21, x22, x24
	ucvtf	d0, x22
	add	x0, sp, #160
	bl	__Z12ordered_foldIdET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	ucvtf	d1, x21
	fcmp	d0, d1
	b.ne	LBB3_91
; %bb.85:                               ;   in Loop: Header=BB3_80 Depth=3
	ldr	x8, [sp, #144]                  ; 8-byte Folded Reload
	add	x9, x8, #1
	cmp	x24, #0
	ldr	x8, [sp, #136]                  ; 8-byte Folded Reload
	cinc	x8, x8, ne
	stp	x8, x9, [sp, #136]              ; 16-byte Folded Spill
	cmp	x19, x28
	add	x19, x19, #8
	b.ne	LBB3_80
LBB3_86:                                ;   in Loop: Header=BB3_4 Depth=2
	mov	x0, x23
	bl	__ZdlPv
	ldr	x0, [sp, #160]
	cbz	x0, LBB3_88
; %bb.87:                               ;   in Loop: Header=BB3_4 Depth=2
	str	x0, [sp, #168]
	bl	__ZdlPv
LBB3_88:                                ;   in Loop: Header=BB3_4 Depth=2
	ldur	x0, [x29, #-152]
	ldr	w19, [sp, #108]                 ; 4-byte Folded Reload
	cbz	x0, LBB3_3
; %bb.89:                               ;   in Loop: Header=BB3_4 Depth=2
	stur	x0, [x29, #-144]
	bl	__ZdlPv
	b	LBB3_3
LBB3_90:
	bl	__ZNSt3__16chrono12steady_clock3nowEv
	ldr	x8, [sp, #56]                   ; 8-byte Folded Reload
	sub	x8, x0, x8
	str	x8, [sp, #40]
	ldp	x8, x9, [sp, #136]              ; 16-byte Folded Reload
	stp	x9, x8, [sp, #24]
	mov	w8, #28                         ; =0x1c
	str	x8, [sp, #16]
	mov	w8, #53                         ; =0x35
	str	x8, [sp, #8]
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	str	x8, [sp]
Lloh32:
	adrp	x0, l_.str.4@PAGE
Lloh33:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #336]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #320]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #304]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #288]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #272]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #256]            ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #240]              ; 16-byte Folded Reload
	add	sp, sp, #352
	ret
LBB3_91:
Lloh34:
	adrp	x8, ___stderrp@GOTPAGE
Lloh35:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh36:
	ldr	x0, [x8]
	str	d0, [sp, #24]
	stp	x22, x21, [sp, #8]
	ldr	x8, [sp, #64]                   ; 8-byte Folded Reload
	str	x8, [sp]
Lloh37:
	adrp	x1, l_.str.3@PAGE
Lloh38:
	add	x1, x1, l_.str.3@PAGEOFF
	bl	_fprintf
Ltmp186:
	mov	w0, #1                          ; =0x1
	bl	_exit
Ltmp187:
	b	LBB3_104
LBB3_92:
Ltmp183:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp184:
	b	LBB3_104
LBB3_93:
Ltmp181:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp182:
	b	LBB3_104
LBB3_94:
Ltmp135:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp136:
	b	LBB3_104
LBB3_95:
Ltmp145:
	bl	__ZNSt3__16vectorIdNS_9allocatorIdEEE20__throw_length_errorB9nqe210106Ev
Ltmp146:
	b	LBB3_104
LBB3_96:
Ltmp137:
	bl	__ZNSt3__16vectorIdNS_9allocatorIdEEE20__throw_length_errorB9nqe210106Ev
Ltmp138:
	b	LBB3_104
LBB3_97:
Ltmp143:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp144:
	b	LBB3_104
LBB3_98:
Ltmp159:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp160:
	b	LBB3_104
LBB3_99:
Ltmp157:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp158:
	b	LBB3_104
LBB3_100:
Ltmp175:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp176:
	b	LBB3_104
LBB3_101:
Ltmp173:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp174:
	b	LBB3_104
LBB3_102:
Ltmp167:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp168:
	b	LBB3_104
LBB3_103:
Ltmp165:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
Ltmp166:
LBB3_104:
	brk	#0x1
LBB3_105:
	bl	_abort
LBB3_106:
Ltmp150:
	mov	x19, x0
	b	LBB3_124
LBB3_107:
Ltmp153:
	mov	x19, x0
	b	LBB3_124
LBB3_108:
Ltmp131:
	mov	x19, x0
	b	LBB3_128
LBB3_109:
Ltmp164:
	b	LBB3_123
LBB3_110:
Ltmp172:
	b	LBB3_123
LBB3_111:
Ltmp156:
	b	LBB3_123
LBB3_112:
Ltmp169:
	b	LBB3_123
LBB3_113:
Ltmp134:
	mov	x19, x0
	b	LBB3_124
LBB3_114:
Ltmp142:
	mov	x19, x0
	b	LBB3_124
LBB3_115:
Ltmp177:
	b	LBB3_123
LBB3_116:
Ltmp128:
	mov	x19, x0
	b	LBB3_129
LBB3_117:
Ltmp180:
	b	LBB3_123
LBB3_118:
Ltmp188:
	b	LBB3_123
LBB3_119:
Ltmp161:
	b	LBB3_123
LBB3_120:
Ltmp147:
	mov	x19, x0
	b	LBB3_124
LBB3_121:
Ltmp139:
	mov	x19, x0
	b	LBB3_124
LBB3_122:
Ltmp185:
LBB3_123:
	mov	x19, x0
	mov	x0, x23
	bl	__ZdlPv
LBB3_124:
	ldr	x0, [sp, #160]
	cbz	x0, LBB3_126
; %bb.125:
	str	x0, [sp, #168]
	bl	__ZdlPv
LBB3_126:
	ldur	x0, [x29, #-152]
	cbz	x0, LBB3_128
; %bb.127:
	stur	x0, [x29, #-144]
	bl	__ZdlPv
LBB3_128:
	ldur	x23, [x29, #-120]
LBB3_129:
	sub	x0, x29, #128
	mov	x1, x23
	bl	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpLdr	Lloh28, Lloh29
	.loh AdrpAdd	Lloh30, Lloh31
	.loh AdrpAdd	Lloh32, Lloh33
	.loh AdrpAdd	Lloh37, Lloh38
	.loh AdrpLdrGotLdr	Lloh34, Lloh35, Lloh36
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table3:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Ltmp126-Lfunc_begin2           ; >> Call Site 1 <<
	.uleb128 Ltmp127-Ltmp126                ;   Call between Ltmp126 and Ltmp127
	.uleb128 Ltmp128-Lfunc_begin2           ;     jumps to Ltmp128
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp129-Lfunc_begin2           ; >> Call Site 2 <<
	.uleb128 Ltmp130-Ltmp129                ;   Call between Ltmp129 and Ltmp130
	.uleb128 Ltmp131-Lfunc_begin2           ;     jumps to Ltmp131
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp132-Lfunc_begin2           ; >> Call Site 3 <<
	.uleb128 Ltmp133-Ltmp132                ;   Call between Ltmp132 and Ltmp133
	.uleb128 Ltmp134-Lfunc_begin2           ;     jumps to Ltmp134
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp133-Lfunc_begin2           ; >> Call Site 4 <<
	.uleb128 Ltmp140-Ltmp133                ;   Call between Ltmp133 and Ltmp140
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp140-Lfunc_begin2           ; >> Call Site 5 <<
	.uleb128 Ltmp141-Ltmp140                ;   Call between Ltmp140 and Ltmp141
	.uleb128 Ltmp142-Lfunc_begin2           ;     jumps to Ltmp142
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp141-Lfunc_begin2           ; >> Call Site 6 <<
	.uleb128 Ltmp148-Ltmp141                ;   Call between Ltmp141 and Ltmp148
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp148-Lfunc_begin2           ; >> Call Site 7 <<
	.uleb128 Ltmp149-Ltmp148                ;   Call between Ltmp148 and Ltmp149
	.uleb128 Ltmp150-Lfunc_begin2           ;     jumps to Ltmp150
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp151-Lfunc_begin2           ; >> Call Site 8 <<
	.uleb128 Ltmp152-Ltmp151                ;   Call between Ltmp151 and Ltmp152
	.uleb128 Ltmp153-Lfunc_begin2           ;     jumps to Ltmp153
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp154-Lfunc_begin2           ; >> Call Site 9 <<
	.uleb128 Ltmp155-Ltmp154                ;   Call between Ltmp154 and Ltmp155
	.uleb128 Ltmp156-Lfunc_begin2           ;     jumps to Ltmp156
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp155-Lfunc_begin2           ; >> Call Site 10 <<
	.uleb128 Ltmp162-Ltmp155                ;   Call between Ltmp155 and Ltmp162
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp162-Lfunc_begin2           ; >> Call Site 11 <<
	.uleb128 Ltmp163-Ltmp162                ;   Call between Ltmp162 and Ltmp163
	.uleb128 Ltmp164-Lfunc_begin2           ;     jumps to Ltmp164
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp163-Lfunc_begin2           ; >> Call Site 12 <<
	.uleb128 Ltmp170-Ltmp163                ;   Call between Ltmp163 and Ltmp170
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp170-Lfunc_begin2           ; >> Call Site 13 <<
	.uleb128 Ltmp171-Ltmp170                ;   Call between Ltmp170 and Ltmp171
	.uleb128 Ltmp172-Lfunc_begin2           ;     jumps to Ltmp172
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp171-Lfunc_begin2           ; >> Call Site 14 <<
	.uleb128 Ltmp178-Ltmp171                ;   Call between Ltmp171 and Ltmp178
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp178-Lfunc_begin2           ; >> Call Site 15 <<
	.uleb128 Ltmp179-Ltmp178                ;   Call between Ltmp178 and Ltmp179
	.uleb128 Ltmp180-Lfunc_begin2           ;     jumps to Ltmp180
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp179-Lfunc_begin2           ; >> Call Site 16 <<
	.uleb128 Ltmp186-Ltmp179                ;   Call between Ltmp179 and Ltmp186
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp186-Lfunc_begin2           ; >> Call Site 17 <<
	.uleb128 Ltmp187-Ltmp186                ;   Call between Ltmp186 and Ltmp187
	.uleb128 Ltmp188-Lfunc_begin2           ;     jumps to Ltmp188
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp183-Lfunc_begin2           ; >> Call Site 18 <<
	.uleb128 Ltmp182-Ltmp183                ;   Call between Ltmp183 and Ltmp182
	.uleb128 Ltmp185-Lfunc_begin2           ;     jumps to Ltmp185
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp135-Lfunc_begin2           ; >> Call Site 19 <<
	.uleb128 Ltmp136-Ltmp135                ;   Call between Ltmp135 and Ltmp136
	.uleb128 Ltmp139-Lfunc_begin2           ;     jumps to Ltmp139
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp145-Lfunc_begin2           ; >> Call Site 20 <<
	.uleb128 Ltmp146-Ltmp145                ;   Call between Ltmp145 and Ltmp146
	.uleb128 Ltmp147-Lfunc_begin2           ;     jumps to Ltmp147
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp137-Lfunc_begin2           ; >> Call Site 21 <<
	.uleb128 Ltmp138-Ltmp137                ;   Call between Ltmp137 and Ltmp138
	.uleb128 Ltmp139-Lfunc_begin2           ;     jumps to Ltmp139
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp143-Lfunc_begin2           ; >> Call Site 22 <<
	.uleb128 Ltmp144-Ltmp143                ;   Call between Ltmp143 and Ltmp144
	.uleb128 Ltmp147-Lfunc_begin2           ;     jumps to Ltmp147
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp159-Lfunc_begin2           ; >> Call Site 23 <<
	.uleb128 Ltmp158-Ltmp159                ;   Call between Ltmp159 and Ltmp158
	.uleb128 Ltmp161-Lfunc_begin2           ;     jumps to Ltmp161
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp175-Lfunc_begin2           ; >> Call Site 24 <<
	.uleb128 Ltmp174-Ltmp175                ;   Call between Ltmp175 and Ltmp174
	.uleb128 Ltmp177-Lfunc_begin2           ;     jumps to Ltmp177
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp167-Lfunc_begin2           ; >> Call Site 25 <<
	.uleb128 Ltmp166-Ltmp167                ;   Call between Ltmp167 and Ltmp166
	.uleb128 Ltmp169-Lfunc_begin2           ;     jumps to Ltmp169
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp166-Lfunc_begin2           ; >> Call Site 26 <<
	.uleb128 Lfunc_end2-Ltmp166             ;   Call between Ltmp166 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z12ordered_foldIDF16_ET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE ; -- Begin function _Z12ordered_foldIDF16_ET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	.weak_def_can_be_hidden	__Z12ordered_foldIDF16_ET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	.p2align	2
__Z12ordered_foldIDF16_ET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE: ; @_Z12ordered_foldIDF16_ET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	h0, [sp, #14]
	ldp	x8, x9, [x0]
	cmp	x8, x9
	b.eq	LBB4_2
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	h0, [x8], #2
	ldr	h1, [sp, #14]
	fadd	h0, h1, h0
	str	h0, [sp, #14]
	cmp	x8, x9
	b.ne	LBB4_1
LBB4_2:
	ldr	h0, [sp, #14]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZSt28__throw_bad_array_new_lengthB9nqe210106v ; -- Begin function _ZSt28__throw_bad_array_new_lengthB9nqe210106v
	.globl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
	.weak_def_can_be_hidden	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
	.p2align	2
__ZSt28__throw_bad_array_new_lengthB9nqe210106v: ; @_ZSt28__throw_bad_array_new_lengthB9nqe210106v
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w0, #8                          ; =0x8
	bl	___cxa_allocate_exception
	bl	__ZNSt20bad_array_new_lengthC1Ev
Lloh39:
	adrp	x1, __ZTISt20bad_array_new_length@GOTPAGE
Lloh40:
	ldr	x1, [x1, __ZTISt20bad_array_new_length@GOTPAGEOFF]
Lloh41:
	adrp	x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGE
Lloh42:
	ldr	x2, [x2, __ZNSt20bad_array_new_lengthD1Ev@GOTPAGEOFF]
	bl	___cxa_throw
	.loh AdrpLdrGot	Lloh41, Lloh42
	.loh AdrpLdrGot	Lloh39, Lloh40
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__127__tree_balance_after_insertB9nqe210106IPNS_16__tree_node_baseIPvEEEEvT_S5_ ; -- Begin function _ZNSt3__127__tree_balance_after_insertB9nqe210106IPNS_16__tree_node_baseIPvEEEEvT_S5_
	.globl	__ZNSt3__127__tree_balance_after_insertB9nqe210106IPNS_16__tree_node_baseIPvEEEEvT_S5_
	.weak_def_can_be_hidden	__ZNSt3__127__tree_balance_after_insertB9nqe210106IPNS_16__tree_node_baseIPvEEEEvT_S5_
	.p2align	2
__ZNSt3__127__tree_balance_after_insertB9nqe210106IPNS_16__tree_node_baseIPvEEEEvT_S5_: ; @_ZNSt3__127__tree_balance_after_insertB9nqe210106IPNS_16__tree_node_baseIPvEEEEvT_S5_
	.cfi_startproc
; %bb.0:
	cmp	x1, x0
	cset	w8, eq
	strb	w8, [x1, #24]
	b.eq	LBB6_39
; %bb.1:
	mov	w11, #1                         ; =0x1
	b	LBB6_3
LBB6_2:                                 ;   in Loop: Header=BB6_3 Depth=1
	mov	x1, x8
	cmp	x8, x0
	b.eq	LBB6_39
LBB6_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x9, [x1, #16]
	ldrb	w8, [x9, #24]
	tbnz	w8, #0, LBB6_39
; %bb.4:                                ;   in Loop: Header=BB6_3 Depth=1
	ldr	x8, [x9, #16]
	ldr	x10, [x8]
	cmp	x9, x10
	b.eq	LBB6_8
; %bb.5:                                ;   in Loop: Header=BB6_3 Depth=1
	cbz	x10, LBB6_11
; %bb.6:                                ;   in Loop: Header=BB6_3 Depth=1
	ldrb	w12, [x10, #24]
	tbnz	w12, #0, LBB6_11
; %bb.7:                                ;   in Loop: Header=BB6_3 Depth=1
	strb	w11, [x9, #24]
	cmp	x8, x0
	cset	w9, eq
	strb	w9, [x8, #24]
	strb	w11, [x10, #24]
	b	LBB6_2
LBB6_8:                                 ;   in Loop: Header=BB6_3 Depth=1
	ldr	x12, [x8, #8]
	cbz	x12, LBB6_13
; %bb.9:                                ;   in Loop: Header=BB6_3 Depth=1
	ldrb	w13, [x12, #24]
	tbnz	w13, #0, LBB6_13
; %bb.10:                               ;   in Loop: Header=BB6_3 Depth=1
	strb	w11, [x9, #24]
	cmp	x8, x0
	cset	w9, eq
	strb	w9, [x8, #24]
	strb	w11, [x12, #24]
	b	LBB6_2
LBB6_11:
	ldr	x10, [x9]
	cmp	x1, x10
	b.eq	LBB6_17
; %bb.12:
	mov	x10, x9
	b	LBB6_33
LBB6_13:
	ldr	x11, [x9]
	cmp	x1, x11
	b.eq	LBB6_21
; %bb.14:
	ldr	x11, [x9, #8]
	ldr	x10, [x11]
	str	x10, [x9, #8]
	cbz	x10, LBB6_22
; %bb.15:
	str	x9, [x10, #16]
	ldr	x8, [x9, #16]
	ldr	x10, [x8]
	str	x8, [x11, #16]
	cmp	x9, x10
	b.eq	LBB6_23
; %bb.16:
	str	x11, [x8, #8]
	b	LBB6_24
LBB6_17:
	ldr	x11, [x10, #8]
	str	x11, [x9]
	cbz	x11, LBB6_19
; %bb.18:
	str	x9, [x11, #16]
	ldr	x8, [x9, #16]
LBB6_19:
	str	x8, [x10, #16]
	ldr	x11, [x8]
	cmp	x9, x11
	b.eq	LBB6_31
; %bb.20:
	str	x10, [x8, #8]
	b	LBB6_32
LBB6_21:
	mov	x11, x9
	b	LBB6_25
LBB6_22:
	str	x8, [x11, #16]
LBB6_23:
	str	x11, [x8]
LBB6_24:
	str	x9, [x11]
	str	x11, [x9, #16]
	ldr	x8, [x11, #16]
	ldr	x10, [x8]
LBB6_25:
	mov	w9, #1                          ; =0x1
	strb	w9, [x11, #24]
	strb	wzr, [x8, #24]
	ldr	x9, [x10, #8]
	str	x9, [x8]
	cbz	x9, LBB6_27
; %bb.26:
	str	x8, [x9, #16]
LBB6_27:
	ldr	x9, [x8, #16]
	str	x9, [x10, #16]
	ldr	x11, [x9]
	cmp	x8, x11
	b.eq	LBB6_29
; %bb.28:
	str	x10, [x9, #8]
	b	LBB6_30
LBB6_29:
	str	x10, [x9]
LBB6_30:
	str	x8, [x10, #8]
	str	x10, [x8, #16]
	ret
LBB6_31:
	str	x10, [x8]
LBB6_32:
	str	x9, [x10, #8]
	str	x10, [x9, #16]
	ldr	x8, [x10, #16]
LBB6_33:
	mov	w9, #1                          ; =0x1
	strb	w9, [x10, #24]
	strb	wzr, [x8, #24]
	ldr	x9, [x8, #8]
	ldr	x10, [x9]
	str	x10, [x8, #8]
	cbz	x10, LBB6_35
; %bb.34:
	str	x8, [x10, #16]
LBB6_35:
	ldr	x10, [x8, #16]
	str	x10, [x9, #16]
	ldr	x11, [x10]
	cmp	x8, x11
	b.eq	LBB6_37
; %bb.36:
	str	x9, [x10, #8]
	b	LBB6_38
LBB6_37:
	str	x9, [x10]
LBB6_38:
	str	x8, [x9]
	str	x9, [x8, #16]
LBB6_39:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__16vectorIyNS_9allocatorIyEEEC2B9nqe210106INS_21__tree_const_iteratorIyPNS_11__tree_nodeIyPvEElEELi0EEET_SB_ ; -- Begin function _ZNSt3__16vectorIyNS_9allocatorIyEEEC2B9nqe210106INS_21__tree_const_iteratorIyPNS_11__tree_nodeIyPvEElEELi0EEET_SB_
	.weak_def_can_be_hidden	__ZNSt3__16vectorIyNS_9allocatorIyEEEC2B9nqe210106INS_21__tree_const_iteratorIyPNS_11__tree_nodeIyPvEElEELi0EEET_SB_
	.p2align	2
__ZNSt3__16vectorIyNS_9allocatorIyEEEC2B9nqe210106INS_21__tree_const_iteratorIyPNS_11__tree_nodeIyPvEElEELi0EEET_SB_: ; @_ZNSt3__16vectorIyNS_9allocatorIyEEEC2B9nqe210106INS_21__tree_const_iteratorIyPNS_11__tree_nodeIyPvEElEELi0EEET_SB_
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
	stp	xzr, xzr, [x0]
	str	xzr, [x0, #16]
	cmp	x1, x2
	b.eq	LBB7_14
; %bb.1:
	mov	x20, x2
	mov	x21, x1
	mov	x22, #0                         ; =0x0
	mov	x9, x1
	b	LBB7_3
LBB7_2:                                 ;   in Loop: Header=BB7_3 Depth=1
	add	x22, x8, #1
	mov	x9, x10
	cmp	x10, x20
	b.eq	LBB7_6
LBB7_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_4 Depth 2
                                        ;     Child Loop BB7_5 Depth 2
	mov	x8, x22
	ldr	x11, [x9, #8]
	cbz	x11, LBB7_5
LBB7_4:                                 ;   Parent Loop BB7_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	x10, x11
	ldr	x11, [x11]
	cbnz	x11, LBB7_4
	b	LBB7_2
LBB7_5:                                 ;   Parent Loop BB7_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x10, [x9, #16]
	ldr	x11, [x10]
	cmp	x9, x11
	mov	x9, x10
	b.ne	LBB7_5
	b	LBB7_2
LBB7_6:
	mov	x9, #2305843009213693951        ; =0x1fffffffffffffff
	cmp	x8, x9
	b.hs	LBB7_15
; %bb.7:
	lsl	x0, x22, #3
Ltmp190:
	bl	__Znwm
Ltmp191:
; %bb.8:
	stp	x0, x0, [x19]
	add	x8, x0, x22, lsl #3
	str	x8, [x19, #16]
	b	LBB7_10
LBB7_9:                                 ;   in Loop: Header=BB7_10 Depth=1
	add	x0, x0, #8
	mov	x21, x8
	cmp	x8, x20
	b.eq	LBB7_13
LBB7_10:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_11 Depth 2
                                        ;     Child Loop BB7_12 Depth 2
	ldr	x8, [x21, #32]
	str	x8, [x0]
	ldr	x9, [x21, #8]
	cbz	x9, LBB7_12
LBB7_11:                                ;   Parent Loop BB7_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	x8, x9
	ldr	x9, [x9]
	cbnz	x9, LBB7_11
	b	LBB7_9
LBB7_12:                                ;   Parent Loop BB7_10 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x8, [x21, #16]
	ldr	x9, [x8]
	cmp	x21, x9
	mov	x21, x8
	b.ne	LBB7_12
	b	LBB7_9
LBB7_13:
	str	x0, [x19, #8]
LBB7_14:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB7_15:
Ltmp192:
	bl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
Ltmp193:
; %bb.16:
	brk	#0x1
LBB7_17:
Ltmp194:
	mov	x20, x0
	ldr	x0, [x19]
	cbz	x0, LBB7_19
; %bb.18:
	str	x0, [x19, #8]
	bl	__ZdlPv
LBB7_19:
	mov	x0, x20
	bl	__Unwind_Resume
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table7:
Lexception3:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Ltmp190-Lfunc_begin3           ; >> Call Site 1 <<
	.uleb128 Ltmp193-Ltmp190                ;   Call between Ltmp190 and Ltmp193
	.uleb128 Ltmp194-Lfunc_begin3           ;     jumps to Ltmp194
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp193-Lfunc_begin3           ; >> Call Site 2 <<
	.uleb128 Lfunc_end3-Ltmp193             ;   Call between Ltmp193 and Lfunc_end3
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end3:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev ; -- Begin function _ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
	.globl	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
	.p2align	2
__ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev: ; @_ZNSt3__16vectorIyNS_9allocatorIyEEE20__throw_length_errorB9nqe210106Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh43:
	adrp	x0, l_.str.5@PAGE
Lloh44:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB9nqe210106EPKc
	.loh AdrpAdd	Lloh43, Lloh44
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__120__throw_length_errorB9nqe210106EPKc ; -- Begin function _ZNSt3__120__throw_length_errorB9nqe210106EPKc
	.globl	__ZNSt3__120__throw_length_errorB9nqe210106EPKc
	.weak_def_can_be_hidden	__ZNSt3__120__throw_length_errorB9nqe210106EPKc
	.p2align	2
__ZNSt3__120__throw_length_errorB9nqe210106EPKc: ; @_ZNSt3__120__throw_length_errorB9nqe210106EPKc
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x20, x0
	mov	w0, #16                         ; =0x10
	bl	___cxa_allocate_exception
	mov	x19, x0
Ltmp195:
	mov	x1, x20
	bl	__ZNSt12length_errorC1B9nqe210106EPKc
Ltmp196:
; %bb.1:
Lloh45:
	adrp	x1, __ZTISt12length_error@GOTPAGE
Lloh46:
	ldr	x1, [x1, __ZTISt12length_error@GOTPAGEOFF]
Lloh47:
	adrp	x2, __ZNSt12length_errorD1Ev@GOTPAGE
Lloh48:
	ldr	x2, [x2, __ZNSt12length_errorD1Ev@GOTPAGEOFF]
	mov	x0, x19
	bl	___cxa_throw
LBB9_2:
Ltmp197:
	mov	x20, x0
	mov	x0, x19
	bl	___cxa_free_exception
	mov	x0, x20
	bl	__Unwind_Resume
	.loh AdrpLdrGot	Lloh47, Lloh48
	.loh AdrpLdrGot	Lloh45, Lloh46
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table9:
Lexception4:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Lfunc_begin4-Lfunc_begin4      ; >> Call Site 1 <<
	.uleb128 Ltmp195-Lfunc_begin4           ;   Call between Lfunc_begin4 and Ltmp195
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp195-Lfunc_begin4           ; >> Call Site 2 <<
	.uleb128 Ltmp196-Ltmp195                ;   Call between Ltmp195 and Ltmp196
	.uleb128 Ltmp197-Lfunc_begin4           ;     jumps to Ltmp197
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp196-Lfunc_begin4           ; >> Call Site 3 <<
	.uleb128 Lfunc_end4-Ltmp196             ;   Call between Ltmp196 and Lfunc_end4
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end4:
	.p2align	2, 0x0
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt12length_errorC1B9nqe210106EPKc ; -- Begin function _ZNSt12length_errorC1B9nqe210106EPKc
	.globl	__ZNSt12length_errorC1B9nqe210106EPKc
	.weak_def_can_be_hidden	__ZNSt12length_errorC1B9nqe210106EPKc
	.p2align	2
__ZNSt12length_errorC1B9nqe210106EPKc:  ; @_ZNSt12length_errorC1B9nqe210106EPKc
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	__ZNSt11logic_errorC2EPKc
Lloh49:
	adrp	x8, __ZTVSt12length_error@GOTPAGE
Lloh50:
	ldr	x8, [x8, __ZTVSt12length_error@GOTPAGEOFF]
	add	x8, x8, #16
	str	x8, [x0]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh49, Lloh50
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE20__throw_length_errorB9nqe210106Ev ; -- Begin function _ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE20__throw_length_errorB9nqe210106Ev
	.globl	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE20__throw_length_errorB9nqe210106Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE20__throw_length_errorB9nqe210106Ev
	.p2align	2
__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE20__throw_length_errorB9nqe210106Ev: ; @_ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE20__throw_length_errorB9nqe210106Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh51:
	adrp	x0, l_.str.5@PAGE
Lloh52:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB9nqe210106EPKc
	.loh AdrpAdd	Lloh51, Lloh52
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE8__appendEmRKDF16_ ; -- Begin function _ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE8__appendEmRKDF16_
	.globl	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE8__appendEmRKDF16_
	.weak_def_can_be_hidden	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE8__appendEmRKDF16_
	.p2align	2
__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE8__appendEmRKDF16_: ; @_ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE8__appendEmRKDF16_
	.cfi_startproc
; %bb.0:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x0
	ldp	x22, x8, [x0, #8]
	sub	x9, x8, x22
	cmp	x1, x9, asr #1
	b.ls	LBB12_5
; %bb.1:
	ldr	x20, [x19]
	sub	x21, x22, x20
	asr	x23, x21, #1
	adds	x9, x23, x1
	b.mi	LBB12_36
; %bb.2:
	sub	x8, x8, x20
	cmp	x8, x9
	csel	x9, x8, x9, hi
	mov	x10, #9223372036854775806       ; =0x7ffffffffffffffe
	mov	x11, #9223372036854775807       ; =0x7fffffffffffffff
	cmp	x8, x10
	csel	x24, x9, x11, lo
	cbz	x24, LBB12_9
; %bb.3:
	tbnz	x24, #63, LBB12_37
; %bb.4:
	mov	x25, x1
	mov	x26, x2
	lsl	x0, x24, #1
	bl	__Znwm
	mov	x2, x26
	mov	x1, x25
	b	LBB12_10
LBB12_5:
	cbz	x1, LBB12_34
; %bb.6:
	lsl	x9, x1, #1
	add	x8, x22, x9
	ldr	h0, [x2]
	sub	x10, x9, #2
	cmp	x10, #6
	b.lo	LBB12_32
; %bb.7:
	lsr	x9, x10, #1
	add	x9, x9, #1
	cmp	x10, #62
	b.hs	LBB12_20
; %bb.8:
	mov	x10, #0                         ; =0x0
	b	LBB12_24
LBB12_9:
	mov	x0, #0                          ; =0x0
LBB12_10:
	lsl	x9, x1, #1
	add	x8, x0, x21
	add	x25, x8, x9
	ldr	h0, [x2]
	sub	x11, x9, #2
	mov	x10, x8
	cmp	x11, #6
	b.lo	LBB12_28
; %bb.11:
	lsr	x9, x11, #1
	add	x9, x9, #1
	cmp	x11, #62
	b.hs	LBB12_13
; %bb.12:
	mov	x11, #0                         ; =0x0
	b	LBB12_17
LBB12_13:
	and	x11, x9, #0xffffffffffffffe0
	dup.8h	v1, v0[0]
	add	x10, x21, x0
	add	x10, x10, #32
	mov	x12, x11
LBB12_14:                               ; =>This Inner Loop Header: Depth=1
	stp	q1, q1, [x10, #-32]
	stp	q1, q1, [x10], #64
	subs	x12, x12, #32
	b.ne	LBB12_14
; %bb.15:
	cmp	x9, x11
	b.eq	LBB12_29
; %bb.16:
	tst	x9, #0x1c
	b.eq	LBB12_27
LBB12_17:
	and	x12, x9, #0xfffffffffffffffc
	add	x10, x8, x12, lsl #1
	dup.4h	v1, v0[0]
	add	x13, x22, x11, lsl #1
	sub	x13, x13, x20
	add	x13, x0, x13
	sub	x11, x11, x12
LBB12_18:                               ; =>This Inner Loop Header: Depth=1
	str	d1, [x13], #8
	adds	x11, x11, #4
	b.ne	LBB12_18
; %bb.19:
	cmp	x9, x12
	b.ne	LBB12_28
	b	LBB12_29
LBB12_20:
	and	x10, x9, #0xffffffffffffffe0
	dup.8h	v1, v0[0]
	add	x11, x22, #32
	mov	x12, x10
LBB12_21:                               ; =>This Inner Loop Header: Depth=1
	stp	q1, q1, [x11, #-32]
	stp	q1, q1, [x11], #64
	subs	x12, x12, #32
	b.ne	LBB12_21
; %bb.22:
	cmp	x9, x10
	b.eq	LBB12_33
; %bb.23:
	tst	x9, #0x1c
	b.eq	LBB12_31
LBB12_24:
	and	x11, x9, #0xfffffffffffffffc
	add	x12, x22, x11, lsl #1
	dup.4h	v1, v0[0]
	add	x13, x22, x10, lsl #1
	sub	x10, x10, x11
LBB12_25:                               ; =>This Inner Loop Header: Depth=1
	str	d1, [x13], #8
	adds	x10, x10, #4
	b.ne	LBB12_25
; %bb.26:
	mov	x22, x12
	cmp	x9, x11
	b.ne	LBB12_32
	b	LBB12_33
LBB12_27:
	add	x10, x8, x11, lsl #1
LBB12_28:                               ; =>This Inner Loop Header: Depth=1
	str	h0, [x10], #2
	cmp	x10, x25
	b.ne	LBB12_28
LBB12_29:
	add	x24, x0, x24, lsl #1
	sub	x22, x8, x23, lsl #1
	mov	x0, x22
	mov	x1, x20
	mov	x2, x21
	bl	_memcpy
	stp	x22, x25, [x19]
	str	x24, [x19, #16]
	cbz	x20, LBB12_35
; %bb.30:
	mov	x0, x20
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	b	__ZdlPv
LBB12_31:
	add	x22, x22, x10, lsl #1
LBB12_32:                               ; =>This Inner Loop Header: Depth=1
	str	h0, [x22], #2
	cmp	x22, x8
	b.ne	LBB12_32
LBB12_33:
	mov	x22, x8
LBB12_34:
	str	x22, [x19, #8]
LBB12_35:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
LBB12_36:
	bl	__ZNSt3__16vectorIDF16_NS_9allocatorIDF16_EEE20__throw_length_errorB9nqe210106Ev
LBB12_37:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE ; -- Begin function _ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	.globl	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	.weak_def_can_be_hidden	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	.p2align	2
__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE: ; @_ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	.cfi_startproc
; %bb.0:
	cbz	x1, LBB13_2
; %bb.1:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	ldr	x8, [x1]
	mov	x19, x0
	mov	x20, x1
	mov	x1, x8
	bl	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	ldr	x1, [x20, #8]
	mov	x0, x19
	bl	__ZNSt3__16__treeIyNS_4lessIyEENS_9allocatorIyEEE7destroyEPNS_11__tree_nodeIyPvEE
	mov	x0, x20
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	__ZdlPv
LBB13_2:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z12ordered_foldIfET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE ; -- Begin function _Z12ordered_foldIfET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	.weak_def_can_be_hidden	__Z12ordered_foldIfET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	.p2align	2
__Z12ordered_foldIfET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE: ; @_Z12ordered_foldIfET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	s0, [sp, #12]
	ldp	x8, x9, [x0]
	cmp	x8, x9
	b.eq	LBB14_2
LBB14_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	s0, [x8], #4
	ldr	s1, [sp, #12]
	fadd	s0, s1, s0
	str	s0, [sp, #12]
	cmp	x8, x9
	b.ne	LBB14_1
LBB14_2:
	ldr	s0, [sp, #12]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIfNS_9allocatorIfEEE20__throw_length_errorB9nqe210106Ev ; -- Begin function _ZNSt3__16vectorIfNS_9allocatorIfEEE20__throw_length_errorB9nqe210106Ev
	.globl	__ZNSt3__16vectorIfNS_9allocatorIfEEE20__throw_length_errorB9nqe210106Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIfNS_9allocatorIfEEE20__throw_length_errorB9nqe210106Ev
	.p2align	2
__ZNSt3__16vectorIfNS_9allocatorIfEEE20__throw_length_errorB9nqe210106Ev: ; @_ZNSt3__16vectorIfNS_9allocatorIfEEE20__throw_length_errorB9nqe210106Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh53:
	adrp	x0, l_.str.5@PAGE
Lloh54:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB9nqe210106EPKc
	.loh AdrpAdd	Lloh53, Lloh54
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIfNS_9allocatorIfEEE8__appendEmRKf ; -- Begin function _ZNSt3__16vectorIfNS_9allocatorIfEEE8__appendEmRKf
	.globl	__ZNSt3__16vectorIfNS_9allocatorIfEEE8__appendEmRKf
	.weak_def_can_be_hidden	__ZNSt3__16vectorIfNS_9allocatorIfEEE8__appendEmRKf
	.p2align	2
__ZNSt3__16vectorIfNS_9allocatorIfEEE8__appendEmRKf: ; @_ZNSt3__16vectorIfNS_9allocatorIfEEE8__appendEmRKf
	.cfi_startproc
; %bb.0:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x0
	ldp	x22, x8, [x0, #8]
	sub	x9, x8, x22
	cmp	x1, x9, asr #2
	b.ls	LBB16_5
; %bb.1:
	ldr	x20, [x19]
	sub	x21, x22, x20
	asr	x23, x21, #2
	add	x9, x23, x1
	lsr	x10, x9, #62
	cbnz	x10, LBB16_36
; %bb.2:
	mov	x10, #9223372036854775804       ; =0x7ffffffffffffffc
	sub	x8, x8, x20
	asr	x11, x8, #1
	cmp	x11, x9
	csel	x9, x11, x9, hi
	cmp	x8, x10
	mov	x8, #4611686018427387903        ; =0x3fffffffffffffff
	csel	x24, x9, x8, lo
	cbz	x24, LBB16_9
; %bb.3:
	lsr	x8, x24, #62
	cbnz	x8, LBB16_37
; %bb.4:
	mov	x25, x1
	mov	x26, x2
	lsl	x0, x24, #2
	bl	__Znwm
	mov	x2, x26
	mov	x1, x25
	b	LBB16_10
LBB16_5:
	cbz	x1, LBB16_34
; %bb.6:
	lsl	x9, x1, #2
	add	x8, x22, x9
	ldr	s0, [x2]
	sub	x10, x9, #4
	cmp	x10, #12
	b.lo	LBB16_32
; %bb.7:
	lsr	x9, x10, #2
	add	x9, x9, #1
	cmp	x10, #60
	b.hs	LBB16_20
; %bb.8:
	mov	x10, #0                         ; =0x0
	b	LBB16_24
LBB16_9:
	mov	x0, #0                          ; =0x0
LBB16_10:
	lsl	x9, x1, #2
	add	x8, x0, x21
	add	x25, x8, x9
	ldr	s0, [x2]
	sub	x11, x9, #4
	mov	x10, x8
	cmp	x11, #12
	b.lo	LBB16_28
; %bb.11:
	lsr	x9, x11, #2
	add	x9, x9, #1
	cmp	x11, #60
	b.hs	LBB16_13
; %bb.12:
	mov	x11, #0                         ; =0x0
	b	LBB16_17
LBB16_13:
	and	x11, x9, #0x7ffffffffffffff0
	dup.4s	v1, v0[0]
	add	x10, x21, x0
	add	x10, x10, #32
	mov	x12, x11
LBB16_14:                               ; =>This Inner Loop Header: Depth=1
	stp	q1, q1, [x10, #-32]
	stp	q1, q1, [x10], #64
	subs	x12, x12, #16
	b.ne	LBB16_14
; %bb.15:
	cmp	x9, x11
	b.eq	LBB16_29
; %bb.16:
	tst	x9, #0xc
	b.eq	LBB16_27
LBB16_17:
	and	x12, x9, #0x7ffffffffffffffc
	add	x10, x8, x12, lsl #2
	dup.4s	v1, v0[0]
	add	x13, x22, x11, lsl #2
	sub	x13, x13, x20
	add	x13, x0, x13
	sub	x11, x11, x12
LBB16_18:                               ; =>This Inner Loop Header: Depth=1
	str	q1, [x13], #16
	adds	x11, x11, #4
	b.ne	LBB16_18
; %bb.19:
	cmp	x9, x12
	b.ne	LBB16_28
	b	LBB16_29
LBB16_20:
	and	x10, x9, #0x7ffffffffffffff0
	dup.4s	v1, v0[0]
	add	x11, x22, #32
	mov	x12, x10
LBB16_21:                               ; =>This Inner Loop Header: Depth=1
	stp	q1, q1, [x11, #-32]
	stp	q1, q1, [x11], #64
	subs	x12, x12, #16
	b.ne	LBB16_21
; %bb.22:
	cmp	x9, x10
	b.eq	LBB16_33
; %bb.23:
	tst	x9, #0xc
	b.eq	LBB16_31
LBB16_24:
	and	x11, x9, #0x7ffffffffffffffc
	add	x12, x22, x11, lsl #2
	dup.4s	v1, v0[0]
	add	x13, x22, x10, lsl #2
	sub	x10, x10, x11
LBB16_25:                               ; =>This Inner Loop Header: Depth=1
	str	q1, [x13], #16
	adds	x10, x10, #4
	b.ne	LBB16_25
; %bb.26:
	mov	x22, x12
	cmp	x9, x11
	b.ne	LBB16_32
	b	LBB16_33
LBB16_27:
	add	x10, x8, x11, lsl #2
LBB16_28:                               ; =>This Inner Loop Header: Depth=1
	str	s0, [x10], #4
	cmp	x10, x25
	b.ne	LBB16_28
LBB16_29:
	add	x24, x0, x24, lsl #2
	sub	x22, x8, x23, lsl #2
	mov	x0, x22
	mov	x1, x20
	mov	x2, x21
	bl	_memcpy
	stp	x22, x25, [x19]
	str	x24, [x19, #16]
	cbz	x20, LBB16_35
; %bb.30:
	mov	x0, x20
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	b	__ZdlPv
LBB16_31:
	add	x22, x22, x10, lsl #2
LBB16_32:                               ; =>This Inner Loop Header: Depth=1
	str	s0, [x22], #4
	cmp	x22, x8
	b.ne	LBB16_32
LBB16_33:
	mov	x22, x8
LBB16_34:
	str	x22, [x19, #8]
LBB16_35:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
LBB16_36:
	bl	__ZNSt3__16vectorIfNS_9allocatorIfEEE20__throw_length_errorB9nqe210106Ev
LBB16_37:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
	.cfi_endproc
                                        ; -- End function
	.globl	__Z12ordered_foldIdET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE ; -- Begin function _Z12ordered_foldIdET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	.weak_def_can_be_hidden	__Z12ordered_foldIdET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	.p2align	2
__Z12ordered_foldIdET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE: ; @_Z12ordered_foldIdET_S0_RKNSt3__16vectorIS0_NS1_9allocatorIS0_EEEE
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	d0, [sp, #8]
	ldp	x8, x9, [x0]
	cmp	x8, x9
	b.eq	LBB17_2
LBB17_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	d0, [x8], #8
	ldr	d1, [sp, #8]
	fadd	d0, d1, d0
	str	d0, [sp, #8]
	cmp	x8, x9
	b.ne	LBB17_1
LBB17_2:
	ldr	d0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIdNS_9allocatorIdEEE20__throw_length_errorB9nqe210106Ev ; -- Begin function _ZNSt3__16vectorIdNS_9allocatorIdEEE20__throw_length_errorB9nqe210106Ev
	.globl	__ZNSt3__16vectorIdNS_9allocatorIdEEE20__throw_length_errorB9nqe210106Ev
	.weak_def_can_be_hidden	__ZNSt3__16vectorIdNS_9allocatorIdEEE20__throw_length_errorB9nqe210106Ev
	.p2align	2
__ZNSt3__16vectorIdNS_9allocatorIdEEE20__throw_length_errorB9nqe210106Ev: ; @_ZNSt3__16vectorIdNS_9allocatorIdEEE20__throw_length_errorB9nqe210106Ev
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh55:
	adrp	x0, l_.str.5@PAGE
Lloh56:
	add	x0, x0, l_.str.5@PAGEOFF
	bl	__ZNSt3__120__throw_length_errorB9nqe210106EPKc
	.loh AdrpAdd	Lloh55, Lloh56
	.cfi_endproc
                                        ; -- End function
	.private_extern	__ZNSt3__16vectorIdNS_9allocatorIdEEE8__appendEmRKd ; -- Begin function _ZNSt3__16vectorIdNS_9allocatorIdEEE8__appendEmRKd
	.globl	__ZNSt3__16vectorIdNS_9allocatorIdEEE8__appendEmRKd
	.weak_def_can_be_hidden	__ZNSt3__16vectorIdNS_9allocatorIdEEE8__appendEmRKd
	.p2align	2
__ZNSt3__16vectorIdNS_9allocatorIdEEE8__appendEmRKd: ; @_ZNSt3__16vectorIdNS_9allocatorIdEEE8__appendEmRKd
	.cfi_startproc
; %bb.0:
	stp	x26, x25, [sp, #-80]!           ; 16-byte Folded Spill
	stp	x24, x23, [sp, #16]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #32]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	mov	x19, x0
	ldp	x9, x8, [x0, #8]
	sub	x10, x8, x9
	cmp	x1, x10, asr #3
	b.ls	LBB19_5
; %bb.1:
	ldr	x20, [x19]
	sub	x21, x9, x20
	asr	x22, x21, #3
	add	x9, x22, x1
	lsr	x10, x9, #61
	cbnz	x10, LBB19_22
; %bb.2:
	mov	x10, #9223372036854775800       ; =0x7ffffffffffffff8
	sub	x8, x8, x20
	asr	x11, x8, #2
	cmp	x11, x9
	csel	x9, x11, x9, hi
	cmp	x8, x10
	mov	x8, #2305843009213693951        ; =0x1fffffffffffffff
	csel	x23, x9, x8, lo
	cbz	x23, LBB19_13
; %bb.3:
	lsr	x8, x23, #61
	cbnz	x8, LBB19_23
; %bb.4:
	mov	x24, x1
	mov	x25, x2
	lsl	x0, x23, #3
	bl	__Znwm
	mov	x2, x25
	mov	x1, x24
	b	LBB19_14
LBB19_5:
	cbz	x1, LBB19_12
; %bb.6:
	lsl	x10, x1, #3
	add	x8, x9, x10
	ldr	d0, [x2]
	sub	x10, x10, #8
	cmp	x10, #56
	b.lo	LBB19_10
; %bb.7:
	lsr	x10, x10, #3
	add	x10, x10, #1
	and	x11, x10, #0x3ffffffffffffff8
	add	x12, x9, x11, lsl #3
	dup.2d	v1, v0[0]
	add	x9, x9, #32
	mov	x13, x11
LBB19_8:                                ; =>This Inner Loop Header: Depth=1
	stp	q1, q1, [x9, #-32]
	stp	q1, q1, [x9], #64
	subs	x13, x13, #8
	b.ne	LBB19_8
; %bb.9:
	mov	x9, x12
	cmp	x10, x11
	b.eq	LBB19_11
LBB19_10:                               ; =>This Inner Loop Header: Depth=1
	str	d0, [x9], #8
	cmp	x9, x8
	b.ne	LBB19_10
LBB19_11:
	mov	x9, x8
LBB19_12:
	str	x9, [x19, #8]
	b	LBB19_21
LBB19_13:
	mov	x0, #0                          ; =0x0
LBB19_14:
	lsl	x9, x1, #3
	add	x8, x0, x21
	add	x24, x8, x9
	ldr	d0, [x2]
	sub	x10, x9, #8
	mov	x9, x8
	cmp	x10, #56
	b.lo	LBB19_18
; %bb.15:
	lsr	x9, x10, #3
	add	x10, x9, #1
	and	x11, x10, #0x3ffffffffffffff8
	add	x9, x8, x11, lsl #3
	dup.2d	v1, v0[0]
	add	x12, x21, x0
	add	x12, x12, #32
	mov	x13, x11
LBB19_16:                               ; =>This Inner Loop Header: Depth=1
	stp	q1, q1, [x12, #-32]
	stp	q1, q1, [x12], #64
	subs	x13, x13, #8
	b.ne	LBB19_16
; %bb.17:
	cmp	x10, x11
	b.eq	LBB19_19
LBB19_18:                               ; =>This Inner Loop Header: Depth=1
	str	d0, [x9], #8
	cmp	x9, x24
	b.ne	LBB19_18
LBB19_19:
	add	x23, x0, x23, lsl #3
	sub	x22, x8, x22, lsl #3
	mov	x0, x22
	mov	x1, x20
	mov	x2, x21
	bl	_memcpy
	stp	x22, x24, [x19]
	str	x23, [x19, #16]
	cbz	x20, LBB19_21
; %bb.20:
	mov	x0, x20
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	b	__ZdlPv
LBB19_21:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #16]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp], #80             ; 16-byte Folded Reload
	ret
LBB19_22:
	bl	__ZNSt3__16vectorIdNS_9allocatorIdEEE20__throw_length_errorB9nqe210106Ev
LBB19_23:
	bl	__ZSt28__throw_bad_array_new_lengthB9nqe210106v
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"binary16, rounded after every addition"

l_.str.1:                               ; @.str.1
	.asciz	"binary32"

l_.str.2:                               ; @.str.2
	.asciz	"binary64"

l_.str.3:                               ; @.str.3
	.asciz	"%s mismatch x=%llu expected=%llu got=%.17g\n"

l_.str.4:                               ; @.str.4
	.asciz	"{\"format\":\"%s\",\"precision\":%u,\"blocks\":%llu,\"queries\":%llu,\"nonidentity_results\":%llu,\"failures\":0,\"elapsed_ns\":%lld,\"rounding\":\"FE_TONEAREST\",\"scope\":\"actual CPU ordered arithmetic\"}\n"

l_.str.5:                               ; @.str.5
	.asciz	"vector"

	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @constinit.7
l_constinit.7:
	.long	0                               ; 0x0
	.long	1                               ; 0x1
	.long	2                               ; 0x2
	.long	8                               ; 0x8
	.long	32                              ; 0x20
	.long	128                             ; 0x80
	.long	512                             ; 0x200

.subsections_via_symbols
