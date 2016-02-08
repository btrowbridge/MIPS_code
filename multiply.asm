


.text
	addi $s1, $s0, -1
	addi $s2, $s1, 0
	multu $s1, $s2 #multu or multi
	mfhi $s4
	mflo $s3
	