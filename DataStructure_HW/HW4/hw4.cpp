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
#include <limits.h>

#define PIC_WIDTH 2000
// const int NODE = 100;
// const int EDGE = 200;
const int NODE = 10;
const int EDGE = 12;
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


// A structure to represent a 
// node in adjacency list
struct AdjListNode{
    int dest;
    double weight;
    struct AdjListNode* next;
};
  
// A structure to represent 
// an adjacency list
struct AdjList{
      
   // Pointer to head node of list
   struct AdjListNode *head; 
};
  
// A structure to represent a graph. 
// A graph is an array of adjacency lists.
// Size of array will be V (number of 
// vertices in graph)
struct Graph{
    int V;
    struct AdjList* array;
};
  
// A utility function to create 
// a new adjacency list node
struct AdjListNode* newAdjListNode(int dest, double weight){
    struct AdjListNode* newNode = (struct AdjListNode*) malloc(sizeof(struct AdjListNode));
    newNode->dest = dest;
    newNode->weight = weight;
    newNode->next = NULL;
    return newNode;
}
  
// A utility function that creates 
// a graph of V vertices
struct Graph* createGraph(int V){
    struct Graph* graph = (struct Graph*) malloc(sizeof(struct Graph));
    graph->V = V;
  
    // Create an array of adjacency lists.  
    // Size of array will be V
    graph->array = (struct AdjList*) malloc(V * sizeof(struct AdjList));
  
    // Initialize each adjacency list 
    // as empty by making head as NULL
    for (int i = 0; i < V; ++i)
        graph->array[i].head = NULL;
  
    return graph;
}
  
// Adds an edge to an undirected graph
void addEdge(struct Graph* graph, int src, int dest, double weight){
    // Add an edge from src to dest.  
    // A new node is added to the adjacency
    // list of src.  The node is 
    // added at the beginning
    struct AdjListNode* newNode = newAdjListNode(dest, weight);
    newNode->next = graph->array[src].head;
    graph->array[src].head = newNode;
  
    // Since graph is undirected, 
    // add an edge from dest to src also
    newNode = newAdjListNode(src, weight);
    newNode->next = graph->array[dest].head;
    graph->array[dest].head = newNode;
}
  
// Structure to represent a min heap node
struct MinHeapNode{
    int  v;
    int dist;
};
  
// Structure to represent a min heap
struct MinHeap{
      
    // Number of heap nodes present currently
    int size;     
    
    // Capacity of min heap
    int capacity;  
    
    // This is needed for decreaseKey()
    int *pos;    
    struct MinHeapNode **array;
};
  
// A utility function to create a 
// new Min Heap Node
struct MinHeapNode* newMinHeapNode(int v, int dist){
    struct MinHeapNode* minHeapNode = (struct MinHeapNode*) malloc(sizeof(struct MinHeapNode));
    minHeapNode->v = v;
    minHeapNode->dist = dist;
    return minHeapNode;
}
  
// A utility function to create a Min Heap
struct MinHeap* createMinHeap(int capacity){
    struct MinHeap* minHeap = (struct MinHeap*) malloc(sizeof(struct MinHeap));
    minHeap->pos = (int *)malloc(
            capacity * sizeof(int));
    minHeap->size = 0;
    minHeap->capacity = capacity;
    minHeap->array =
         (struct MinHeapNode**) 
                 malloc(capacity * 
       sizeof(struct MinHeapNode*));
    return minHeap;
}
  
// A utility function to swap two 
// nodes of min heap. 
// Needed for min heapify
void swapMinHeapNode(struct MinHeapNode** a, struct MinHeapNode** b){
    struct MinHeapNode* t = *a;
    *a = *b;
    *b = t;
}
  
// A standard function to 
// heapify at given idx
// This function also updates 
// position of nodes when they are swapped.
// Position is needed for decreaseKey()
void minHeapify(struct MinHeap* minHeap, int idx){
    int smallest, left, right;
    smallest = idx;
    left = 2 * idx + 1;
    right = 2 * idx + 2;
  
    if (left < minHeap->size &&
        minHeap->array[left]->dist < 
         minHeap->array[smallest]->dist )
      smallest = left;
  
    if (right < minHeap->size &&
        minHeap->array[right]->dist <
         minHeap->array[smallest]->dist )
      smallest = right;
  
    if (smallest != idx)
    {
        // The nodes to be swapped in min heap
        MinHeapNode *smallestNode = 
             minHeap->array[smallest];
        MinHeapNode *idxNode = 
                 minHeap->array[idx];
  
        // Swap positions
        minHeap->pos[smallestNode->v] = idx;
        minHeap->pos[idxNode->v] = smallest;
  
        // Swap nodes
        swapMinHeapNode(&minHeap->array[smallest], 
                         &minHeap->array[idx]);
  
        minHeapify(minHeap, smallest);
    }
}
  
// A utility function to check if 
// the given minHeap is ampty or not
int isEmpty(struct MinHeap* minHeap){
    return minHeap->size == 0;
}
  
