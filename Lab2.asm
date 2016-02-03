#-------------------------------
#
#	Lab 2
#	Bradley Trowbridge
#	Computer Architecture
#	
#-------------------------------
#
#	Registry map in order of appearence:
#	
#	$s0 - stores address of byte array
#	$s1 - stores length
#	$s2 - stores address of histogram
#	$s3 - index for looping
#	$t0 - temporary location for byte array comparison
#	$t1 - branch flag (branch if 0)
#	$t2 - counter for  0 < $t0 < 60
#	$t3 - counter for 60 < $t0 < 70
#	$t4 - counter for 70 < $t0 < 80
#	$t5 - counter for 80 < $t0 < 90
#	$t6 - counter for 90 < $t0 < 255
#



.text
	#retrieve byte array address from 0x10010020
	lui $s0, 0x1001 
	ori $s0,$s0, 0x0020
	lw $s0, 0($s0)
	
	#retrieve length from 0x10010024
	lui $s1, 0x1001 
	ori $s1,$s1 0x0024
	lw $s1, 0($s1)
	
	#retrieve histogram address from 0x10010028
	lui $s2, 0x1001 
	ori $s2,$s2 0x0028
	lw $s2, 0($s2)
	
	#optional initializer for index
	#ori $s3,$0

	j start
	
loop:	#post process increment
	addi $s0,$s0,0x01 #increment one byte in the array
	addi $s3,$s3,0x01 #index ++ (stored in $s3)

	
start:  #while ... do impplementation
	beq $s3,$s1,end   #if index == length then end

	lbu $t0, 0($s0) #load byte
	
	#if..elseif...elseif...else statement implementation
	#check if less than 90
	slti $t1, $t0, 0x5a
	beq $t1, $0, gt90 #if not, branch to greater than 90
	#checkif less than 80
	slti $t1, $t0, 0x50
	beq $t1, $0, bt8090 #if not then branch to bt 80 and 90
	#checkif less than 70
	slti $t1, $t0, 0x46
	beq $t1, $0, bt7080# if not then branch to bt 70 and 80
	#checkif less than 60
	slti $t1, $t0, 0x3c
	beq $t1, $0, bt6070 #if not then branch to bt 60 and 70
	#default to less than 60
	
# increment counters in registry($t2 - $t6)
lt60: #less than 60
	addi $t2,$t2,0x01
	j loop
bt6070: #between 60 and 70
	addi $t3,$t3,0x01
	j loop
bt7080: #between 70 and 80
	addi $t4,$t4,0x01
	j loop
bt8090: #between 80 and 90
	addi $t5,$t5,0x01
	j loop
gt90: #greater than 90
	addi $t6,$t6,0x01
	j loop
end:
	#store bins to destination
	sb $t2, 0x00 ($s2)
	sb $t3, 0x01 ($s2)
	sb $t4, 0x02 ($s2)
	sb $t5, 0x03 ($s2)
	sb $t6, 0x04 ($s2)