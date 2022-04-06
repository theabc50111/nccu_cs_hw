#include<stdio.h>  
  
typedef struct direction{//struct of bridges  
    int x1;  
    int x2;  
    int counter ;  
    int adj[1000];  
}dire;    
  
  
  
int shortest(int start, int amount, dire* data);  
  
int main(){  
  
    int n = 0;  
    scanf("%d",&n);//n = number of wood  
  
    dire dir[n];  
  
    int i,j,k,s;  
    for(i=0;i<n;i++){//put data in  
        scanf("%d",&s);  
        dir[i].x1 = s;  
        scanf("%d",&s);  
        dir[i].x2 = s;  
  
        for(j=0;j<i;j++){  
            for(k=dir[i].x1;k<=dir[i].x2;k++){  
                if(k>=dir[j].x1 && k<=dir[j].x2){  
                      
                    printf("i:%d,k:%d,j:%d\n",i,j,k);  
                      
                    dir[j].adj[dir[j].counter] = i;  
                    dir[j].counter++;  
                    break;  
                }  
            }  
  
        }  
    }  
  
    for(i=0;i<n;i++){ 
        printf("\nnumber:%d\nx1:%d,x2:%d\ncounter:%d\n",i,dir[i].x1,dir[i].x2,dir[i].counter); 
        for(j=0;j<dir[i].counter;j++){ 
            printf("%d,",dir[i].adj[j]); 
        } 
    } 
    // printf("%d\n",shortest(0,n,dir)-1);  
  
    return 0;  
}  
  
int shortest(int start, int amount, dire* data){  
    int i, path, sum;  
  
    if(start == amount){  
        return 1;  
    }  
  
    else{  
        for(i=0;i<data[start].counter;i++){  
  
        path = shortest(data[start].adj[i], amount, data);  
  
//printf("start:%d\n",start);  
            if(i == 0){  
                sum = path;  
            }  
            else if(path<sum){  
                sum = path;  
            }  
  
            return sum+1;  
        }  
    }  
};  
