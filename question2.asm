

# Registers used:
# $v0 - syscall parameter and return value.
# $a0 - syscall parameter-- the string to print.


	.text
main:	
	la $s1, equals
	lb $s1, 0($s1)
	la $s2, addition
	lb $s2, 0($s2)
	la $s3, subtract
	lb $s3, 0($s3)
	
	la $a0, input_sum	# load the addr of hello_msg into $a0.
	li $v0, 4 		# 4 is the print_string syscall.
	syscall 		# do the syscall.
	
	la $a0, sums
	li $v0, 8
	syscall
	
	la $a0, jump		# load the addr of hello_msg into $a0.
	li $v0, 4 		# 4 is the print_string syscall.
	syscall 		# do the syscall.
	
	la $t0, sums
	lb $t1, 0($t0)
	beq $t1, $s3, NegNum
 	addi $t1, $t1, -48
	add $t0, $t0, 1	
	
Loop:	lb $t2, 0($t0)
	beq $t2, $s1, Exit
	beq $t2, $s2, Plus
	beq $t2, $s3, Minus
	add $t0, $t0, 1
	j Loop

Plus:	add $t0, $t0, 1
	lb $t2, 0($t0)
	addi $t2, $t2, -48
	add $t1, $t1, $t2
	j Loop

Minus:	add $t0, $t0, 1
	lb $t2, 0($t0)
	addi $t2, $t2, -48
	sub $t1, $t1, $t2
	j Loop

NegNum:	li $t1, 0
	j Minus

Exit:	move $a0, $t1
	li $v0, 1		# 4 is the print_int syscall.
	syscall 		# do the syscall.
	li $v0, 10 		# 10 is the exit syscall.
	syscall # do the syscall.		

# Data for the program:
	.data
input_sum: .asciiz "Enter a sum: "
equals: .asciiz "="
addition: .ascii "+"
subtract: .ascii "-"
sums: .space 20
total: .space 20
jump: .ascii "\n"

