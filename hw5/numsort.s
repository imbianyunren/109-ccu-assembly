/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4
b:
	.space 28, 0
	
	
	.section .text
	.global NumSort
	.type NumSort,%function
.array:
	.word b
	
NumSort:
	/* function start */
	MOV ip, sp
	STMFD sp!, {r4-r10,fp, ip, lr, pc}
	SUB fp, ip, #4
	/*r0=length r1=arr*/
	mov r3,r0 @mov r0(length of arr) to r3
	ldr r0, .array
	mov r4, #0
	/*load the num in r1(array in hw5_test.c)to r0*/
	r0loop: 
		ldr r2,[r1,r4,LSL #2]
		str r2,[r0,r4,LSL #2]
		add r4,r4,#1
		cmp r4,r3
		BLT r0loop @if r4<r0 continue the loop
		
	/* DO NumSort(bubblesort)*/
	next:
		mov r1,#0	@when the new loop let r1 be the first element
		mov r6,#0	@for count swap time
	loop:
		add r2,r1,#1		@r2 be the next element,r1 the current
		cmp r2,r3		@check for the end of array
		BGE check		@when reach to the end check for changes(if r2>=r0)
		/*r4=current element value,r2=the order of current element,
		bcz 1word=4bits, so let r4 =r3+r2*4(LSL #2)*/
		ldr r4,[r0,r1,LSL #2]	@r4=current element value
		ldr r5,[r0,r2,LSL #2]	@r5=next elemnt value
		cmp r5,r4
		STRGT r5,[r0,r1,LSL #2] @r4,r5 exchange if r5>r4
		STRGT r4,[r0,r2,LSL #2]
		ADDGT r6,r6,#1		@r6++(swap time++) if there is exchange
		mov r1,r2		@to next element
		B loop
	check:
		cmp r6,#0	@check if there is change in this loop
		SUBGT r3,r3,#1	@skip the last value in next loop
		BGT next
	/* --- end of your function --- */
	nop
	/* function exit */
	LDMEA fp, {r4-r10,fp, sp, pc}
.end
