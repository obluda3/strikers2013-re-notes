###Display special move power [Obluda]

####STORE THE RIGHT POWER VALUE AND RNG VALUE AT 8082C400####
####waza_sh_vs_df (8009EE04)####
.set cur_power, 0x8082C400

# load is_interaction_won
lbz r0, 0x5B(r30)

cmpwi r0, 0
bne+ load_nul

# load the current shoot power if you don't block
lwz r0, -0x5e90(r31)
b the_end

# display 0 if the shot is blocked
load_nul:
li r0, 0

the_end:
lis r24, cur_power@h
ori r24, r24, cur_power@l
stw r0, 0(r24)
stw r27, 4(r24) # stores the random bonus
li r25, 3
stw r25, 8(r24) # stores the flag

# restore
lmw r24, 0x10(sp)

####same for waza_sh_vs_sh (8009ec5c)####

####waza_sh_vs_gk (8009F060)####

.set cur_power, 0x8082C400
# store the power in RAM
lis r11, cur_power@h
ori r11, r11, cur_power@l
stw r4, 0(r11) #Store the power
stw r26, 4(r11) #Store the RNG Bonus
li r12, 2 #sets the flag to 2 if it's a catch move)
stw r12, 8(r11)

# restore original instruction
addi r11, sp, 64


####waza_set_sp_shoot_info (8009E730)####
.set cur_power, 0x8082C400
lis r24, cur_power@h
ori r24, r24, cur_power@l
stw r0, 0(r24) # stores the shoot power
stw r31, 4(r24) #stores the RNG Bonus
li r12, 1 # sets it to 1 since it's a shoot move
stw r12, 8(r24)
stw r4, 12(r24) #stores the distance penalty


#restore
lbz r0, 0x4E(r26)


####PRINTING THE VALUE####
#Insertion @ 800DD094
.set sprintf, 0x802BB0B0
.set destPointer, 0x8082C340
.set catchPower, 0x8082C400
.set shootPower, 0x807AC578
.set disp_zen, 0x80032B18

.macro setAddress register, address
	lis \register, \address@h
	ori \register, \register, \address@l
.endm


#function prologue
stwu sp,-0x80 (sp)
stmw r3, 0x8 (sp)

#sprintf arguments
#store the pointer to the buffer where the string will be written in r3
setAddress r3, destPointer

# store the string in r4
bl power_string
.string "#j#=Shoot power: %d#n#oy5#=Info:#n#oy5#=- Random bonus: %d#n#oy5#=- Distance penalty: %d\0\0\0"
power_string:
mflr r4

# store the power of the shoot in r5
setAddress r5, catchPower
lwz r6, 4(r5) #RNG Bonus
lwz r8, 8(r5) #Catch / Shoot Flag
cmpwi r8, 2 # 2 meaning catch move
beq catch
cmpwi r8, 3 # 3 meaning shoot block
beq block

# Loads the current shoot power and distance penalty
lwz r7, 12(r5) # distance penalty in r7
setAddress r5, shootPower
lwz r5, 0(r5) # current shoot power in r5
b sprintf_call

block:
bl catch_power
.string "#j#=Shoot power (after block): %d\0\0"

catch:
bl catch_power
.string "#j#=Catch power: %d#n#oy5#=Info:#n#oy5#=- Random bonus: %d\0"
catch_power:
mflr r4
lwz r5, 0(r5) #Current power

sprintf_call:
setAddress r12, sprintf
mtctr r12
bctrl

#disp_zen arguments
setAddress r3, destPointer #Pointer to string
li r4, 20 # Pos X
li r5, 30 # Pos Y
li r6, 50 # Scale

#disp_zen call
setAddress r12, disp_zen
mtctr r12
bctrl

#function epilogue
lmw r3, 0x8 (sp)
addi sp, sp, 0x80

#restore original instruction
lwz r0, 0x0014(sp)


######act_after_scene_shoot 80068960######
#Insertion @ 80068960
.set sprintf, 0x802BB0B0
.set destPointer, 0x8082C340
.set catchPower, 0x8082C400
.set shootPower, 0x807AC578
.set disp_zen, 0x80032B18

.macro setAddress register, address
	lis \register, \address@h
	ori \register, \register, \address@l
.endm


#function prologue
stwu sp,-0x80 (sp)
stmw r3, 0x8 (sp)

#sprintf arguments
#store the pointer to the buffer where the string will be written in r3
setAddress r3, destPointer

# store the string in r4
bl power_string
.string "#j#=Shoot power: %d#n#oy5#=Info:#n#oy5#=- Random bonus: %d#n#oy5#=- Distance penalty: %d\0\0\0"
power_string:
mflr r4

# store the power of the shoot in r5
setAddress r5, catchPower
lwz r6, 4(r5) #RNG Bonus
lwz r7, 12(r5) # distance penalty in r7
setAddress r5, shootPower
lwz r5, 0(r5) # current shoot power in r5

sprintf_call:
setAddress r12, sprintf
mtctr r12
bctrl

#disp_zen arguments
setAddress r3, destPointer #Pointer to string
li r4, 20 # Pos X
li r5, 30 # Pos Y
li r6, 50 # Scale

#disp_zen call
setAddress r12, disp_zen
mtctr r12
bctrl

#function epilogue
lmw r3, 0x8 (sp)
addi sp, sp, 0x80

#restore original instruction
addi r31, r3, 0xB8
