.data
	hello: .asciiz "Seja bem vindo a minha calculadora. \n Escolha um calculo para prosseguir \n"
	opcao: .asciiz "1 - Soma; 2 - Subtra��o; 3 - Divis�o; 4 - Multiplica��o; 5: Raiz quadrada \n"
	num1: .asciiz "Informe o Primeiro N�mero: "
	num2: .asciiz "Inoforme o Segundo N�mero: "
	result: .asciiz "O resultado do calculo �: "

.text
	# atribui valores aos registradores s1, s2, s3, s4
	addi $s1, $zero, 1
	addi $s2, $zero, 2
	addi $s3, $zero, 3
	addi $s4, $zero, 4
	#Imprime a mensagem presente na constante hello
	li $v0, 4
	la $a0, hello
	syscall
	#Imprime as op��es presente na constante opcao
	li $v0, 4
	la $a0, opcao
	syscall
	#permite que o usuario atribua um valor a variavel v0
	li $v0, 5
	syscall
	
	
	li $v0,4
	la $a0, result
	syscall
	
	li $v0,	4
	move $t0, $v0
	la $t0,4
	syscall
	
	
