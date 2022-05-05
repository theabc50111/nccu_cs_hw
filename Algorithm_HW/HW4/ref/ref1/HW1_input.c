#include<stdlib.h>
#include<stdio.h>

int main(){
	int i,j;
	int x,y;
	int a;
	int **Array,*pData;
	int positionx, positiony;
	scanf("%d %d",&x,&y);
	Array = (int**)malloc(x*sizeof(int*)+x*y*sizeof(int));
	for (i = 0, pData = (int *)(Array+x); i < x; i++, pData += y){
		Array[i]=pData;
	}
	
	for(i = 0; i<x; i++){
		for(j = 0;j<y;j++){
			scanf("%d",&a);
			Array[i][j]=a;
		} 
	}
	for(i = 0; i<x; i++){
		for(j = 0;j<y;j++){
		printf("%d ",Array[i][j]);
		}
		printf("\n");
	}
	// scanf("%d %d",&positionx,&positiony);
	// printf("%d %d",positionx,positiony);
	free(Array);
	return 0;
}
