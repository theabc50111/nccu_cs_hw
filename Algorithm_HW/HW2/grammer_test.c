#include <stdio.h>


int main(){
    int b; 
    b = 2; 
    int* pointer; 
    pointer = &b; 

    *pointer = 5;
    printf("%d", b);


    return 0;
}