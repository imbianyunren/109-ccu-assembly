1.程式內容(以下為我的程式碼內容)

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

2.如何編譯程式
	arm-none-eabi-gcc -g -O0 hw2.s -o hw2.exe
	(若要用gdb debug需在指令加'-g',編譯完後產生hw2.exe)

3.執行環境
	virtualbox 6.1
	ubuntu 20.04.1
	memory: 3.8GB
	CPU: i5-9300H
	Disk space:12.9GB
	
4.如何執行
	arm-none-eabi-insight
	
	出現視窗後在file選取hw2.exe
	並在target settings的target選擇simulator後按ok	
	然後再開啟registers的視窗(用於看暫存器內容)
	點選上面小人執行,一步一步跑確認暫存器內容
	最後確定每個暫存器內容與結果正確,結束gdb debug
