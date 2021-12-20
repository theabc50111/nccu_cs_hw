#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <ctime>
#include <iostream>
#include <bits/stdc++.h>
#include <algorithm>
#include <vector>
#include <bitset>

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
class Hash
{
    private:
        int BUCKET;    // No. of buckets
        vector<int> rands;    //rand of hash (universal hash);
        list<int> *table;    // Pointer to an array containing buckets
        
        // hash function to map values to key
        int hash_function(int x) {    
            string binary = bitset<32>(x).to_string(); //to binary
            long r_part_decimal_sum=0;

            for(int i=0; i<4; i++)
            {
                char buffer[8];
                size_t length = binary.copy(buffer, 8, 24-(i*8));
                buffer[length]='\0';
                unsigned long part_decimal = bitset<32>(buffer).to_ulong();
                long r_part_decimal = rands[i]*part_decimal;
                r_part_decimal_sum += r_part_decimal;
            } 

            return (r_part_decimal_sum % BUCKET);
        }

    public:
        Hash(int b)    // Constructor
        {
            int prime=b;
            bool is_prime = true;

            for(int i=0 ; i<4 ; i++)    // generate four random number for hash function
            {
                rands.push_back(rand());
            }

            // find the next large prime of data quantity
            while(prime<2*b){
                for (int i = 2; i <= prime/2; ++i) 
                {
                    if (prime % i == 0) {
                        is_prime = false;
                        break;
                    }
                    is_prime = true;
                }
                if (is_prime){
                    break;
                }
                else
                {
                    prime++;
                }
            }

            this->BUCKET = prime;
            table = new list<int>[BUCKET];
        }  

        void insert(const T& key)
        {
            int index = hash_function(key);
            table[index].push_back(key);
            // if (!(this->search(key)))
            // {
            //     table[index].push_back(key);
            // }
        }

        bool search(const T& key)
        {
            int index = hash_function(key);
            for (auto x : table[index])
            {
                cout << "index is " << index << ", key is " << key << ", x is " << x << endl;
                if (key==x)
                {
                    return true; 
                }
            }
            return false;
        }

        void displayHash() 
        {
            for (int i = 0; i < BUCKET; i++) 
            {
                cout << i;
                for (auto x : table[i])
                {
                    cout << " --> " << x;
                }
                cout << endl;
            }
        }
};


void test_hash(string file_name_it, string file_name_st, string type_record)
{
    int var_range = 5; // the range of variable in skip list 
    int min_data_qty = 4; // set the min amount of imput data
    int max_data_qty = 4; // set the max amount of imput data
    clock_t i_begin_time, i_end_time, s_begin_time, s_end_time;
    vector<double> i_time_records, s_time_records;
    vector<int> search_data = gen_rand_array(100, var_range); // generate search data

    for (int data_qty=min_data_qty; data_qty<=max_data_qty; data_qty++)
    {
        cout << "start test hash table insert & search\n";
        Hash<int> ht(pow(2,data_qty));
        vector<int> data = gen_rand_array(pow(2,data_qty),var_range);

        i_begin_time = clock();
        for (int data_ind=0; data_ind<data.size(); data_ind++)
        {
            ht.insert(data[data_ind]);
        }
        i_end_time = clock();

        s_begin_time = clock();
        for (int s_data_ind=0; s_data_ind<search_data.size(); s_data_ind++)
        {
            bool res = ht.search(search_data[s_data_ind]);
            (res == false)? cout << search_data[s_data_ind] <<" is not found\n" : cout << search_data[s_data_ind] << " found\n";
        }
        s_end_time = clock();

        double i_spend_time = (double)(i_end_time-i_begin_time) / CLOCKS_PER_SEC;
        double s_spend_time = (double)(s_end_time-s_begin_time) / CLOCKS_PER_SEC;
        cout << "K=" << data_qty << ", insert time: " << i_spend_time << ". search time: " << s_spend_time << endl;
        i_time_records.push_back(i_spend_time);
        s_time_records.push_back(s_spend_time);
        output_file(file_name_it, type_record, i_time_records);
        output_file(file_name_st, type_record, s_time_records);
        ht.displayHash();
    }

}

// Driver Program to test above functions
int main()
{

    test_hash("test_ht_i.csv", "test_ht_s.csv", "hash table");

	return 0;
}
