1.程式內容
	hw5_test.c為主程式，用以宣告排序前陣列及輸出排序後(printf)陣列。
	而排序內容由主程式呼叫NumSort去執行，在NumSort中將陣列用BubbleSort由大到小排序，
	並由r0回傳排序好的內容。

2.如何編譯程式
	arm-none-eabi-gcc -g hw5_test.c numsort.s -o hw5.exe
	(將主函式與副函式(numsort.s)組起來產生執行檔hw4.exe)

3.執行環境
	virtualbox 6.1
	ubuntu 20.04.1
	memory: 3.8GB
	CPU: i5-9300H
	Disk space:12.9GB
	
4.如何執行
	arm-none-eabi-insight
	
	出現視窗後在file選取hw5.exe
	並在target settings的target選擇simulator後按ok	
	然後再開啟registers(用於看暫存器內容)、memory視窗(用於看記憶體內內容)
	點選上面小人執行,一步一步跑確認暫存器內容
	最後確定每個暫存器、記憶體內容與結果正確(確認r0內的排序為由大到小)
	並有傳回主函式，結束gdb debug

