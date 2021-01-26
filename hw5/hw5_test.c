#include<stdio.h>
extern int* NumSort(int,int*);
int main(){
    int arr[7]={1,10,6,3,20,40,9};
    int length=7,i=0;
    int *result=NumSort(length,arr);//r0=length,r1=arr
    for(i=0;i<7;i++) printf("%d ",result[i]);
    return 0;
}
