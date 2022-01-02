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
#include <limits.h>


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
    struct Graph* graph = (struct Graph*) 
            malloc(sizeof(struct Graph));
    graph->V = V;
  
    // Create an array of adjacency lists.  
    // Size of array will be V
    graph->array = (struct AdjList*) 
       malloc(V * sizeof(struct AdjList));
  
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
    struct MinHeapNode* minHeapNode =
           (struct MinHeapNode*) 
      malloc(sizeof(struct MinHeapNode));
    minHeapNode->v = v;
    minHeapNode->dist = dist;
    return minHeapNode;
}
  
// A utility function to create a Min Heap
struct MinHeap* createMinHeap(int capacity){
    struct MinHeap* minHeap =
         (struct MinHeap*) 
      malloc(sizeof(struct MinHeap));
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




int main( void ){
    // create the graph given in above fugure
    int V = 9;
    struct Graph* graph = createGraph(V);
    addEdge(graph, 0, 1, 4.1);
    addEdge(graph, 0, 7, 8.3);
    addEdge(graph, 1, 2, 8.4);
    addEdge(graph, 1, 7, 11.1);
    addEdge(graph, 2, 3, 7.9);
    addEdge(graph, 2, 8, 2.3);
    addEdge(graph, 2, 5, 4.7);
    addEdge(graph, 3, 4, 9.1);
    addEdge(graph, 3, 5, 14.5);
    addEdge(graph, 4, 5, 10.2);
    addEdge(graph, 5, 6, 2.6);
    addEdge(graph, 6, 7, 1.1);
    addEdge(graph, 6, 8, 6.2);
    addEdge(graph, 7, 8, 7.5);
  
    double ps = dijkstra_bin_heap(graph, 0, true);
  
    cout << ps << endl;
    return 0;
}

