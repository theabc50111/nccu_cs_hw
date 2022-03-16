#include <stdio.h>
#include <stdlib.h>

int max_con_seq(){
    
    
    return 0;
}

int * rec_seq(){
    char buffer[1000];
    int arr_len=0;
    static int *arr;
    if (fgets(buffer, sizeof(buffer), stdin) != 0){
        int i,j,a;
        for(i=0; sscanf(buffer+i,"%d%n",&a,&j)!=EOF; i++){
            arr_len+=1;
        }
        arr = malloc(100 * sizeof(int));
        for(i=0; sscanf(buffer+i,"%d%n",&a,&j)!=EOF; i++){
            arr[i] = a;
        }
    }

    return arr;
}


int main(){
    int *re;
    int i;
    re = rec_seq();
    for(i=0; i<100; ++i){
        printf("%d, ", re[i]);
    }
    return 0;
}