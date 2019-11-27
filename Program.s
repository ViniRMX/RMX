	.data
msg1: 	.asciiz "Digite um numero inteiro: \n"
msg2: 	.asciiz "Digite quantas vezes esse numero sera multiplicado por 2: \n"
msg3: 	.asciiz "O resultado é: \n"
	.extern foobar 4

	.text
	.globl main

main: 	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	move $s0, $v0

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 5
	syscall
	move $s1, $v0

	addi $s2,$zero,1
	addi $s3,$zero,2

	
while: 	slt $t0, $s2, $s1
	beq $t0, $zero,fim_while
	
	mul $s0,$s0,$s3
	addi $s2,$s2,1
	j while

fim_while:li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 1	
	move $a0, $s0
	syscall	
	jr $ra