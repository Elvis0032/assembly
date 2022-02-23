.data
	num1: .asciiz "Informe o primeiro numero"
	num2: .asciiz "Informe o segundo numero"
	Resultado: .asciiz "O resultado é: "
.text
	li $v0,4
	la $a0,num1
	syscall
	
	li $v0,5
	syscall
	
	move $t0, $v0
	
	li $v0,4
	la $a0,num2
	syscall
	
	li $v0,5
	syscall
	
	move $t1, $v0
	
	add $t2, $t1, $t0
	li $v0,4
	la $a0,Resultado
	syscall
	
	li $v0,1
	
	move $a0, $t2
	
	syscall