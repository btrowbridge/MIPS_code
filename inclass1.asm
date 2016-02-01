.data	#initialize to first three memory spaces for cheat codes
	comp1: .word  0x10010020		#default to 0x10010000
	comp2: .word 0x10010040			#default to 0x10010004
	dest_address: .word 0x10010060		#default to 0x10010008


.text
	#cheat codes
	#loading addresses to register
	lw $s0, 0x10010000 #comp1 address: 20
	lw $s1, 0x10010004 #comp2 address: 40
	lw $s2, 0x10010008 #dest_address: 60
	
	#load for comparison
	lh $t0, 0($s0) #load comp1
	lh $t1, 0($s1) #load comp2
	
	bge  $t0, $t1, store_comp1 # is *20 > *40
	
	# store *40 to 60
	lh $s3, 0($s1)
	sh $s3, 0($s2)
	
	j end #go to end

store_comp1: 
	# store *20 to 60
	lh $s3, 0($s0)
	sh $s3, 0($s2)
end:
	nop