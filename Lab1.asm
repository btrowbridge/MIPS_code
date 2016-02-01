
.data	#initialize to first three memory spaces
	source_address: .word  0x10010040	#default to 0x10010000
	dest_address: .word 0x10010080		#default to 0x10010004
	length: .word 0x00000008		#default to 0x10010008
	
	#moves memory at 0x10010040 to 0x10010080
.text 
	li $t1, 0x00000000	#index
	#loading data to register
	lw $s3, 0x10010000 #source address
	lw $s4, 0x10010004 #source destination
	lw $s6, 0x10010008 #length

loop:
	beq $t1, $s6, end # branch if (index == length)
	lb $t0, 0($s3) #load byte from source
	sb $t0, 0($s4) #store byte to destination
	
	addi $s3, $s3, 0x00000001 #source_address++
	addi $s4, $s4, 0x00000001 #dest_address++
	addi $t1,$t1, 0x00000001 #index++
	
	j loop
end:
	nop
