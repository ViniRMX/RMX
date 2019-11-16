            .data

mensagem:	.asciiz "Digite um numero\n"
numero: 	.word 1
sucessor: 	.word 1
		
	.text
	# imprime mensagem
main:	li $v0, 4 
	la $a0, mensagem
	syscall

	# lê inteiro
	li $v0, 5 
	syscall
			
	# grava numero na memória	
	sw $v0, numero
			
	# calcular sucessor
	addi $t0, $v0, 1

	# grava sucessor
	sw $t0, sucessor
			
	# imprime inteiro
	li $v0, 1
	move $a0, $t0
	syscall

	jr $ra
	