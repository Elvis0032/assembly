.data
	Hello: .asciiz "Hello Word"

.text
	li $v0,4
	la $a0,Hello
	syscall
	