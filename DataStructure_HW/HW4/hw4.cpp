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
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <climits>

#define PIC_WIDTH 2000
const int NODE = 100;
const int EDGE = 200;
// const int NODE = 10;
// const int EDGE = 12;
// const int NODE = 20;
// const int EDGE = 48; 
// const int NODE = 30;
// const int EDGE = 109;
// const int NODE = 40;
// const int EDGE = 195;
// const int NODE = 50;
// const int EDGE = 307;

using namespace std;
using namespace cv;



class DrawPic {
    private:
        Mat img;

        void draw_circle( Mat img, Point center ){
            circle(img,center,PIC_WIDTH/(PIC_WIDTH/10) ,Scalar(0, 0, 255),FILLED,LINE_8);
        }

        void draw_line( Mat img, Point start, Point end ){
            int thickness = 2;
            int lineType = FILLED;
            line( img,start,end,Scalar( 0, 255, 0 ),thickness,lineType);
        }

    public:
        DrawPic(Mat x){
            this->img = x;
        }

        void draw_graph(vector<vector<double>> coords_mat, vector<unordered_set<int>> edges_vertex){
            for(auto &p : coords_mat){
                draw_circle(this->img, Point(p[0], p[1]));
            }
            for(auto &e : edges_vertex){
                vector<int> tmp;
                for (const auto &s : e) tmp.push_back(s);
                draw_line(this->img, Point(coords_mat[tmp[0]][0], coords_mat[tmp[0]][1]), Point(coords_mat[tmp[1]][0], coords_mat[tmp[1]][1]));
            }

        }

        void save_pic(string file_name){
            imwrite(file_name, this->img);
        }
};

double graph_arr[NODE][NODE] = {0};

void output_file(int n_node, string file_name, string type_record, vector<double> time_records){
    ofstream myfile;
    myfile.open (file_name);
    myfile << "n_node, " << type_record << "\n";
    myfile << "n_node=" << n_node << "," << time_records[0] << "," << "\n";
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

vector<unordered_set<int>> gen_rand_edge_graph(int n_edge, vector<vector<double>> coords_mat){
    vector<unordered_set<int>> edges;
    memset(graph_arr, 0, sizeof(graph_arr[0][0]) * NODE * NODE);
    int count=0;
    while(count<n_edge){
        srand(time(NULL));
        int src = (rand()%NODE);
        int dist = (rand()%NODE);
        double edge_weight = sqrt(pow((coords_mat[src][0]-coords_mat[dist][0]), 2) + pow((coords_mat[src][1]-coords_mat[dist][1]), 2));
        if(src!=dist && (edge_weight<800)){
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
    return edges; 
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
      dfs_traverse(0, vis, graph);
      for(int i = 0; i<NODE; i++) {
         if(!vis[i]) //if there is a node, not visited by traversal, graph is not connected
            return false;
      }
   }
   
   return true;
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

void gen_strong_con_graph(bool draw, string pic_name){
    vector<vector<double>> coords;
    vector<unordered_set<int>> edges_vertex;
    cout << "Now operate dijkstra in arry, NODE: " << NODE << ", EDGE: " << EDGE << endl; 
    int gen_count = 0;
    coords = gen_rand_coordinates(NODE, 1000, 300); 
    edges_vertex = gen_rand_edge_graph(EDGE, coords);

    while(!is_strong_connected(graph_arr)){
        edges_vertex = gen_rand_edge_graph(EDGE, coords);
        cout << "NO." << gen_count << " generate edges & graph" << endl;
        gen_count++;
    }

    if(draw){
        Mat canvas = Mat::zeros(PIC_WIDTH, PIC_WIDTH, CV_8UC3);
        DrawPic pic1(canvas);
        pic1.draw_graph(coords, edges_vertex);
        pic1.save_pic(pic_name);
    }
}

void test(string file_name_ct, string file_name_ave_path, string type_record, string pic_name){
    vector<double> c_time_records;
    vector<double> ave_path_records;
    double each_nodes_path_sum=0;
    double each_nodes_path_ave;
    clock_t c_begin_time, c_end_time;

    gen_strong_con_graph(true, pic_name);
    cout << "Start test with node number: " << NODE << ", EDGE: " << EDGE << endl;
    c_begin_time = clock();
    if(type_record.compare("dijkstra_arr")==0) {
        for(int i=0; i<NODE; i++) each_nodes_path_sum+= dijkstra_arr(graph_arr, i, true); 
        each_nodes_path_ave = each_nodes_path_sum/((NODE*(NODE-1))/2);
    }
    c_end_time = clock();

    double c_spend_time = (double)(c_end_time-c_begin_time) / CLOCKS_PER_SEC;
    cout << "Number of nodes =" << NODE << ", counting time: " << c_spend_time << ", average path: " << each_nodes_path_ave << endl;
    c_time_records.push_back(c_spend_time);
    ave_path_records.push_back(each_nodes_path_ave);
    output_file(NODE, file_name_ct, type_record, c_time_records);
    output_file(NODE, file_name_ave_path, type_record, ave_path_records);
}

int main(){

    if(NODE==10 && EDGE==12){
        test("dij_arr_10n_12e_ct.csv", "dij_arr_10n_12e_ap.csv", "dijkstra_arr", "graph_10n_12e.png");
    }
    else if(NODE==100 && EDGE==200){
        test("dij_arr_100n_200e_ct.csv", "dij_arr_100n_200e_ap.csv", "dijkstra_arr", "graph_100n_200e.png");
    }
    else if(NODE==100 && EDGE==500){
        test("dij_arr_100n_500e_ct.csv", "dij_arr_100n_500e_ap.csv", "dijkstra_arr", "graph_100n_500e.png");
    }
}
