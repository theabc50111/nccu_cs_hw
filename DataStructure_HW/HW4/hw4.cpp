
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

#define PIC_WIDTH 2000
#define NODE 100
#define EDGE 1000

using namespace std;
using namespace cv;


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

vector<unordered_set<int>> gen_rand_edge_graph(int n_edge, vector<vector<double>> coords_mat){
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
      dfs_traverse(u, vis, graph);
      for(int i = 0; i<NODE; i++) {
         if(!vis[i]) //if there is a node, not visited by traversal, graph is not connected
            return false;
      }
   }
   
   return true;
}

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

int main(){
    vector<vector<double>> coords;
    vector<unordered_set<int>> edges_vertex;
    coords = gen_rand_coordinates(NODE, 1000, 200); 
    print_coords(coords);
    edges_vertex = gen_rand_edge_graph(EDGE, coords);

    while(!is_strong_connected(graph_arr)){
        edges_vertex = gen_rand_edge_graph(EDGE, coords);
    }
    Mat canvas = Mat::zeros(PIC_WIDTH, PIC_WIDTH, CV_8UC3);
    DrawPic pic1(canvas);
    pic1.draw_graph(coords, edges_vertex);
    pic1.save_pic("graph1.png");
    

	return 0;
}
