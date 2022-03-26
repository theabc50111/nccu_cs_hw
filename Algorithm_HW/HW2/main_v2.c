#include <stdio.h>
#include <stdlib.h>

int max_con_seq(int *arr, int arr_len){
    int global_max=0, suffix_max=0, i=0;

    for (i=0; i<arr_len; i++){
        if (arr[i]+suffix_max > global_max){
            suffix_max = suffix_max + arr[i];
            global_max = suffix_max;
        }
        else if(arr[i]+suffix_max > 0){
            suffix_max = suffix_max + arr[i];
        }
        else{
            suffix_max=0;
        }
    } 


    return global_max;
}

int circle_max(int *arr, int *neg_arr, int arr_len, int arr_sum){
    int i, j, res, neg_res, max_res=0;

    res = max_con_seq(arr, arr_len);
    neg_res = max_con_seq(neg_arr, arr_len);
    
    return ((neg_res+arr_sum) > res) ? (neg_res+arr_sum) : res;
}

int main(){
    int *arr, *neg_arr;
    int result, arr_len=0, arr_sum=0;
    int num, i;
    int input[100000];

    while (scanf("%d", &num)==1)
    {
        input[arr_len] = num;
        arr_sum += num;
        arr_len++;
    }
    arr = malloc(arr_len * sizeof(int));
    neg_arr = malloc(arr_len * sizeof(int));
    for(i=0; i<arr_len; i++){
        arr[i] = input[i];
        neg_arr[i] = -1*input[i];
    }

    result = circle_max(arr, neg_arr, arr_len, arr_sum);
    printf("%d", result);

    return 0;
}