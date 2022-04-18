#include <stdio.h>
#include <stdlib.h>


typedef struct schedule{ // struct of schedule  
    int start;  
    int end;  
    int duration;  
}sched;    

int max(int a, int b){
    if (a>b){
        return a;
    }
    else{
        return b;
    }
}

int overlaped(sched sched_1, sched sched_2){
    if(sched_1.end>sched_2.start){
        return 1;
    }
    else{
        return 0;
    }
}

void insertion_sort(sched sched_arr[], int sched_arr_len){

    sched tmp;
    for(int i=0; i<sched_arr_len; i++){
        tmp = sched_arr[i];
        int j = i-1;
        while (tmp.end<sched_arr[j].end && j>=0){
            sched_arr[j+1] = sched_arr[j];
            j--;
        }
        
        sched_arr[j+1]=tmp;
    }
}

void print_sched_arr(sched sched_arr[], int sched_arr_len){
    for(int j=0;j<sched_arr_len;j++){  
        printf("No. %d job:(%d~%d), its duration:%d\n", j, sched_arr[j].start, sched_arr[j].end, sched_arr[j].duration);
    }  
}

int max_weighted_job_value(sched sched_arr[], int sched_arr_len){

    int value_dp_table[sched_arr_len];
    int max_value=0;
    
    for (int i=0; i<sched_arr_len; i++){   // init profit_df_table
        value_dp_table[i] = sched_arr[i].duration;
    }

    for (int i=0; i<sched_arr_len; i++){
        for (int j=0; j<i; j++){
            if (!overlaped(sched_arr[j], sched_arr[i])){
                value_dp_table[i] = max(value_dp_table[i], sched_arr[i].duration+value_dp_table[j]);
            }
        }
        // printf("%d, ", value_dp_table[i]);
        max_value = (max_value>value_dp_table[i]) ? max_value:value_dp_table[i];
    }

    return max_value;

}


int main(){

    int n = 0;  
    scanf("%d",&n); // n = number of schedule
  
    int input_arr[n*2]; // array of input
    sched *sched_arr; // array of schedule 
    sched_arr = malloc(sizeof(sched)*n);
    int sched_arr_len=0;
    int s, result, t_bound, b_bound;

    for(int i=0; i<n*2; i+=2){
        scanf("%d", &s);
        input_arr[i] = s;
        scanf("%d", &s);
        input_arr[i+1] = s;
    }

    scanf("%d",&t_bound);  
    scanf("%d",&b_bound);  

    for(int i=0; i<n*2; i+=2){
        if(input_arr[i]>=t_bound && input_arr[i+1]<=b_bound){
            sched_arr = realloc(sched_arr, sizeof(sched)*(sched_arr_len+1));
            sched_arr[sched_arr_len].start= input_arr[i];  
            sched_arr[sched_arr_len].end= input_arr[i+1];  
            sched_arr[sched_arr_len].duration = sched_arr[sched_arr_len].end - sched_arr[sched_arr_len].start; // count start, end, duration of scheduled
            sched_arr_len++;
        }
    }



    insertion_sort(sched_arr, sched_arr_len);
    // print_sched_arr(sched_arr, sched_arr_len);

    result = max_weighted_job_value(sched_arr, n);

    printf("%d", result);

    return 0;
}