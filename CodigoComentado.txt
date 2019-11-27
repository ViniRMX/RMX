	.data #declaração de variaveis
msg1: 	.asciiz "Digite um numero inteiro: \n"
msg2: 	.asciiz "Digite quantas vezes esse numero sera multiplicado por 2: \n"
msg3: 	.asciiz "O resultado é: \n"
	.extern foobar 4

	.text
	.globl main #inicio do programa

main: 	li $v0, 4 #comando para mostrar a primeira mensagem ao usuario
	la $a0, msg1
	syscall

	li $v0, 5 #comando para ler o valor digitado
	syscall
	move $s0, $v0 #movendo o primeiro valor digitado para o registrador

	li $v0, 4 #comando para mostrar a segunda mensagem ao usuario
	la $a0, msg2
	syscall

	li $v0, 5 #comando para ler o valor digitado
	syscall
	move $s1, $v0 #movendo o segundo valor digitado para o registrador

	addi $s2,$zero,1 
	addi $s3,$zero,2
	
while: 	slt $t0, $s2, $s1 #inicio da repetição
	beq $t0, $zero,fim_while
	
	mul $s0,$s0,$s3 #calcula o resultado
	addi $s2,$s2,1
	j while 

fim_while:li $v0, 4 #fim da repetição e comando para mostrar a segunda mensagem ao usuario
	  la $a0, msg3
	  syscall

	li $v0, 1 #comando para exibir o valor do resultado
	move $a0, $s0
	syscall	
	jr $ra #fim
