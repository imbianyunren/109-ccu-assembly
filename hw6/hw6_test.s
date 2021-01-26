.set SWI_Write, 0x5
.set SWI_Open, 0x1
.set SWI_Close, 0x2
.set AngelSWI, 0x123456

/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4
	
filename:
	.ascii "result.txt\000" /*檔名*/
	
result:
	.ascii "%d,\0" /*印出數字的格式*/
buffer:
	.space 40,0 /*sprintf's buffer*/	
space:
	.space 40,0 /*預留空白位子(第一次strcat要用)
/* ========================= */
/*       TEXT section        */
/* ========================= */
.section .text
.global main
.type main,%function

.string:
	.word result 
.open_param:
	.word filename
	.word 0x4
	.word 0x8

.write_param:
	.space 4   /* file descriptor */
	.space 4   /* address of the string */
	.space 4   /* length of the string */
	
.close_param:
	.space 4


main:
MOV ip, sp
STMFD sp!, {fp, ip, lr, pc}
SUB fp, ip, #4
	
mov r0,#28
bl malloc /*malloc一個7個整數的空間*/

and r6,r0,r0 /*把r0的位子給r6*/
mov r5,#0 /*initial r5=0*/
mov r7,#7 /*the num of the arr*/


loop:
	cmp r5, r7
	bge exit
	bl rand /*generate a random num*/
	@and r0,r0,#1000 /*make the num in 0-1000*/
	str r0,[r6,r5,LSL #2] /*store into arr*/
	add r5, r5, #1
	b loop

exit:	
	mov r0,#7 /*r0=num of arr*/
	and r1,r6,r6 /*r1=location of arr*/

bl NumSort /*call numsort*/
and r6,r0,r0
        
/* open a file */
mov r0, #SWI_Open
adr r1, .open_param
swi AngelSWI
mov r4, r0                /* r4 is file descriptor */
      
/* write the result to a file */
adr r5, .write_param	/*r5 be the thing to write into file*/	
str r4, [r5, #0]          /* store file descriptor */

ldr r7,=space /*r7為空值(用來第一次strcat用)*/
mov r8,#0 

loop2:
	cmp r8,#7
	bge exit2
	/*sprintf(buffer,"%d ",num);  中buffer的位址*/
	ldr r0,=buffer /*load the location of buffer*/
	ldr r1, .string /*印出格式*/
	ldr r2,[r6,r8,LSL #2] /*讀取arr中的值*/
	bl sprintf /*呼叫sprintf*/
	
	mov r0,r7 /*r0 =前次的字串*/
	ldr r1,=buffer/*這次產生的字串*/
	bl strcat /*將前次字串跟此次的接在一起*/
	mov r7,r0 /*把接起來的字串給r7*/
	add r8,r8,#1
	b loop2 

exit2:
str r7, [r5,#4] /*store r7(接好的字串) to address of string([r5,#4])*/
mov r0,r7
bl strlen /*call strlen to calculate the length of string*/
sub r0,r0,#1 /*to take out of the last ','*/
mov r3, r0 /*the length of the string*/
str r3, [r5, #8]  /*store the length to length of string([r5,#8])*/

adr r1, .write_param	/*r1 be the thing to write into file*/	
mov r0, #SWI_Write /*set to the "write" order*/
swi AngelSWI /*call AngelSWI*/

/* close a file */
adr r1, .close_param
str r4, [r1, #0] 
	
mov r0, #SWI_Close
swi AngelSWI

LDMEA fp, {fp, sp, pc}

