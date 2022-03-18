#include <stdio.h>
#include <stdlib.h>

int max_con_seq(int *arr, int arr_len, int *sk_pos){
    int global_max=0, suffix_max=0, suffix_nega_min=0, i=0;

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

    // int circle_arr[2*arr_len];
    // for (i=0; i<2*arr_len; i++){
    //     circle_arr[i] = arr[i%arr_len];
    // }

    // for (i=0; i<arr_len; i++){
    //     res = max_con_seq(circle_arr, arr_len, p_sk_pos);
    //     if(max_res <= res){
    //         max_res = res;
    //     }
    //     i+=sk_pos;
    // }

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
    char buffer[1000000];
    int *arr;
    arr = malloc(1000000000000);
    int result, arr_len=0;

    if (fgets(buffer, sizeof(buffer), stdin) != 0){
        int i, n, num;
        char *p = buffer;
        for(i=0; sscanf(p,"%d%n",&num,&n)!=EOF; i++){
            p += n;
            arr_len+=1;
            arr = realloc(arr, arr_len * sizeof(int));
            arr[i] = num;
        }
    }

    result = circle_max(arr, arr_len);
    printf("%d", result);

    return 0;
}