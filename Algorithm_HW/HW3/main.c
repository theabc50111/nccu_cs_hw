#include <stdio.h>
#include <stdlib.h>


typedef struct schedule{ // struct of schedule  
    int start;  
    int end;  
    int duration;  
    struct sched *over_sched[100];  
}sched;    


int main(){

    int n = 0;  
    scanf("%d",&n); // n = number of schedule
  
    sched sched_arr[n]; // array of schedule 
  
    int i,j,date,s;  
    for(i=0;i<n;i++){
        scanf("%d",&s);  
        skd[i].start= s;  
        scanf("%d",&s);  
        skd[i].end= s;  
        skd[i].duration = skd[i].start - skd[i].end; // count start, end, duration of scheduled
  
        for(j=0;j<i;j++){  
            for(date=skd[i].start;date<=skd[i].end;k++){  
                if(date>=skd[j].start && date<=skd[j].end){  
                      
                    printf("i:%d,k:%d,j:%d\n",i,j,k);  
                      
                    skd[j].over_sched[] = i;  
                    break;  
                }  
            }  
  
        }  
    }  


    return 0;
}