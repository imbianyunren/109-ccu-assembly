#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct timespec diff(struct timespec start, struct timespec end);
int main()
{
    struct timespec time1,time2;
    float num[200][202];
    for (int i = 0; i < 200; i++)
    {
        for (int j = 0; j < 202; j++)
        {
            scanf("%f", &num[i][j]);
        }
    }
    float total[200] = {0.0};

    clock_gettime(CLOCK_MONOTONIC, &time1);
    for (int i = 0; i < 200; i++)
    {
        for (int r = 0; r < 200; r++)
        {
            for (int j = 0; j < 202; j++)
            {
                total[i] += (num[i][j] * num[r][j]);
            }
        }
    }
    clock_gettime(CLOCK_MONOTONIC, &time2);

    printf("%ld : %ld\n",diff(time1,time2).tv_sec,diff(time1,time2).tv_nsec);

    for (int i = 0; i < 200; i++)
        printf("%.2f\n", total[i]);

    
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