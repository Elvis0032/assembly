.data
	hello: .asciiz "Seja bem vindo a minha calculadora. \n Escolha um calculo para prosseguir \n"
	opcao: .asciiz "1 - Soma; 2 - Subtração; 3 - Divisão; 4 - Multiplicação; 5: Raiz quadrada \n"
	num1: .asciiz "Informe o Primeiro Número: "
	num2: .asciiz "Inoforme o Segundo Número: "
	result: .asciiz "O resultado do calculo é: "

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
mflo $s3	
syscall

li $v0,1
move $a0,$s3	
syscall

.end_macro

.text
.globl main 

main:

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
	move $t4, $v0
	beq $t4,3,multiplicacao
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
	
	multiplicacao:
	multiplicar
	li $v0,10
	syscall
	
	
	
	
	
