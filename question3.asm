

# Registers used:
# $v0 - syscall parameter and return value.
# $a0 - syscall parameter-- the string to print.


	.text
main:	
	la $a0, input_msg	# load the addr of hello_msg into $a0.
	li $v0, 4 		# 4 is the print_string syscall.
	syscall 		# do the syscall.
	
	la $a0, row1
	li $v0, 8
	syscall

	la $a0, row2
	li $v0, 8
	syscall
	
	la $a0, row3
	li $v0, 8
	syscall

	la $a0, rotval
	li $v0, 8
	syscall
	
	la $s1, subtract
	lb $s1, 0($s1)
	li $t3, 0
	la $t0, rotval
	lb $t1, 0($t0)
	beq $t1, $s1, Minus
	
	jal Plus		
	
Pos:	add $t2, $t2, 1
	jal newData
	add $t3, $t2, $s2
	bgt $t3, 8, maxFix
	blt $t3, 1, minFix
comp:	jal Compare
	beq $t2, 8, Exit
	j Pos

d1:	la $t1, row1
	lb $v1, 0($t1)
	jr $ra

d2:	la $t1, row1
	lb $v1, 1($t1)
	jr $ra

d3:	la $t1, row1
	lb $v1, 2($t1)
	jr $ra

d4:	la $t1, row2
	lb $v1, 2($t1)
	jr $ra
	
d5:	la $t1, row3
	lb $v1, 2($t1)
	jr $ra

d6:	la $t1, row3
	lb $v1, 1($t1)
	jr $ra

d7:	la $t1, row3
	lb $v1, 0($t1)
	jr $ra

d8:	la $t1, row2
	lb $v1, 0($t1)
	jr $ra	

newData:beq $t2, 1, d1
	beq $t2, 2, d2
	beq $t2, 3, d3
	beq $t2, 4, d4
	beq $t2, 5, d5
	beq $t2, 6, d6
	beq $t2, 7, d7
	beq $t2, 8, d8
	
	jr $ra

maxFix:	sub $t3, $t3, 8
	j comp

minFix:	add $t3, $t3, 8
	j comp

Compare:beq $t3, 1, pos1
	beq $t3, 2, pos2
	beq $t3, 3, pos3
	beq $t3, 4, pos4
	beq $t3, 5, pos5
	beq $t3, 6, pos6
	beq $t3, 7, pos7
	beq $t3, 8, pos8
	jr $ra
	
Minus:	li $s2, -1
	lb $t0, 1($t0)
	addi $t0, $t0, -48
	div $t6, $t0, 4
	mul $t6, $t6, 4
	sub $t0, $t0, $t6
	mul $s2, $s2, $t0
	mul $s2, $s2, 2
	jr Pos

Plus: 	lb $s2, 0($t0)
	addi $s2, $s2, -48
	div $t6, $s2, 4
	mul $t6, $t6, 4
	sub $s2, $s2, $t6
	mul $s2, $s2, 2
	jr Pos

pos1:	sb $v1, new1
	jr $ra

pos2:	sb $v1, new2
	jr $ra

pos3:	sb $v1, new3
	jr $ra

pos4:	sb $v1, new4
	jr $ra

pos5:	sb $v1, new5
	jr $ra

pos6:	sb $v1, new6
	jr $ra

pos7:	sb $v1, new7
	jr $ra

pos8:	sb $v1, new8
	jr $ra	

Exit:	la $t1, row2
	lb $v1, 1($t1)
	sb $v1, centre
	li $t2, 0
	
	la $a0, new1
	li $v0, 4
	syscall

	la $a0, new2
	li $v0, 4
	syscall
	
	la $a0, new3
	li $v0, 4
	syscall
	
	la $a0, enter
	li $v0, 4
	syscall
	
	la $a0, new8
	li $v0, 4
	syscall
	
	la $a0, centre
	li $v0, 4
	syscall
	
	la $a0, new4
	li $v0, 4
	syscall
	
	la $a0, enter
	li $v0, 4
	syscall
	
	la $a0, new7
	li $v0, 4
	syscall
	
	la $a0, new6
	li $v0, 4
	syscall
		
	la $a0, new5
	li $v0, 4
	syscall
	
	li $v0, 10 		# 10 is the exit syscall.
	syscall # do the syscall.		
	
# Data for the program:
	.data
input_msg: .asciiz "Enter a 3x3 matrix: \n"
row1: .space 8
row2: .space 8
row3: .space 8
new1: .space 8
new2: .space 8
new3: .space 8
new4: .space 8
new5: .space 8
new6: .space 8
new7: .space 8
new8: .space 8
centre: .space 8
subtract: .ascii "-"
counter: .asciiz "0"
rotval: .space 8
rotdirec: .space 8
temp1: .space 8
enter: .asciiz "\n"

