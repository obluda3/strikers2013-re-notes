# Insert @0x800c1a18 (replace with branch, then rebranch to 0x800C1D98)
.set branch_back, 0x800C1D98
.set branch_alternate, 0x800C1A1C
.set GetPLYIDToPlayerEntryTeam__Fii, 0x800BE084
.set Savedata_getPlayeData_KizunaData__Fii, 0x80042368
.set Savedata_getPlayerData__Fi, 0x80042314

.macro callFunction address
	lis r12, \address@h
	ori r12, r12, \address@l
	mtctr r12
	bctrl
.endm

nop
cmpwi r0, 0x16A
bne alternative_epilogue

cmpwi r4, 0
bne func_epilogue

; Check if Asta is unlocked
mr r4, r15
li r3, 0x16b
callFunction GetPLYIDToPlayerEntryTeam__Fii
cmpwi r3, 0
beq func_epilogue

; Check if San is unlocked
mr r4, r15
li r3, 0x16c
callFunction GetPLYIDToPlayerEntryTeam__Fii
cmpwi r3, 0
beq func_epilogue

; Compare Fran - Asta kizuna
lwz r3, 0(r22)
li r4, 0x16b ; Asta
callFunction Savedata_getPlayeData_KizunaData__Fii
lha r0, 0(r3)
cmpwi r0, 0x32 
blt func_epilogue

; Compare Fran - San kizuna
lwz r3, 0(r22)
li r4, 0x16c ; San
callFunction Savedata_getPlayeData_KizunaData__Fii
lha r0, 0(r3)
cmpwi r0, 0x32 
blt func_epilogue

; Miximax unlock magic
lwz r0, 0(r23)
ori r0, r0, 0x10
stw r0, 0(r23)
lwz r3, 0x1500(r20)
slwi  r0, r3, 2
addi  r4, r3, 1
add r3, r20, r0
li r0, 0xC
stw r0, 0x1504(r3)
stw r4, 0x1500(r20)

; Branching back to code
func_epilogue:
	lis r12, branch_back@h
	ori r12, r12, branch_back@l
	mtlr r12	
	blr

; in case 
alternative_epilogue:
	lis r12, branch_alternate@h
	ori r12, r12, branch_alternate@l
	mtlr r12	
	blr
