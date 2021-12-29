
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

using namespace std;




vector<vector<double>> gen_rand_matrix(int arr_row, float mean, float std){
    unsigned seed = chrono::system_clock::now().time_since_epoch().count();
    default_random_engine generator (seed);
    normal_distribution<double> distribution(mean,std);

    // specify the default value to fill the vector elements
    int default_value = 10;
 
    // Using the fill constructor to initialize a two-dimensional vector
    // with a given default value
    vector<vector<double>> ret_matrix(arr_row, vector<double>(2, default_value));

    for (int i=0; i<arr_row; ++i) {
        double x = distribution(generator);
        double y = distribution(generator);
        ret_matrix[i][0] = x;
        ret_matrix[i][1] = y;
    }

    return ret_matrix;
}

void print_matrix(vector<vector<double>> &matrix){
    for (int i = 0; i < matrix.size(); i++) {
        cout << matrix[i][0] << "," << matrix[i][1] << " ";
    }
    cout << endl;
}

void output_file(string file_name, string type_record, vector<double> time_records){
    ofstream myfile;
    myfile.open (file_name);
    myfile << "k, " << type_record << "\n";
    for(int i=10; i<=30; i++){

        myfile << "k=" << i << "," << time_records[i-10] << "," << "\n";
    }
    myfile.close();
}



int main()
{
    const int n=10;  // number of experiments
    vector<vector<double>> vertex;
    vertex = gen_rand_matrix(5, 0, 2); 
    print_matrix(vertex);
	return 0;
}
