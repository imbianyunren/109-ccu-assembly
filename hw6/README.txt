1.程式內容
	hw6_test.s為主程式，首先用malloc()產生7個整數陣列，
	並使用rand()產生隨機亂數存入陣列中(測資)，
	之後呼叫Numsort(numsort.c)去做排序。
	做完排序後呼叫AngelSWI去做開檔寫檔等操作，
	產生result.txt並將排序後結果寫入result.txt中。
	result.txt即可查看排序結果。

2.呼叫的C function
	malloc:開空間用，先預設好r0為要開的空間大小(7個整數=7*4=28)，呼叫malloc後會將產生的空間位址存在r0中
	rand:產生亂數，產生結果存在r0
	sprintf: 用來將數字轉為字串
		 預設項:r0產生的字串要存的地址、r1輸出格式、r2(包括r2之後的暫存器)為輸出格式中的變數內容
		 產生結果存在原本預設要存的字串地址那邊
	strcat:  用來將兩字串連接
		 預設項:r0>>第一個字串，r1>>另一個字串
		 產生結果存在r0
	strlen:  用來計算字串長度
		 r0為要計算的字串
		 產生字串長度存在r0

3.如何編譯程式
	arm-none-eabi-gcc -g hw6_test.s numsort.c -o hw6.exe
	(將主函式與副函式(numsort.c)組起來產生執行檔hw6.exe)

4.執行環境
	virtualbox 6.1
	ubuntu 20.04.1
	memory: 3.8GB
	CPU: i5-9300H
	Disk space:12.9GB
	
5.如何執行
	arm-none-eabi-insight
	
	出現視窗後在file選取hw6.exe
	並在target settings的target選擇simulator後按ok	
	然後再開啟registers(用於看暫存器內容)、memory視窗(用於看記憶體內內容)
	點選上面小人執行,一步一步(next)跑確認暫存器內容
	最後確定每個暫存器、記憶體內容與結果正確(先確認r6內的排序為由大到小)
	之後跑入AngelSWI的部分，確定sprintf產生字串正確，strcat字串連接正確後將此字串寫入result.txt
	最後確定result.txt內容正確即可結束debug

