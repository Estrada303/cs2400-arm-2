		;		ARM Programming Assignment #2: Writing C-strings
		;
		;		Write a program that assembles the values in chars*
		;		into a C-style string. A C-style string is an array
		;		of byte-size characters, terminated by a NULL (0x0).
		;		Write the C-string to the FILL memory at 'string'.
		;		Note: It's up to you to declare the correct number
		;		of bytes to hold the result.
		
		;		Your code here
		
chars0	DCD		'T', 'h', 'e', ' ', '2', '0', '1', '8', ' ', 'T', 'u'
chars1	DCD		'r', 'i', 'n', 'g', ' ', 'A', 'w', 'a', 'r', 'd', ' '
chars2	DCD		'w', 'a', 's', ' ', 'a', 'w', 'a', 'r', 'd', 'e', 'd'
chars3	DCD		' ', 't', 'o', ' ', 'B', 'e', 'n', 'g', 'i', 'o'
chars4	DCD		' ', 'H', 'i', 'n', 't', 'o', 'n', ' ', 'a', 'n'
chars5	DCD		'd', ' ', 'L', 'e', 'C', 'u', 'n', 'n', ' ', 'f', 'o'
chars6	DCD		'r', ' ', 't', 'h', 'e', 'i', 'r', ' ', 'w', 'o', 'r'
chars7	DCD		'k', ' ', 'o', 'n', ' ', 'n', 'e', 'u', 'r', 'a', 'l'
chars8	DCD		'n', 'e', 't', 'w', 'o', 'r', 'k', 's', '.'
count	DCD		95
string	FILL		96
main
		mov		r0, #95		; char counter
		adr		r2, chars0
		adr		r6, string
		
loop1	ldr		r3, [r2], #4	;====================
		add		r4, r3, r4	;|A char is loaded to register
		ldr		r3, [r2], #4	;|and shifted to the correct byte
		lsl		r3, r3, #8	;|location in the word
		add		r4, r3, r4	;|when four chars are placed in
		ldr		r3, [r2], #4	;|the word the word is ready to store
		lsl		r3, r3, #16	;|into memory
		add		r4, r3, r4	;|
		ldr		r3, [r2], #4   ;|
		lsl		r3, r3, #24	;|
		add		r4, r3, r4	;=====================
		str		r4, [r6], #4	;store the 4 chars into memory
		mov		r4, #0		;reset the word for next four chars
		subs		r0, r0, #4	;decrementer for counting chars
		bgt		loop1		; branch if any chars left
		
		
		
