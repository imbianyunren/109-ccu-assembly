	.section .text
	.global NumSort
	.type NumSort,%function

NumSort:
	/* function start */
	MOV ip, sp
	STMFD sp!, {r0-r10, fp, ip, lr, pc}
	SUB fp, ip, #4

	/* DO NumSort */
	next:
		mov r1,#0	@when the new loop let r1 be the first element
		mov r6,#0	@for count swap time
	loop:
		add r2,r1,#1		@r2 be the next element,r1 the current
		cmp r2,r0		@check for the end of array
		BGE check		@when reach to the end check for changes(if r2>=r0)
		/*r4=current element value,r2=the order of current element,
		bcz 1word=4bits, so let r4 =r3+r2*4(LSL #2)*/
		ldr r4,[r3,r1,LSL #2]	@r4=current element value
		ldr r5,[r3,r2,LSL #2]	@r5=next elemnt value
		cmp r5,r4
		STRGT r5,[r3,r1,LSL #2] @r4,r5 exchange if r5>r4
		STRGT r4,[r3,r2,LSL #2]
		ADDGT r6,r6,#1		@r6++(swap time++) if there is exchange
		mov r1,r2		@to next element
		B loop
	check:
		cmp r6,#0	@check if there is change in this loop
		SUBGT r0,r0,#1	@skip the last value in next loop
		BGT next
	/* --- end of your function --- */
	nop
	/* function exit */
	LDMEA fp, {r0-r10, fp, sp, pc}
.end
