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

int circle_max(int *arr, int arr_len, int arr_sum){
    int i, j, res, neg_res, max_res=0;
    int neg_arr[arr_len];

    res = max_con_seq(arr, arr_len);
    for(i=0; i<arr_len; i++){
        neg_arr[i] = -1*arr[i];
    }
    neg_res = max_con_seq(neg_arr, arr_len);
    
    return ((neg_res+arr_sum) > res) ? (neg_res+arr_sum) : res;
}

int main(){
    char buffer[1000000];
    int *arr;
    arr = malloc(1000000000000);
    int result, arr_len=0, arr_sum=0;

    if (fgets(buffer, sizeof(buffer), stdin) != 0){
        int i, n, num;
        char *p = buffer;
        for(i=0; sscanf(p,"%d%n",&num,&n)!=EOF; i++){
            p += n;
            arr_len+=1;
            arr = realloc(arr, arr_len * sizeof(int));
            arr_sum += num;
            arr[i] = num;
        }
    }

    result = circle_max(arr, arr_len, arr_sum);
    printf("%d", result);

    return 0;
}