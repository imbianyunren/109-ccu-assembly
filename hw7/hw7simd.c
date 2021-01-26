#include<xmmintrin.h>
#include<stdio.h>
#include<string.h>
#include <time.h>

struct timespec diff(struct timespec start, struct timespec end);
int main(void)
{
    struct timespec time1,time2;
    float number[200][204]__attribute__((aligned(16)));
    float totol[200];
    __m128 *num1,*num2;

    for(int i=0;i<200;i++){
        memset(number[i],0.0,sizeof(number[i]));
        for(int j=0;j<202;j++){
            scanf("%f",&number[i][j]);
        }
    }
    float ans[4]__attribute__((aligned(16)));
    __m128 *m_ans=(__m128*)ans;

    clock_gettime(CLOCK_MONOTONIC, &time1);
    for(int i=0;i<200;i++){
        ans[0]=ans[1]=ans[2]=ans[3]=0.0;
        for(int j=0;j<200;j++){
            num1=(__m128*)number[i];
            num2=(__m128*)number[j];
            for(int k=0;k<202/4+1;k++){
                *m_ans=_mm_add_ps(_mm_mul_ps(num1[k],num2[k]),*m_ans);
            }
        }
        totol[i]=ans[0]+ans[1]+ans[2]+ans[3];
    }
    clock_gettime(CLOCK_MONOTONIC, &time2);

    printf("%ld : %ld\n",diff(time1,time2).tv_sec,diff(time1,time2).tv_nsec);

    for(int i=0;i<200;i++){
        printf("%.2f\n",totol[i]);
    }
}
struct timespec diff(struct timespec start,struct timespec end)
{
    struct timespec temp;
    if ((end.tv_nsec - start.tv_nsec) < 0)
    {
        temp.tv_sec = end.tv_sec - start.tv_sec - 1;
        temp.tv_nsec = 1000000000 + end.tv_nsec - start.tv_nsec;
    }
    else
    {
        temp.tv_sec = end.tv_sec - start.tv_sec;
        temp.tv_nsec = end.tv_nsec - start.tv_nsec;
    }
    return temp;
}