//Algorithm Maximum_Consecutive_Subsequence(X,n)
#include <stdio.h>
#include <stdlib.h>

//int main(int argc, char *argv[]){
int main(void){

    //Input: X (an array of size n)
    //Input
    //輸入為一行由N個整數組成的序列，1<=N<=100000。
    //序列中每個整數M代表磚柱的高度及顏色, -100<= M <=100。M>=0代表紅色磚柱，M<0代表藍色磚柱。
	//Output
    //輸出為一正整數P，P>=0，代表最大的總能量。
    
    int myInput[210000];
    //int *myInput = calloc(120000, sizeof(short int));
    int tmp;
	//char temp;
    int cnt = 0;
	
	while(scanf("%d", &tmp) != EOF)
	{
		myInput[cnt++] = tmp;
	}
	      
    int i, j, k, N;
    N = cnt; // # of integers read
    
    for (i=0; i<N;i++){
    	myInput[i+N]=myInput[i];
	}
	
	for (k=0; k<N*2;k++){
		printf("%d\n",myInput[k]);
	}
    // Algorithm
    // For i:=1 to n do
    // If x[i] + Suffix_Max > Global_Max then
    // Suffix_Max:= Suffix_Max+ x[i];
    // Global_Max := Suffix_Max;
    // else if x[i]+Suffix_Max > 0 then
    // Suffix_Max := x[i] + Suffix_Max
    // else Suffix_Max:=0	   
	
	long int Global_max = 0;
    long int Global_max_ = 0;
    long int Suffix_max = 0;

    for (i = 0; i < N; i++)
    { //Suffix start at i 
     	Global_max = 0;
    	Suffix_max = 0;
    	
        for (j=i; j<(i+N); j++){
        	if ((myInput[j] + Suffix_max) > Global_max)
            {
                Suffix_max = Suffix_max + myInput[j];
                Global_max = Suffix_max;
                if(Global_max > Global_max_){
                	Global_max_ = Global_max;
				}
            }
        	else if ((myInput[j] + Suffix_max) > 0)
            {
				Suffix_max = myInput[j] + Suffix_max;
            }
            else
            {
				Suffix_max = 0;            
            } 
    	}
	}

    printf("%d", Global_max_);

    //End
    //free(myInput);
    system("pause");
    return 0;
}