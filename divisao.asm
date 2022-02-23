.data 
	primeiro: .asciiz "informe o primeiro numero: " 
	segundo: .asciiz "Informe o segundo numero"
	resultado: .asciiz " resultado da divisão"
	
.text
	li $v0,4
	la $a0, primeiro
	syscall
	
	li $v0,5
	syscall
	
	move $t0, $v0
	
	li $v0,4
	la $a0,segundo
	syscall
	
	li $v0,5
	syscall
	
	move $t1, $v0
	
	div $t0, $t1
	
	mflo $s3
	
	li $v0,4
	la $a0, resultado
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall