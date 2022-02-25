.data
	hello: .asciiz "Seja bem vindo a minha calculadora. \n Escolha um calculo para prosseguir \n"
	opcao: .asciiz "1 - Soma; 2 - Subtra��o; 3 - Divis�o; 4 - Multiplica��o; 5: Raiz quadrada \n"
	num1: .asciiz "Informe o Primeiro N�mero: "
	num2: .asciiz "Inoforme o Segundo N�mero: "
	result: .asciiz "O resultado do calculo �: "
	error_msg: .asciiz "N�o � uma raiz quadrada perfeita"

.macro soma 

la $a0, num1
li $v0, 4
syscall 
li $v0, 5
syscall
move $t1, $v0


la $a0, num2
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0


add $t3, $t2, $t1
move $a0, $t3
li $v0, 1
syscall

.end_macro


.macro subtracao

la $a0, num1
li $v0, 4
syscall
li $v0, 5
syscall
move $t1, $v0

la $a0, num2
li $v0, 4
syscall
li $v0, 5
syscall
move $t2, $v0

sub $t3, $t1, $t2
move $a0, $t3
li $v0, 1
syscall

.end_macro

.macro multiplicar


li $v0,4
la $a0,num2

syscall	
li $v0,5
syscall	

move $t0, $v0	
li $v0,4
la $a0,num1
syscall	

li $v0,5
syscall

move $t1, $v0	
mult $t0,$t1	
mfhi $s3	
syscall

li $v0,1
move $a0,$s3	
syscall

.end_macro


.macro dividir

li $v0,4
la $a0, num1
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

div $t0, $t1

mflo $s3

li $v0,1
move $a0,$s3
syscall

.end_macro	

.macro raiz
		jal read_int		# le o inteiro
		la 	$s0, ($v0)	# guarda o valor lido
		li	$s1, 0
		jal isqrt		# calcula a raiz quadrada		

	print_int:
		li $v0, 5	# c�digo para ler um inteiro
		syscall		# executa a chamada do SO para ler
		jr $ra		# volta para o lugar de onde foi chamado (no caso, jal le_inteiro_do_teclado)			
	
	read_int:
		li $v0, 5	# c�digo para ler um inteiro
		syscall		# executa a chamada do SO para ler
		jr $ra		# volta para o lugar de onde foi chamado (no caso, jal le_inteiro_do_teclado)
		
	isqrt:
		mul $t0, $s1, 2
		add $t0, $t0, 1
		sub $s0, $s0, $t0
		add $s1, $s1, 1		# incrementa o contador, que sera o resultado da raiz
		beq $s0, $zero, success	# se chegamos a zero a raiz � perfeita
		slt	$t0, $s0, $zero	# caso seja menor que zero, deu problema
		beq $t0, 1, error	# ent�o mostramos mensagem de erro
		j isqrt	# caso n�o ocorra nenhum dos casos acima, itera novamente
		
	error:
		la $a0, error_msg
		la $v0, 4
		syscall
		j	 exit
	
	success:
		la $v0, 1
		la $a0, ($s1)
		syscall
		j  exit
	
	exit:
		la $v0, 10
		syscall
.end_macro


.text
.globl main 

main:

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
	move $t4, $v0
	
	beq $t4,5,raizquadrada
	beq $t4,4,multiplicacao
	beq $t4,3,dividir
	beq $t4,2,subtrair
	beq $t4,1,soma
	
	soma:
	soma
	li $v0, 10
	syscall
	
	subtrair:
	subtracao
	li $v0,10
	syscall
	
	dividir:
	dividir
	li $v0,10
	syscall
	
	multiplicacao:
	multiplicar
	li $v0,10
	syscall
	
	raizquadrada:
	raiz
	li $v0,10
	syscall
	
	
	
	
	
