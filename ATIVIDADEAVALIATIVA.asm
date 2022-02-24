.data
	hello: .asciiz "Seja bem vindo a minha calculadora. \n Escolha um calculo para prosseguir \n"
	opcao: .asciiz "1 - Soma; 2 - Subtração; 3 - Divisão; 4 - Multiplicação; 5: Raiz quadrada \n"
	num1: .asciiz "Informe o Primeiro Número: "
	num2: .asciiz "Inoforme o Segundo Número: "
	result: .asciiz "O resultado do calculo é: "

.text
	
	
	
	
	
	
	
	#Imprime a mensagem presente na constante hello
	li $v0, 4
	la $a0, hello
	syscall
	#Imprime as opções presente na constante opcao
	li $v0, 4
	la $a0, opcao
	syscall
	#permite que o usuario atribua um valor a variavel v0
	li $v0, 5
	syscall
	
	
	
	
	
