#include <iostream>
#include <vector>
#include <random>
#include <ctime> 
#include <fstream>
#include <bits/stdc++.h>
#include <cstdlib> 

using namespace std;

vector<int> gen_rand_array(int arr_size){
    vector<int> ret_arr;
    random_device rd;  //Will be used to obtain a seed for the random number engine
    mt19937 gen(rd()); //Standard mersenne_twister_engine seeded with rd()
    uniform_int_distribution<> distrib(1, 1000);

    for (int i=0; i<arr_size; i++){
        ret_arr.push_back(distrib(gen));
    }
    
    return ret_arr;
}

void print_array(vector<int> &array){
    for (int i = 0; i < array.size(); i++) {
        cout << array[i] << " ";
    }
    cout << endl;
}

int main(){
    int arr_size = 10;
    vector<int> arr = gen_rand_array(arr_size);
    print_array(arr);

}