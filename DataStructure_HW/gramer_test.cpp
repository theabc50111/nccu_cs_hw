#include <iostream>
#include <vector>
#include <bitset>
#include <string>
#include <random>
#include <chrono>

using namespace std;

int main(){
    const int n=10;  // number of experiments
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    default_random_engine generator (seed);
    normal_distribution<double> distribution(0.0,100.0);

    // specify the default value to fill the vector elements
    int default_value = 10;
 
    // Using the fill constructor to initialize a two-dimensional vector
    // with a given default value
    vector<vector<double>> vertex(n, vector<double>(2, default_value));

    for (int i=0; i<n; ++i) {
        double x = distribution(generator);
        double y = distribution(generator);
        vertex[i][0] = x;
        vertex[i][1] = y;
    }
   


  return 0;
}