// Standard function to extract 
// minimum node from heap
struct MinHeapNode* extractMin(struct MinHeap* minHeap){
    if (isEmpty(minHeap))
        return NULL;
  
    // Store the root node
    struct MinHeapNode* root = 
                   minHeap->array[0];
  
    // Replace root node with last node
    struct MinHeapNode* lastNode = 
         minHeap->array[minHeap->size - 1];
    minHeap->array[0] = lastNode;
  
    // Update position of last node
    minHeap->pos[root->v] = minHeap->size-1;
    minHeap->pos[lastNode->v] = 0;
  
    // Reduce heap size and heapify root
    --minHeap->size;
    minHeapify(minHeap, 0);
  
    return root;
}
  
// Function to decreasy dist value 
// of a given vertex v. This function
// uses pos[] of min heap to get the
// current index of node in min heap
void decreaseKey(struct MinHeap* minHeap, int v, int dist){
    // Get the index of v in  heap array
    int i = minHeap->pos[v];
  
    // Get the node and update its dist value
    minHeap->array[i]->dist = dist;
  
    // Travel up while the complete 
    // tree is not hepified.
    // This is a O(Logn) loop
    while (i && minHeap->array[i]->dist < 
           minHeap->array[(i - 1) / 2]->dist)
    {
        // Swap this node with its parent
        minHeap->pos[minHeap->array[i]->v] = 
                                      (i-1)/2;
        minHeap->pos[minHeap->array[
                             (i-1)/2]->v] = i;
        swapMinHeapNode(&minHeap->array[i],  
                 &minHeap->array[(i - 1) / 2]);
  
        // move to parent index
        i = (i - 1) / 2;
    }
}
  
// A utility function to check if a given vertex
// 'v' is in min heap or not
bool isInMinHeap(struct MinHeap *minHeap, int v){
   if (minHeap->pos[v] < minHeap->size)
     return true;
   return false;
}
  
// A utility function used to print the solution
void printArr(double dist[], int n){
    printf("Vertex   Distance from Source\n");
    for (int i = 0; i < n; ++i)
        printf("%d \t\t %f\n", i, dist[i]);
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

double graph_arr[NODE][NODE] = {0};
struct Graph* graph_list = createGraph(NODE);

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
    memset(graph_arr, 0, sizeof(graph_arr[0][0]) * NODE * NODE); // reset

    // Create an array of adjacency lists.  
    // Size of array will be V
    graph_list->array = (struct AdjList*) malloc(NODE * sizeof(struct AdjList));
  
    // Initialize each adjacency list 
    // as empty by making head as NULL
    for (int i = 0; i < NODE; ++i) graph_list->array[i].head = NULL;

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
                addEdge(graph_list, src, dist, edge_weight);
            }
            for (int i=0; i<edges.size(); i++){
                if(insert_edge==edges[i]){
                    break;
                }
                if(i==(edges.size()-1)){
                    edges.push_back(insert_edge);
                    addEdge(graph_list, src, dist, edge_weight);
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
            cout<<"No." << k << " nodes\t\t\t"<<distance[k]<<endl;
        }
    }

    for(int i=0; i<NODE; i++) path_sum+=distance[i];

    return path_sum;
}

// The main function that calculates 
// distances of shortest paths from src to all
// vertices. It is a O(ELogV) function
double dijkstra_bin_heap(struct Graph* graph, int src, bool show_path_to_each){
      
    // Get the number of vertices in graph
    int V = graph->V;
    
    // dist values used to pick
    // minimum weight edge in cut
    double dist[V];     
  
    // minHeap represents set E
    struct MinHeap* minHeap = createMinHeap(V);
  
    double path_sum=0;    
    // Initialize min heap with all 
    // vertices. dist value of all vertices 
    for (int v = 0; v < V; ++v)
    {
        dist[v] = INT_MAX;
        minHeap->array[v] = newMinHeapNode(v, dist[v]);
        minHeap->pos[v] = v;
    }
  
    // Make dist value of src vertex 
    // as 0 so that it is extracted first
    minHeap->array[src] = 
          newMinHeapNode(src, dist[src]);
    minHeap->pos[src]   = src;
    dist[src] = 0;
    decreaseKey(minHeap, src, dist[src]);
  
    // Initially size of min heap is equal to V
    minHeap->size = V;
  
    // In the followin loop, 
    // min heap contains all nodes
    // whose shortest distance 
    // is not yet finalized.
    while (!isEmpty(minHeap)){
        // Extract the vertex with 
        // minimum distance value
        struct MinHeapNode* minHeapNode = 
                     extractMin(minHeap);
        
        // Store the extracted vertex number
        int u = minHeapNode->v; 
  
        // Traverse through all adjacent 
        // vertices of u (the extracted
        // vertex) and update 
        // their distance values
        struct AdjListNode* pCrawl =
                     graph->array[u].head;
        while (pCrawl != NULL)
        {
            int v = pCrawl->dest;
  
            // If shortest distance to v is
            // not finalized yet, and distance to v
            // through u is less than its 
            // previously calculated distance
            if (isInMinHeap(minHeap, v) && 
                      dist[u] != INT_MAX && 
              pCrawl->weight + dist[u] < dist[v])
            {
                dist[v] = dist[u] + pCrawl->weight;
  
                // update distance 
                // value in min heap also
                decreaseKey(minHeap, v, dist[v]);
            }
            pCrawl = pCrawl->next;
        }
    }
  
    // print the calculated shortest distances
    if(show_path_to_each){
        printArr(dist, V);
    }

    for(int i=0; i<V; ++i) path_sum+=dist[i];

    return path_sum;
}

