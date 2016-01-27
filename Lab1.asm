
.data	#initialize to first three memory spaces
	source_address: .word  0x10010040	#default to 0x10010000
	dest_address: .word 0x10010080		#default to 0x10010004
	length: .word 0x00000004		#default to 0x10010008
	
	#moves memory at 0x10010040 to 0x10010080
.text 
	li $t0, 0x00000000	#index
	
	#loading data to register
	lw $t3, 0x10010000 #source address
	lw $t4, 0x10010004 #source destination
	
	lw $t6, 0x10010008 #length

loop:
	beq $t0, $t6, end
	lb $s0, 0($t3) #load byte from source
	sb $s0, 0($t4) #store byte to destination
	
	addi $t3, $t3, 0x00000001 #source_address++
	addi $t4, $t4, 0x00000001 #dest_address++
	addi $t0, $t0, 0x00000001 #index++
	
	j loop
end:
	nop
