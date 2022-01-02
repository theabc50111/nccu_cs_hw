#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <ctime>
#include <iostream>
#include <bits/stdc++.h>
#include <algorithm>
#include <vector>
#include <bitset>
#include <chrono>
#include <unordered_set>

#define NODE 7

using namespace std;



double graph[NODE][NODE]={
    {0,   1.7,  2.3, 0,   0,   0,   1.2},
    {1.7, 0,    0,   5.3, 1,   0,   10.6},
    {2.3, 0,    0,   2,   3.7, 0,   2.1},
    {0,   5.3,  2,   0,   2,   2,   7.3},
    {0,   1,    3.7, 2,   0,   1.1, 0.2},
    {0,   0,    0,   2,   1.1, 0,   1.9},
    {1.2, 10.6, 2.1, 7.3, 0.2, 1.9, 0}};


void output_file(string file_name, string type_record, vector<double> time_records){
    ofstream myfile;
    myfile.open (file_name);
    myfile << "k, " << type_record << "\n";
    for(int i=10; i<=30; i++){

        myfile << "k=" << i << "," << time_records[i-10] << "," << "\n";
    }
    myfile.close();
}


// finding minimum distance
int miniDist(double distance[], bool Tset[]){
    double minimum=INT_MAX;
    int ind;
              
    for(int k=0;k<NODE;k++) 
    {
        if(Tset[k]==false && distance[k]<=minimum)      
        {
            minimum=distance[k];
            ind=k;
        }
    }
    return ind;
}

double dijkstra_arr(double graph[][NODE], int src, bool show_path_to_each) // adjacency matrix 
{
    double distance[NODE]; // // array to calculate the minimum distance for each node                             
    bool Tset[NODE];// boolean array to mark visited and unvisited for each node
    double path_sum=0;    
     
    for(int k = 0; k<NODE; k++)
    {
        distance[k] = INT_MAX;
        Tset[k] = false;    
    }
    
    distance[src] = 0;   // Source vertex distance is set 0               
    
    for(int k = 0; k<NODE; k++)                           
    {
        int m=miniDist(distance,Tset); 
        Tset[m]=true;
        for(int k = 0; k<NODE; k++)                  
        {
            // updating the distance of neighbouring vertex
            if(!Tset[k] && graph[m][k] && distance[m]!=INT_MAX && distance[m]+graph[m][k]<distance[k])
                distance[k]=distance[m]+graph[m][k];
        }
    }
    
    if(show_path_to_each){
        cout<<"Vertex\t\tDistance from source vertex"<<endl;
        for(int k = 0; k<NODE; k++)                      
        { 
            char str=65+k; 
            cout<<str<<"\t\t\t"<<distance[k]<<endl;
        }
    }

    for(int i=0; i<NODE; i++) path_sum+=distance[i];

    return path_sum;
}

struct tester {
    vector<double> c_time_records;
    vector<double> ave_path_records;
    string file_name_ct;
    string file_name_ave_path;
    string type_record;
    double each_nodes_path_sum=0;
    double each_nodes_path_ave;

    void test(){
        clock_t c_begin_time, c_end_time;

        for (int n_node=10; n_node<=50; n_node+=10){

            switch (n_node){
                case 10:
                    #undef NODE
                    #define NODE 10
                    break;
                
                case 20:
                    #undef NODE
                    #define NODE 20
                    break;
                
                case 30:
                    #undef NODE
                    #define NODE 30
                    break;
                
                case 40:
                    #undef NODE
                    #define NODE 40
                    break;
                
                case 50:
                    #undef NODE
                    #define NODE 50
                    break;
                
                default:
                    break;
            }

            if(type_record.compare("dijkstra_arr")==0) {
                c_begin_time = clock();
                for(int i=0; i<NODE; i++) each_nodes_path_sum+= dijkstra_arr(graph, i, true); 
                each_nodes_path_ave = each_nodes_path_sum/((NODE*(NODE-1))/2);
                c_end_time = clock();
            }

            double c_spend_time = (double)(c_end_time-c_begin_time) / CLOCKS_PER_SEC;
            cout << "Number of nodes =" << NODE << ", counting time: " << c_spend_time << ", average path: " << each_nodes_path_ave << endl;
            c_time_records.push_back(c_spend_time);
            ave_path_records.push_back(each_nodes_path_ave);
            output_file(file_name_ct, type_record, c_time_records);
            output_file(file_name_ave_path, type_record, ave_path_records);

        }

    }

};


int main( void ){

            const int a = 3; // I promisse i won't change a
        int *ptr;
        ptr = (int*)( &a );

        printf( "A=%d\n", a );
        *ptr = 5; // I'm a liar, a is now 5
        printf( "A=%d\n", a );

        *((int*)(&a)) = 6;
        printf( "A=%d\n", a );

        printf( "A=%d\n", a );

    return(0);

}

