
#write a program that loops 5 times

.text	#code goes here

		addiu $t0, $0, 5 # add immediate 5 to 0 and
		# initialize loop counter to 5

loop: 
		nop # this is where important stuff would goes

			#loop overhead
		addiu 	$t0, $t0, -1 #decrement loop counter
		bne		$t0, $t0, loop # if counter has not decremented to 0, repeat loop
		nop     #stuff after the looping 	