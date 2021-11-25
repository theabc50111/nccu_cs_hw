#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <ctime>
#include <iostream>
#include <bits/stdc++.h>
#include <algorithm>

using namespace std;



vector<int> gen_rand_array(int arr_size, int var_range){
    vector<int> ret_arr;
    random_device rd;  //Will be used to obtain a seed for the random number engine
    mt19937 gen(rd()); //Standard mersenne_twister_engine seeded with rd()
    uniform_int_distribution<> distrib(1, pow(2,var_range));

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

void output_file(string file_name, string type_record, vector<double> time_records){
    ofstream myfile;
    myfile.open (file_name);
    myfile << "k, " << type_record << "\n";
    for(int i=10; i<=30; i++){

        myfile << "k=" << i << "," << time_records[i-10] << "," << "\n";
    }
    myfile.close();
}

template<typename T>
class SortedArray
{
    public:

        void insert(const T& value)
        {
            this->arr.push_back(value);
            sort(this->arr.begin(), this->arr.end());
        }

        void print()
        {
            for (vector<int>::iterator it = this->arr.begin(); it != this->arr.end(); it++)
            {
                cout << *it << " ";
            }
            cout << endl;
        }

        void search(const T& value)
        {
            if (binary_search(this->arr.begin(), this->arr.end(), value))
            {
                cout << "found : " << value << endl;
            }
            else
            {
                cout << value << "not found.\n";
            }
        }

    private:
        vector<int> arr;
};

// Driver Program to test above functions
int main()
{
    SortedArray<int> t;
    t.insert(100);
    t.insert(200);
    t.insert(10);
    t.insert(100);
    t.insert(56);
    t.insert(77);
    t.insert(10);
    t.insert(76);
    t.insert(755);
    t.insert(100);
    t.print();
    t.search(100);
    t.search(77);
    t.search(1050);

	return 0;
}