void gen_strong_con_graph(bool draw, string pic_name){
    vector<vector<double>> coords;
    vector<unordered_set<int>> edges_vertex;
    cout << "Now generate a srtong connected graph with NODE: " << NODE << ", EDGE: " << EDGE << endl; 
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

void test(string  dijarr_file_n_ct, string  dijarr_file_n_ave_path, string  dijbh_file_n_ct, string dijbh_file_n_ave_path, string pic_name){
    vector<double> dijarr_c_time_records, dijbh_c_time_records;
    vector<double> dijarr_ave_path_records, dijbh_ave_path_records;
    double dijarr_each_nodes_path_sum=0, dijbh_each_nodes_path_sum=0;
    double dijarr_each_nodes_path_ave,  dijbh_each_nodes_path_ave;
    clock_t dijarr_c_begin_time, dijarr_c_end_time, dijbh_c_begin_time, dijbh_c_end_time;

    gen_strong_con_graph(true, pic_name);
    cout << "Start test with node number: " << NODE << ", EDGE: " << EDGE << endl;
    dijarr_c_begin_time = clock();
    for(int i=0; i<NODE; i++) dijarr_each_nodes_path_sum+= dijkstra_arr(graph_arr, i, true); 
    dijarr_each_nodes_path_ave = dijarr_each_nodes_path_sum/((NODE*(NODE-1))/2);
    dijarr_c_end_time = clock();
    dijbh_c_begin_time = clock();
    for(int i=0; i<NODE; i++) dijbh_each_nodes_path_sum += dijkstra_bin_heap(graph_list, i, true);
    dijbh_each_nodes_path_ave = dijbh_each_nodes_path_sum/((NODE*(NODE-1))/2);
    dijbh_c_end_time = clock();

    double dijarr_c_spend_time = (double)(dijarr_c_end_time-dijarr_c_begin_time) / CLOCKS_PER_SEC;
    double dijbh_c_spend_time = (double)(dijbh_c_end_time-dijbh_c_begin_time) / CLOCKS_PER_SEC;
    cout << "Number of nodes =" << NODE << "Number of EDGE =" << EDGE << endl;
    cout << "dijkstra in array counting time: " << dijarr_c_spend_time << ", dijkstra in array average path: " << dijarr_each_nodes_path_ave << endl;
    cout << "dijkstra in binary heap counting time: " << dijbh_c_spend_time << ", dijkstra in binary heap average path: " << dijbh_each_nodes_path_ave << endl;
    dijarr_c_time_records.push_back(dijarr_c_spend_time);
    dijarr_ave_path_records.push_back(dijarr_each_nodes_path_ave);
    dijbh_c_time_records.push_back(dijbh_c_spend_time);
    dijbh_ave_path_records.push_back(dijbh_each_nodes_path_ave);
    output_file(NODE, dijarr_file_n_ct, "dijkstra_arr", dijarr_c_time_records);
    output_file(NODE, dijarr_file_n_ave_path, "dijkstra_arr", dijarr_ave_path_records);
    output_file(NODE, dijbh_file_n_ct, "dijkstra_bin_heap", dijbh_c_time_records);
    output_file(NODE, dijbh_file_n_ave_path, "dijkstra_bin_heap", dijbh_ave_path_records);
}

int main(){

    if(NODE==10 && EDGE==12){
        test("dij_arr_10n_12e_ct.csv", "dij_arr_10n_12e_ap.csv", "dij_bin_heap_10n_12e_ct.csv", "dij_bin_heap_10n_12e_ap.csv", "graph_10n_12e.png");
    }
    else if(NODE==100 && EDGE==200){
        test("dij_arr_100n_200e_ct.csv", "dij_arr_100n_200e_ap.csv", "dij_bin_heap_100n_200e_ct.csv", "dij_bin_heap_100n_200e_ap.csv", "graph_100n_200e.png");
    }
    else if(NODE==100 && EDGE==500){
        test("dij_arr_100n_500e_ct.csv", "dij_arr_100n_500e_ap.csv", "dij_bin_heap_100n_500e_ct.csv", "dij_bin_heap_100n_500e_ap.csv", "graph_100n_500e.png");
    }
}
