/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- variable a --- */
	.type a, %object
	.size a, 48
a:
	.word 1 @(1,1)
	.word 2 @(1,2)
	.word 3 @(1,3)
	.word 4 @(1,4)
	.word 2 @(2,1)
	.word 4 @(2,2)
	.word 6 @(2,3)
	.word 8 @(2,4)
	.word 3 @(3,1)
	.word 6 @(3,2)
	.word 9 @(3,3)
	.word 12 @(3,4)

/* --- variable b --- */
	.type b, %object
	.size b, 48
b:
        .word 1 @(1,1)
        .word 2 @(1,2)
        .word 3 @(1,3)
        .word 4 @(2,1)
        .word 2 @(2,2)
        .word 4 @(2,3)
        .word 6 @(3,1)
        .word 8 @(3,2)
        .word 3 @(3,3)
        .word 6 @(4,1)
        .word 9 @(4,2)
        .word 12 @(4,3)

c:
	.space 36, 0

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function
.matrix:
	.word a
	.word b
	.word c
	
/*first column of b*/	
fcolumnb:
	ldr r0, .matrix+4 @b
	ldr r6,[r0],#12 @b(1,1)
	ldr r7,[r0],#12 @b(2,1)
	ldr r8,[r0],#12 @b(3,1)
	ldr r9,[r0]     @b(4,1)
	mov pc,lr @return
	

/*second column of b*/
scolumnb:
        ldr r0, .matrix+4 @b
        ldr r6,[r0,#4]! /*b(1,2) 
			 r6=mem32[r0+4]
			 r0=r0+4*/
        ldr r7,[r0,#12]! /*b(2,2)
			  r7=mem32[r0+12]
			  r0=r0+12*/
 	ldr r8,[r0,#12]! @b(3,2)
        ldr r9,[r0,#12]! @b(4,2)
	mov pc,lr @return
	
	
/*third column of b*/	
tcolumnb:
        ldr r0, .matrix+4 @b
        ldr r6,[r0,#8]! /*b(1,3) 
                        r6=mem32[r0+4]
                        r0=r0+4*/
        ldr r7,[r0,#12]! /*b(2,3)
                         r7=mem32[r0+12]
                         r0=r0+12*/
        ldr r8,[r0,#12]! @b(3,3)
        ldr r9,[r0,#12]! @b(4,3)
        mov pc,lr @return
  
     
calculate:
	mul r6,r2,r6 @r6=r6*r2
	mul r7,r3,r7 
	mul r8,r4,r8
	mul r9,r5,r9
	add r6,r6,r7
	add r8,r8,r9
	add r6,r6,r8
	str r6,[r1],#4
	mov pc,lr @return
	
	
main:
	ldr r1,.matrix+8 @c

	/*first row of a*/
	ldr r0, .matrix @a
	ldr r2,[r0],#4 @a(1,1)
	ldr r3,[r0],#4 @a(1,2)
	ldr r4,[r0],#4 @a(1,3)
	ldr r5,[r0]    @a(1,4)

	/*calculate c(1,1)*/
	BL fcolumnb 
	BL calculate
	
        /*calculate c(1,2)*/
	BL scolumnb
	BL calculate
	
        /*calculate c(1,3)*/
	BL tcolumnb
	BL calculate

	/*second row of a*/
	ldr r0, .matrix @a
	ldr r2,[r0,#16]! @a(2,1)
	ldr r3,[r0,#4]! @a(2,2)
	ldr r4,[r0,#4]! @a(2,3)
	ldr r5,[r0,#4]!    @a(2,4)
	
	/*calculate c(2,1)*/
	BL fcolumnb 
	BL calculate
	
        /*calculate c(2,2)*/
	BL scolumnb
	BL calculate
	
        /*calculate c(2,3)*/
	BL tcolumnb
	BL calculate
	
	/*third row of a*/
	ldr r0, .matrix @a
	ldr r2,[r0,#32]! @a(3,1)
	ldr r3,[r0,#4]! @a(3,2)
	ldr r4,[r0,#4]! @a(3,3)
	ldr r5,[r0,#4]! @a(3,4)
	
	/*calculate c(3,1)*/
	BL fcolumnb 
	BL calculate
	
        /*calculate c(3,2)*/
	BL scolumnb
	BL calculate
	
        /*calculate c(3,3)*/
	BL tcolumnb
	BL calculate
	
	ldr r1,.matrix+8 @c
	
.end

