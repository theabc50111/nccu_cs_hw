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

int circle_max(int *arr, int arr_len){
    int i, j, res, max_res=0;
    int circle_arr[arr_len];
    for(i=0; i<arr_len; i++){
        for(j=0; j<arr_len; j++){
            circle_arr[j] = arr[(j+i)%arr_len];
        }
        res = max_con_seq(circle_arr, arr_len);
        if(max_res < res){
            max_res = res;
        }
    }

    return max_res;
}

int * rec_seq(int *arr_len){
    char buffer[1000];
    static int *arr;
    *arr_len=0;

    if (fgets(buffer, sizeof(buffer), stdin) != 0){
        int i, n, num;
        char *p = buffer;
        for(i=0; sscanf(buffer+i,"%d%n",&num,&n)!=EOF; i+=n){
            *arr_len+=1;
        }
        arr = malloc(*arr_len * sizeof(int));
        for(i=0; sscanf(p,"%d%n",&num,&n)!=EOF; i++){
            p += n;
            arr[i] = num;
        }
    }
    return arr;
}

int main(){
    int *arr, *arr_len;
    int result;

    arr = rec_seq(arr_len);
    result = circle_max(arr, *arr_len);
    printf("ans= %d", result);

    return 0;
}