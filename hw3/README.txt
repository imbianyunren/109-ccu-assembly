1.程式內容
使用組合語言建立兩個matrix: matrixA(3*4)、matrixB(4*3)
並將兩者相乘算出matrixC(3*3)

2.如何編譯程式
	arm-none-eabi-gcc -g -O0 hw3.s -o hw3.exe
	(若要用gdb debug需在指令加'-g',編譯完後產生hw3.exe)

3.執行環境
	virtualbox 6.1
	ubuntu 20.04.1
	memory: 3.8GB
	CPU: i5-9300H
	Disk space:12.9GB
	
4.如何執行
	arm-none-eabi-insight
	
	出現視窗後在file選取hw3.exe
	並在target settings的target選擇simulator後按ok	
	然後再開啟registers(用於看暫存器內容)、memory視窗(用於看記憶體內內容)
	點選上面小人執行,一步一步跑確認暫存器內容
	最後確定每個暫存器、記憶體內容與結果正確,結束gdb debug
