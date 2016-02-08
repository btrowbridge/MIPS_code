

#clear buts 3-5 of 0x10010040

.text
	lui $s0, 0x1001
	ori $s0,$s0 0x0040
	lb $t0,0($s0)
	andi $t0,$t0, 0x00C7
	sb $t0,0($s0)
