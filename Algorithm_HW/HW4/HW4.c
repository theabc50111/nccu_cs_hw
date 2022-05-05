#include <stdio.h>
#include <stdlib.h>

int global_max = 0, local_max = 1;
int mine_type;
int row, col;

void print_arr(int** map, int row, int col){
    printf("row: %d, col: %d, map:\n", row, col);
    for (int i = 0; i<row; i++){
        for (int j=0; j<col; j++){
            printf("%d ", map[i][j]);
        }
        printf("\n");
    }
}

int dfs(int y, int x, int**map, int**map_mark){
    map_mark[y][x] = 1;
    if ((x+1<col) && (map[y][x+1]==mine_type) && (map_mark[y][x+1]!=1)){
        local_max++;
        map_mark[y][x+1]=1;
        dfs(y, x+1, map, map_mark);
    }
    if ((x-1>=0) && (map[y][x-1]==mine_type) && (map_mark[y][x-1]!=1)){
        local_max++;
        map_mark[y][x-1]=1;
        dfs(y, x-1, map, map_mark);
    }
    if ((y+1<row) && (map[y+1][x]==mine_type) && (map_mark[y+1][x]!=1)){
        local_max++;
        map_mark[y+1][x]=1;
        dfs(y+1, x, map, map_mark);
    }
    if ((y-1>=0) && (map[y-1][x]==mine_type) && (map_mark[y-1][x]!=1)){
        local_max++;
        map_mark[y-1][x]=1;
        dfs(y-1, x, map, map_mark);
    }
    return local_max;

}

int main(){

    int tmp = 0, cnt = 0 ;
    scanf("%d %d", &row, &col);
    int **map = (int **)malloc(row * sizeof(int*));
    int **map_mark = (int **)malloc(row * sizeof(int*));
    int *input_arr = (int*)malloc(row*col*sizeof(int));

    // initialized map
    for (int i=0; i<row; i++){
        map[i] = (int*)malloc(col * sizeof(int));
    }

    while (scanf("%d", &tmp) != EOF){
        input_arr[cnt++] = tmp;
    }

    for (int i=0; i<row; i++){
        for (int j=0; j<col; j++){
            map[i][j] = input_arr[i*col +j];
        }
    }

    // print_arr(map, row, col);

    // initialized map_mark
    for (int i=0; i<row; i++){
        map_mark[i] = (int*)malloc(col * sizeof(int));
    }
    for (int i = 0; i<row; i++){
        for (int j=0; j<col; j++){
            map_mark[i][j] = 0;
        }
    }
    // print_arr(map_mark, row, col);

    for (int i=0; i<row; i++){
        for (int j=0; j<col; j++){
            local_max=1;
            mine_type=map[i][j];
            local_max = dfs(i, j, map, map_mark);
            printf("%d ", local_max);
            global_max = (global_max>local_max) ? global_max:local_max;

        }
    } 
    printf("\n");
    // print_arr(map_mark, row, col);
    printf("%d", global_max);

    return 0;
}