#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 
int main() {
 int row = 200;
 int column=202;
 srand((unsigned) time(NULL) + getpid());
 for(int i=0;i<row;i++){
     for(int j=0;j<column;j++){
         printf("%.2f ", 10.0 * rand() / RAND_MAX + 1.0); 
     }
     printf("\n");
 }
  
 return 0;
}