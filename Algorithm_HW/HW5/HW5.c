#include<stdio.h>  
#include <stdlib.h>

  
typedef struct Wood{//struct of bridges  
    int x1;  
    int x2;  
    int mark;
    int level;
    int adj_counter;  
    int adj_arr[1000];  
}wood;    
  
print_wood_arr(int n, wood* wood_arr){
    printf("number of wood: %d \n", n);
    for(int i=0;i<n;i++){ 
        printf("\nnumber:%d\n x1:%d, x2:%d\n mark:%d\n adj_counter:%d\n adj_arr:",i, wood_arr[i].x1, wood_arr[i].x2, wood_arr[i].mark, wood_arr[i].adj_counter); 
        for(int j=0;j<wood_arr[i].adj_counter;j++){ 
            printf(" %d,",wood_arr[i].adj_arr[j]); 
        } 
        printf("\n-------------------------------------\n");
    } 
}
  
int bfs_shortest(int amount, wood* wood_arr){
    int queue[amount];
    for (int i=0; i<amount;i++){
        queue[i]=0;
    }


    int q_ind=0, q_front=-1, level=0, flag=1;
    // queue[0]=0;
    while (flag){
        q_front++;
        wood_arr[queue[q_front]].mark=1;
        if (q_front==0){
            level++;
        }
        else if(wood_arr[queue[q_front]].level == wood_arr[queue[q_front-1]].level){
            level = wood_arr[queue[q_front-1]].level+1;
        }
        else{
            level = wood_arr[queue[q_front-1]].level+2;
        }
        for(int i=0; i<wood_arr[queue[q_front]].adj_counter; i++){
            if (wood_arr[wood_arr[queue[q_front]].adj_arr[i]].mark!=1){
                queue[++q_ind]=wood_arr[queue[q_front]].adj_arr[i];
                wood_arr[queue[q_ind]].mark=1;
                wood_arr[queue[q_ind]].level=level;
                if (queue[q_ind] == (amount-1)){
                    flag=0;
                    break;
                }
            }
        }
    }
    return level;
}
  
int main(){  
  
    int n = 0;  
    scanf("%d",&n);//n = number of wood  
  
    wood wood_arr[n];  
  
    int i, j, k, s;  
    for(i=0;i<n;i++){//put data in  
        wood_arr[i].mark=0;
        wood_arr[i].level=0;
        scanf("%d",&s);  
        wood_arr[i].x1 = s;  
        scanf("%d",&s);  
        wood_arr[i].x2 = s;  
  
        for(j=0;j<i;j++){  
            for(k=wood_arr[i].x1;k<=wood_arr[i].x2;k++){  
                if(k>wood_arr[j].x1 && k<wood_arr[j].x2){  
                    wood_arr[j].adj_arr[wood_arr[j].adj_counter] = i;  
                    wood_arr[j].adj_counter++;  
                    wood_arr[i].adj_arr[wood_arr[i].adj_counter] = j;
                    wood_arr[i].adj_counter++;  
                    break;  
                }  
            }  
            if(wood_arr[i].x1==wood_arr[j].x1 && wood_arr[i].x2==wood_arr[j].x2){
                wood_arr[j].adj_arr[wood_arr[j].adj_counter] = i;  
                wood_arr[j].adj_counter++;  
                wood_arr[i].adj_arr[wood_arr[i].adj_counter] = j;
                wood_arr[i].adj_counter++;  

            }
  
        }  
    }  
    
    print_wood_arr(n, wood_arr);
  
    
    printf("%d\n", bfs_shortest(n, wood_arr));  
  
    return 0;  
}  
  