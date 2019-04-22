		;		ARM Programming Assignment #2: 32 bit signed integer multiplier
		;
		;		Write a 32-bit SIGNED multiplier. It should take only a small modification to your
		;		unsigned version. Remember (-6)*(-6) = 36, (-6)*6 = -36.
		;		Use the standard shift-and-add operation.
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA
result	FILL		8
carry	FILL		4
		mov		r0, #0
		mov		r1, #0
		mov		r6, #255
		lsl		r6, r6, #8
		add		r6, r6, #255
		lsl		r6, r6, #8
		add		r6, r6, #255
		lsl		r6, r6, #8
		add		r6, r6, #255
		adr		r2, numbers
		ldr		r2, [r2]
		mov		r4, #1
		lsl		r4, r4, #31
		ands		r5, r4, r2
		submi	r2, r2, #1
		movmi	r7, #1
		eormi	r2, r2, r6
		mov		r3, #0
		adr		r12, numbers
		add		r12, r12, #4
		ldr		r12, [r12]
		ands		r5, r4, r12
		submi	r12, r12, #1
		movmi	r8, #1
		eormi	r12, r12, r6
loop		tst		r12, #1
		addsne	r0, r0, r2
		tst		r12, #1
		adcne	r1, r1, r3
		lsls		r2, r2, #1
		lsl		r3, r3, #1
		adc		r3, r3, #0
		lsrs		r12, r12, #1
		bne		loop
		cmp		r8, r7
		beq		finish
		eor		r0, r0, r6
		eor		r1, r1, r6
		adds		r0, r0, #1
		adc		r1, r1, #0
finish	adr		r3, result
		str		r0, [r3]
		adr		r3, carry
		str		r1, [r3]
