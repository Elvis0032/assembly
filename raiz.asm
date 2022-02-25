
.data
	error_msg: .asciiz "N�o � uma raiz quadrada perfeita"

.text

	.globl main
	
	main:
		jal read_int							# le o inteiro
		la 	$s0, ($v0)						# guarda o valor lido
		li	$s1, 0
		jal isqrt									# calcula a raiz quadrada		

	print_int:
		li 		$v0, 5							# c�digo para ler um inteiro
		syscall										# executa a chamada do SO para ler
		jr 		$ra									# volta para o lugar de onde foi chamado (no caso, jal le_inteiro_do_teclado)			
	
	read_int:
		li 		$v0, 5							# c�digo para ler um inteiro
		syscall										# executa a chamada do SO para ler
		jr 		$ra									# volta para o lugar de onde foi chamado (no caso, jal le_inteiro_do_teclado)
		
	isqrt:
		mul	$t0, $s1, 2
		add $t0, $t0, 1
		sub	$s0, $s0, $t0
		add $s1, $s1, 1						# incrementa o contador, que sera o resultado da raiz
		beq $s0, $zero, success		# se chegamos a zero a raiz � perfeita
		slt	$t0, $s0, $zero				# caso seja menor que zero, deu problema
		beq $t0, 1, error					# ent�o mostramos mensagem de erro
		j		isqrt									# caso n�o ocorra nenhum dos casos acima, itera novamente
		
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