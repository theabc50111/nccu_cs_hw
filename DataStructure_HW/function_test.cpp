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

#define NODE 100
#define EDGE 100
using namespace std;


double graph_arr[NODE][NODE] = {0};

void output_file(string file_name, string type_record, vector<double> time_records){
    ofstream myfile;
    myfile.open (file_name);
    myfile << "k, " << type_record << "\n";
    for(int i=10; i<=30; i++){

        myfile << "k=" << i << "," << time_records[i-10] << "," << "\n";
    }
    myfile.close();
}

vector<vector<double>> gen_rand_coordinates(int n_node, float mean, float std){
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    default_random_engine generator (seed);
    normal_distribution<double> distribution(mean,std);

    // specify the default value to fill the vector elements
    int default_value = 10;
 
    // Using the fill constructor to initialize a two-dimensional vector
    // with a given default value
    vector<vector<double>> ret_matrix(n_node, vector<double>(2, default_value));

    for (int i=0; i<n_node; ++i) {
        double x = distribution(generator);
        double y = distribution(generator);
        ret_matrix[i][0] = x;
        ret_matrix[i][1] = y;
    }

    return ret_matrix;
}

void print_coords(vector<vector<double>> &matrix){
    for (int i=0; i<matrix.size(); i++) {
        cout << matrix[i][0] << "," << matrix[i][1] << " | ";
    }
    cout << endl;
}

void gen_graph(int n_edge, vector<vector<double>> coords_mat){
    vector<unordered_set<int>> edges;
    // int graph[NODE][NODE] = {-1};
    int count=0;
    while(count<n_edge){
        srand(time(NULL));
        int src = (rand()%NODE);
        int dist = (rand()%NODE);
        if(src!=dist){
            unordered_set<int> insert_edge = {src, dist};
            if(edges.empty()){
                edges.push_back(insert_edge);
            }
            for (int i=0; i<edges.size(); i++){
                if(insert_edge==edges[i]){
                    break;
                }
                if(i==(edges.size()-1)){
                    edges.push_back(insert_edge);
                    count++;
                }
            }
        }
    }

    for(auto &e : edges){
        vector<int> tmp;
        for (const auto &s : e) tmp.push_back(s);
        double edge_weight = sqrt(pow((coords_mat[tmp[0]][0]-coords_mat[tmp[1]][0]), 2) + pow((coords_mat[tmp[0]][1]-coords_mat[tmp[1]][1]), 2));
        cout << edge_weight << endl ;
        graph_arr[tmp[0]][tmp[1]] = edge_weight;
        graph_arr[tmp[1]][tmp[0]] = edge_weight;
    }

    // for(auto &e : edges){
    //     for(const auto &s : e){
    //         cout << s << " "pow((coords_mat[tmp[0]][1]-coords_mat[tmp[1]][1]), 2);
    //     }
    //     cout << endl;
    // }
    // for(int i=0; i<NODE; i++){
    //     for(int j=0; j<NODE; j++){
    //         cout << graph_arr[i][j] << " ";
    //     }
    //     cout << endl;
    // }

}

void dfs_traverse(int u, bool visited[], double graph[][NODE]) {
   visited[u] = true; //mark v as visited
   for(int v = 0; v<NODE; v++) {
      if(graph[u][v]>0) {
         if(!visited[v])
            dfs_traverse(v, visited, graph);
      }
   }
   return ;
}

bool is_strong_connected(double graph[][NODE]) {
   bool *vis = new bool[NODE];
   //for all vertex u as start point, check whether all nodes are visible or not
   for(int u=0; u < NODE; u++) {
      for(int i = 0; i<NODE; i++){
         vis[i] = false; //initialize as no node is visited
      }
      dfs_traverse(u, vis, graph);
      for(int i = 0; i<NODE; i++) {
         if(!vis[i]) //if there is a node, not visited by traversal, graph is not connected
            return false;
      }
   }
   
   return true;
}


int main(){
    vector<vector<double>> coords;
    coords = gen_rand_coordinates(NODE, 0, 2); 
    gen_graph(EDGE, coords);

    while(!is_strong_connected(graph_arr)){
        gen_graph(EDGE, coords);
    }
    

	return 0;
}
