#Insertion @ 801F2124
.set Savedata_ChkPlayerFlag__Fll, 0x80042DBC
.set Savedata_SetPlayerFlag__Fll, 0x80042D30
.set Savedata_getPlayeData_KizunaData, 0x80042368
.set relocate_address, 0x801F2128

.macro callFunction address
	lis r12, \address@h
	ori r12, r12, \address@l
	mtctr r12
	bctrl
.endm

.macro checkNotUnlocked id
	li r3, \id
	li r4, 0
	callFunction Savedata_ChkPlayerFlag__Fll
	cmpwi r3, 0
.endm

.macro checkUnlocked id
	li r3, \id
	li r4, 2
	callFunction Savedata_ChkPlayerFlag__Fll
	cmpwi r3, 1
.endm

.macro unlock id
	li r3, \id
	li r4, 0
	li r5, 1
	callFunction Savedata_SetPlayerFlag__Fll
.endm

.macro show_popup id
	lwz	r3, 0xDD0(r31)
	cmpwi	r3, 0x10
	bge	unlock
	mulli	r4, r3, 0xC
	addi	r0, r3, 1
	stw	r0, 0xDD0(r31)
	li	r3, 0
	li	r0, 2
	add	r4, r31, r4
	stw	r0, 0xD10(r4)
	li	r0, \id
	stw	r3, 0xD14(r4)
	stw	r0, 0xD18(r4)
.endm

Ishido:
	checkNotUnlocked 0x18e
	bne	Afuro
	checkUnlocked 0x17 ; Gouenji 1
	bne	Afuro
	checkUnlocked 0x18 ; Gouenji 2
	bne	Afuro
	checkUnlocked 0x19 ; Gouenji IJ
	bne	Afuro
	checkUnlocked 0x14c ; Kurosaki
	bne	Afuro
	checkUnlocked 0x177 ; Senguuji
	bne	Afuro
	show_popup 0x18e
	unlock 0x18e ; Ishido

Afuro:
	checkNotUnlocked 0x18D
	bne	Tyranno
	checkUnlocked 0x57 ; Afuro 1
	bne	Tyranno
	checkUnlocked 0x58 ; Afuro 2
	bne	Tyranno
	checkUnlocked 0x14f ; Kishibe
	bne	Tyranno
	checkUnlocked 0x151 ; Sousuke
	bne	Tyranno
	checkUnlocked 0x154 ; Yoshihiko
	bne	Tyranno
	show_popup 0x18d
	unlock 0x18d ; Afuro

; Fei x Tyranno
Tyranno:
	checkNotUnlocked 0x179
	bne	Tenshuu
	checkUnlocked 0x12d ; Fei
	bne	Tenshuu
	checkUnlocked 0x135 ; Tenma 
	bne	Tenshuu
	show_popup 0x179
	unlock 0x179 ; Fei x Tyranno

; Tenma x Shuu
Tenshuu:
	checkNotUnlocked 0x17a
	bne	Zanark
	checkUnlocked 0x135 ; Tenma T
	bne	Zanark
	checkUnlocked 0x107 ; Shuu
	bne	Zanark
	show_popup 0x17a
	unlock 0x17a ; Tenshuu

; Zanark x Cao Cao
Zanark:
	checkNotUnlocked 0x186
	bne	Yuuichi
	checkUnlocked 0x15e ; Zanark
	bne	Yuuichi
	show_popup 0x186
	unlock 0x186 ; Zanark x Cao Cao

; Yuuichi x Kyousuke
Yuuichi:
	checkNotUnlocked 0x17B
	bne	Autres
	checkUnlocked 0x135 ; Tenma T
	bne	Autres
	checkUnlocked 0x12f ; Yuuichi
	bne	Autres
	show_popup 0x17B
	unlock 0x17B ; Tenshuu

Autres:
	checkNotUnlocked 0x17C ; Shindou x Nobunaga
	bne	func_epilogue
	checkNotUnlocked 0x17D ; Kirino x Jeanne
	bne	func_epilogue
	checkNotUnlocked 0x17E ; Taiyou x Koumei
	bne	func_epilogue
	checkNotUnlocked 0x17F ; Shinsuke x Bei
	bne	func_epilogue
	checkNotUnlocked 0x180 ; Torb x Tochan
	bne	func_epilogue
	checkNotUnlocked 0x181 ; Fey x Big
	bne	func_epilogue
	checkNotUnlocked 0x182 ; Ryoma x Sakamoto
	bne	func_epilogue
	checkNotUnlocked 0x183 ; Tsurugi x Okita
	bne	func_epilogue
	checkNotUnlocked 0x184 ; Kinako x Dragon
	bne	func_epilogue
	checkNotUnlocked 0x185 ; Tenma x Arthur
	bne	func_epilogue
	checkNotUnlocked 0x187 ; Zanark x Clara Jane
	bne	func_epilogue
	checkUnlocked 0x133 ; Saru
	bne	func_epilogue
	checkUnlocked 0x134 ; Rei Rukh
	bne	func_epilogue
	show_popup 0x185
	unlock 0x17C ; Shindou x Nobunaga
	unlock 0x17D ; Kirino x Jeanne
	unlock 0x17E ; Taiyou x Koumei
	unlock 0x17F ; Shinsuke x Bei
	unlock 0x180 ; Torb x Tochan
	unlock 0x181 ; Fey x Big
	unlock 0x182 ; Ryoma x Sakamoto
	unlock 0x183 ; Tsurugi x Okita
	unlock 0x184 ; Kinako x Dragon
	unlock 0x185 ; Tenma x Arthur
	unlock 0x187 ; Zanark x Clara Jane

func_epilogue:
	; Restore original instruction
	lwz r3, 0xdd0(r31)
	; Branching back to code
	lis r12, relocate_address@h
	ori r12, r12, relocate_address@l
	mtlr r12	
	blr
