1.程式內容:
	讀入200x202大小陣列，照hw7.pdf內容做運算(每一列數字去乘其他列數字(包含自己列)並加起來)。

>>產生測資:data.txt
	使用rand()將範圍設在1~10之間的浮點數(四捨五入至小數點後兩位)，產生200x202的測資
	
>>Non-SIMD version:hw7.c
	使用scanf()讀入資料，存取在num變數中，並將運算結果存在total，用printf印出
	執行時間:21961025 nano seconds(系上終端機)
		 96913710 nano seconds(自己電腦)

>>SIMD version:hw7simd.c
	使用scanf()讀入資料，存取在num變數中，宣告ans[4]作為暫存四個數的值
	_mm_mul_ps()去做4個數的相乘、_mm_add_ps()做4個數相加
	將最後總結果存入total，用printf印出
	執行時間:10274352 nano seconds
		 35203022 nano seconds(自己電腦)

2.如何編譯程式:
	hw7.c(nonsimd ver.) >> gcc hw7.c -lrt
	hw7simd.c(simd ver.) >> gcc -msse4 hw7simd.c -lrt
	(-lrt用於clock_gettime()中，-msse4用於編譯simd函式)

3.如何執行程式:
	./a.out < data.txt > output.txt (讀入data.txt內容，並資料寫入output.txt)

4.使用了那些指令:
	_mm_mul_ps()、_mm_add_ps()皆為SSE指令

5.執行環境:
	系上終端機(tux.cs.ccu.edu.tw)
	自己電腦環境:
	 virtualbox 6.1
	 ubuntu 20.04.1
	 memory: 3.8GB
	 CPU: i5-9300H
	 Disk space:12.9GB
	
