#include <stdlib.h>
#include <stdio.h>
#include <math.h>

struct dyn_array{
    int capacity;
    int logical_size;
    int *arr;
};

typedef struct dyn_array DynamicArray;

// void dyn_insert_v1 (DynamicArray *dyn_arr, int insert_data){
//     printf("capacity:%d \n", dyn_arr->capacity);
//     printf("logical_size:%d \n", dyn_arr->logical_size);
//     printf("dyn_array: "); 
//     for(int i=0; i< dyn_arr->capacity; i++){
//             printf("%d, ", dyn_arr->arr[i]);
//     }
//     printf("\n");

//     if (dyn_arr->capacity <= dyn_arr->logical_size){
//         size_t new_size = 2*dyn_arr->capacity;
//         int new_arr[new_size];
//         dyn_arr->capacity = new_size;
//         // realloc(dyn_arr, sizeof(DynamicArray) + (2 + dyn_arr->capacity) * sizeof(int)); 
//         // for(int i=0; i < dyn_arr->capacity; i++){
//         //     if(i< dyn_arr->logical_size){
//         //         dyn_arr->arr[i] = dyn_arr->arr[i];
//         //     }
//         //     elif(i == dyn_arr->logical_size){
//         //         dyn_arr->arr[i] = insert_data;
//         //     }
//         // }
//         // for(int i=0; i<new_size ; i++){
//         //     dyn_arr->arr[i] = new_arr[i];
//         // }

//     }
//     printf("relloc capacity:%d \n", dyn_arr->capacity);
//     printf("relloc logical_size:%d \n", dyn_arr->logical_size);
//     printf("realloc dyn_array: "); 
//     for(int i=0; i< dyn_arr->capacity; i++){
//             printf("%d, ", dyn_arr->arr[i]);
//     }
//     printf("\n");
// }



int main(){
    int init_arr[5] = {100,610,9,8,10};
    int init_arr_size = sizeof(init_arr)/sizeof(int);
    int a = (int) init_arr_size;
    printf("%d \n",log2(a));
//     DynamicArray *my_array = malloc(sizeof(DynamicArray) + (2+init_arr_size) * sizeof(int));
//     my_array->capacity = init_arr_size;
//     // my_array->capacity = (int) ceil(log(my_array->capacity));
//     my_array->logical_size = init_arr_size;
//     my_array->arr = init_arr;
//     // for(int i=0; i< my_array->logical_size; i++){
//     //     // my_array->arr[i] = init_arr[i];
//     //     printf("%d", my_array->arr[i]);
//     // }
// ;
//     dyn_insert_v1(my_array, 10);


    return 0;
}