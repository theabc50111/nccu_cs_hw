//http://140.119.164.188/problem/HW3-cs

#include <stdio.h>
#include <stdlib.h>

int myDFS(int i, int j, int **mtx, int **myVisitedMtx);
int myGlobalMax = 0;	//to record the maximum value
int myComponent = 1;	//to record the value for each run
int myColor;			//to check and record the color of the cell
int row, col;			//for the first 2 input data

int main()
{
    scanf("%d %d", &row, &col);

    int **mtx = (int **)malloc(row * sizeof(int *));
    for (int i = 0; i < row; i++)
    {
        mtx[i] = (int *)malloc(col * sizeof(int));
    }

    int *myInput = (int *)malloc(row * col * sizeof(int));

    int tmp, cnt = 0;
    while (scanf("%d", &tmp) != EOF)
    {
        myInput[cnt++]=tmp;
    }

    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < col; j++)
        {
            mtx[i][j] = myInput[i * col + j];
        }
    }

	//record to check whether it is visited
    int **myVisitedMtx = (int **)malloc((row + 1) * sizeof(int *));
    for (size_t i = 0; i < row; i++)
    {
        myVisitedMtx[i] = (int *)malloc(col * sizeof(int));
    }

    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < col; j++)
        {
            myVisitedMtx[i][j] = 0;
        }
    }
    
  	//search connection components one by one
    for(int i=0; i<row; i++){
        for(int j=0; j<col; j++){

        	//examine and assign the color (1 or 0) 
            myColor = mtx[i][j]; 
            myComponent=1;
            //myDavid is for the return value of myDFS recursive search result
            int myDavid = myDFS(i,j,mtx, myVisitedMtx);
            //if myDavid (return of myDFS) is large than myGlobalMax
          	//then assign myDavid to myGlobalMax
            if(myDavid>myGlobalMax){
                myGlobalMax=myDavid;
            }                               
        }
    }   
    
    printf("%d", myGlobalMax);

    //system("pause");
    return 0;
}

int myDFS(int i, int j, int **mtx, int **myVisitedMtx){
    //printf("i-> %d, j-> %d", i, j);
    //printf("\n");
    myVisitedMtx[i][j]=1;
    
            if ((j + 1) < col)
            {
                if (mtx[i][j + 1] == myColor && !myVisitedMtx[i][j+1])
                {
                    myComponent++;
                    myVisitedMtx[i][j+1]=1;
                    myDFS(i, j+1, mtx, myVisitedMtx);
                }
            }

            if ((i + 1) < row)
            {
                if (mtx[i + 1][j] == myColor && !myVisitedMtx[i+1][j])
                {
                    myComponent++;
                    myVisitedMtx[i+1][j]=1;
                    myDFS(i+1, j, mtx, myVisitedMtx);
                }
            }

            if ((j - 1) >= 0)
            {
                if (mtx[i][j - 1] == myColor && !myVisitedMtx[i][j-1])
                {
                    myComponent++;
                    myVisitedMtx[i][j-1]=1;
                    myDFS(i, j-1, mtx, myVisitedMtx);
                }
            }

            if ((i - 1) >= 0)
            {
                if (mtx[i - 1][j] == myColor && !myVisitedMtx[i-1][j])
                {
                    myComponent++;
                    myVisitedMtx[i-1][j]=1;
                    myDFS(i-1, j, mtx, myVisitedMtx);
                }
            }
    //if(myComponent>myGlobalMax){
    //    myGlobalMax=myComponent;
    //}
    //printf("%d-> ", myComponent);
    //printf("\n");
    return myComponent;
}