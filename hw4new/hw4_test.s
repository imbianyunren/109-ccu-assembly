/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- variable a --- */
	.type a, %object
	.size a, 28
a:
	.word 2
	.word 65
	.word 26
	.word 17
	.word 85
	.word 56
	.word 15

b:
	.space 28, 0
/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function
	
.array:
	.word a
	.word b
	
main:
	MOV ip, sp
	STMFD sp!, {fp, ip, lr, pc}
	SUB fp, ip, #4

	/* put array size into r0 */
	ldr r0, =#7
	/* put array address into r1 */
	ldr r1, .array
	ldr r3, .array+4
	mov r4, #0
	loop: /*load the num in r1 to r3*/
		ldr r2,[r1,r4,LSL #2]
		str r2,[r3,r4,LSL #2]
		add r4,r4,#1
		cmp r4,r0
		BLT loop @if r4<r0 continue the loop
	/*goto numsort*/
	bl NumSort
	/* --- end of your function --- */
	LDMEA fp, {fp, sp, pc}
.end
