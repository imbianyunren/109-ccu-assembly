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
	
/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function
	
.array:
	.word a
	
main:
	MOV ip, sp
	STMFD sp!, {fp, ip, lr, pc}
	SUB fp, ip, #4

	/* put array size into r0 */
	ldr r0, =#7
	/* put array address into r1 */
	ldr r1, .array
	/*goto numsort*/
	bl NumSort
	/* --- end of your function --- */
	LDMEA fp, {fp, sp, pc}
.end
