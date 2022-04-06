#include <stdio.h>
#include <stdlib.h>

int max_con_seq(int *arr, int arr_len, int *sk_pos){
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
            *sk_pos = i;
        }
    } 


    return global_max;
}

int circle_max(int *arr, int arr_len){
    int i, j, res, max_res=0, sk_pos=0;
    int *p_sk_pos=&sk_pos;
    int circle_arr[arr_len];

    for(i=0; i<arr_len; i++){
        for(j=0; j<arr_len; j++){
            circle_arr[j] = arr[(j+i)%arr_len];
        }
        res = max_con_seq(circle_arr, arr_len, p_sk_pos);
        if (res==0) break;
        if(max_res <= res){
            max_res = res;
        }
        // for(j=1; j<arr_len; j++){
        //     printf("%d, ", circle_arr[j]);
        // }
        // printf("No. %d round, max_con_seq=%d, ", i, res);
        // printf("sk_pos= %d \n", sk_pos);
        if (sk_pos!=0){
            i+=sk_pos;
        }
        else{
            break;
        }
        
    }

    return max_res;
}

int main(){
    int *arr;
    int result, arr_len=0;
    int num, i;
    int input[100000];

    while (scanf("%d", &num)==1)
    {
        input[arr_len] = num;
        arr_len++;
    }
    arr = malloc(arr_len * sizeof(int));
    for(i=0; i<arr_len; i++){
        arr[i] = input[i];
    }



    result = circle_max(arr, arr_len);
    printf("%d", result);

    return 0;
}