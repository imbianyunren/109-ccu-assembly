	.section .text
	.global main
	.type main,%function
main:
	/*r0為結果數值
	  r1~r3為被乘數
	  r4~r6為乘數*/

	mov r0,#0 /*mov指定給r0~r6數值*/
	mov r1,#10
	mov r2,#20
	mov r3,#12
	mov r4,#2
	mov r5,#3
	mov r6,#4
	MUL r1,r4,r1/*進行乘法運算*//*r1=r4*r1*/
	MUL r2,r5,r2
	MUL r3,r6,r3
	ADD r0,r1,r2/*進行加法運算*//*r0=r1+r2*/
	ADD r0,r0,r3
	nop
	.end
