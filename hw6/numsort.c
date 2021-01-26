int* NumSort(int size,int* arr){
    int result[size];
    int r=0;
    for(;r<size;r++){
    	result[r]=arr[r];
    }
    int i=0,j=0;
    for(;i<size-1;i++){
    j=0;
        for(;j<size-1-i;j++){
            if(result[j]<result[j+1]){
                int tmp=result[j];
                result[j]=result[j+1];
                result[j+1]=tmp;
            }
        }
    }
    return result;
}
