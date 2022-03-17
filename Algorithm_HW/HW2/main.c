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
    
    if (global_max <= 0){
        global_max=0;
    }

    return global_max;
}

int circle_max(int *arr, int arr_len){
    int i, j, res, max_res=0;
    int circle_arr[arr_len];
    for(i=0; i<arr_len; i++){
        for(j=0; j<arr_len; j++){
            circle_arr[j] = arr[(j+i)%arr_len];
        }
        // for(j=0; j<arr_len; j++){
        //     printf("%d, ", circle_arr[j]);
        // }
        // printf("\n");
        res = max_con_seq(circle_arr, arr_len);
        if(max_res <= res){
            max_res = res;
        }
    }

    return max_res;
}

int main(){
    char buffer[1000];
    int *arr;
    int result, arr_len=0;

    if (fgets(buffer, sizeof(buffer), stdin) != 0){
        int i, n, num;
        char *p = buffer;
        for(i=0; sscanf(buffer+i,"%d%n",&num,&n)!=EOF; i+=n){
            arr_len+=1;
        }
        arr = malloc(arr_len * sizeof(int));
        for(i=0; sscanf(p,"%d%n",&num,&n)!=EOF; i++){
            p += n;
            arr[i] = num;
        }
    }

    result = circle_max(arr, arr_len);
    printf("%d", result);

    return 0;
}