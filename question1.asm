

# Registers used:
# $v0 - syscall parameter and return value.
# $a0 - syscall parameter-- the string to print.

	.text
main:
	la $a0, input_msg 	# load the addr of hello_msg into $a0.
	li $v0, 4 		# 4 is the print_string syscall.
	syscall 		# do the syscall.
	la $a0, value1
	li $v0, 8
	syscall
	
	la $a0, value2
	li $v0, 8
	syscall
	
	la $a0, value3
	li $v0, 8
	syscall	
	
	la $a0, output_msg
	li $v0, 4
	syscall 

	la $a0, value3
	li $v0, 4
	syscall

	la $a0, value1
	li $v0, 4
	syscall
	
	la $a0, value2
	li $v0, 4
	syscall

	li $v0, 10 		# 10 is the exit syscall.
	syscall # do the syscall.

# Data for the program:
	.data
input_msg: .asciiz "Enter a list of 3 lines:\n"
value1: .space 20
value2: .space 20
value3: .space 20
output_msg: .asciiz "The reordered list is:\n"

