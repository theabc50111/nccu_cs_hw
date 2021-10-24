#include <iostream>
#include <vector>
#include <random>
#include <ctime> 
#include <fstream>
#include <bits/stdc++.h>
#include <cstdlib> 
#include <algorithm>

using namespace std;

const int Max = 10000;

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

void output_file(char* file_name, char *sort_method, vector<double> avg_sort_time){
    ofstream myfile;
    myfile.open (file_name);
    myfile << "k, " << sort_method << "\n";
    for(int i=10; i<=30; i++){
        myfile << "k=" << i << "," << avg_sort_time[i-10] << "," << "\n";
    }
    myfile.close();
}

void merge(vector<int> &Array, int front, int mid, int end){

    // 利用 vector 的constructor,
    // 把array[front]~array[mid]放進 LeftSub[]
    // 把array[mid+1]~array[end]放進 RightSub[]
    vector<int> left_sub(Array.begin()+front, Array.begin()+mid+1), right_sub(Array.begin()+mid+1, Array.begin()+end+1);

    left_sub.insert(left_sub.end(), Max);      // 在LeftSub[]尾端加入值為 Max 的元素
    right_sub.insert(right_sub.end(), Max);    // 在RightSub[]尾端加入值為 Max 的元素

    int idx_left = 0, idx_right = 0;

    for (int i = front; i <= end; i++) {

        if (left_sub[idx_left] <= right_sub[idx_right] ) {
            Array[i] = left_sub[idx_left];
            idx_left++;
        }
        else{
            Array[i] = right_sub[idx_right];
            idx_right++;
        }
    }
}

void merge_sort(vector<int> &array, int front, int end){
                                         // front與end為矩陣範圍
    if (front < end) {                   // 表示目前的矩陣範圍是有效的
        int mid = (front+end)/2;         // mid即是將矩陣對半分的index
        merge_sort(array, front, mid);    // 繼續divide矩陣的前半段subarray
        merge_sort(array, mid+1, end);    // 繼續divide矩陣的後半段subarray
        merge(array, front, mid, end);   // 將兩個subarray做比較, 並合併出排序後的矩陣
    }
}

int partition_form1_void(vector<int> &array, int front, int end, char* func){
    return 0;
}

int partition_form2_void(vector<int> &array, int front, int end, int& eq_arr_head, int& eq_arr_tail, char* func){
    return 0;
}

int lomuto(vector<int> &array, int front, int end, char* func){
    if (strlen(func) != 0){
        for (int i=0; i<strlen(__func__); i++){
            func[i] = __func__[i];
        }
        return -1;
    }
    int pivot = array[end];
    int leq_pos=front-1;
    for (int gt_pos=front; gt_pos<= end-1; gt_pos++){
        if(array[gt_pos]<=pivot){
            leq_pos++;
            swap(array[leq_pos], array[gt_pos]);
        }
    }
    swap(array[leq_pos+1], array[end]);
    return (leq_pos+1);
}

int hoare(vector<int> &array, int front, int end, char* func){
    if (strlen(func) != 0){
        for (int i=0; i<strlen(__func__); i++){
            func[i] = __func__[i];
        }
        return -1;
    }
    int pivot = array[front];
    int leq_pos = front-1;
    int geq_pos = end+1;
    while (true){
        leq_pos++;
        while(array[leq_pos]<pivot){
            leq_pos++;
        } 
        geq_pos--;
        while(array[geq_pos]>pivot){
            geq_pos--;
        } 
        if (leq_pos>=geq_pos){
            return geq_pos;
        }
        swap(array[leq_pos],array[geq_pos]);
    }
}

int dutch_flag(vector<int> &array, int front, int end, int& eq_arr_head, int& eq_arr_tail, char* func){
    if (strlen(func) != 0){
        for (int i=0; i<strlen(__func__); i++){
            func[i] = __func__[i];
        }
        return -1;
    }

    int lt_pos = front;
    int gt_pos = end;
    int i = front; 
    int pivot = array[end];

    // To handle 2 elements
    if (gt_pos - lt_pos <= 1) {
        if (array[gt_pos] < array[lt_pos]){
            swap(array[gt_pos], array[lt_pos]);
        }
        eq_arr_head = lt_pos;
        eq_arr_tail = gt_pos;
        return 0;
    }
 
    while (i <= gt_pos){
        if (array[i] < pivot){
            swap(array[lt_pos++], array[i++]);
        }
        else if (array[i] == pivot){
            i++;
        }
        else if (array[i] > pivot){
            swap(array[i], array[gt_pos--]);
        }

    }
    eq_arr_head = lt_pos - 1;
    eq_arr_tail = gt_pos +1;
}

void quick_sort(vector<int> &array, int front, int end, int (*partition_form1)(vector<int>&, int, int, char*), int (*partition_form2)(vector<int>&, int, int, int&, int&, char*)){
    if (front<end){
        char func_name[50] = "func";
        int ret_func_name = partition_form1(array, -1, -1, func_name);
        if (ret_func_name != -1){
            int temp1, temp2;            
            partition_form2(array, -1, -1, temp1, temp2, func_name); 
        }
        if (strcmp(func_name, "hoare")==0){
            int sep_pos = partition_form1(array, front, end, "");
            quick_sort(array, front, sep_pos, partition_form1, &partition_form2_void);
            quick_sort(array, sep_pos+1, end, partition_form1, &partition_form2_void);
        }
        else if(strcmp(func_name, "lomuto")==0){
            int sep_pos = partition_form1(array, front, end, "");
            quick_sort(array, front, sep_pos-1, partition_form1, &partition_form2_void);
            quick_sort(array, sep_pos+1, end, partition_form1, &partition_form2_void);
        }
        else if (strcmp(func_name, "dutch_flag") == 0){
            int eq_arr_head, eq_arr_tail;
            partition_form2(array, front, end, eq_arr_head, eq_arr_tail, ""); 
            quick_sort(array, front,  eq_arr_head, &partition_form1_void, partition_form2);
            quick_sort(array, eq_arr_tail, end, &partition_form1_void, partition_form2);
        }
    }
    
}

void heap_sort(vector<int> &array){
    make_heap(array.begin(), array.end());
    sort_heap(array.begin(), array.end());
}

void unit_test(char mode[]){
    /* int arr_size = pow(2 ,10);
    vector<int> test_arr = gen_rand_array(arr_size); // use larger array */
    vector<int> test_arr({5,10,13,5,5,3,5,6,2,7,1,10,8,12,7,9,6,1,13,4});
    print_array(test_arr);
    if (strcmp(mode, "merge")==0){
        cout << "merge:\n"; 
        merge_sort(test_arr, 0, test_arr.size()-1);
        print_array(test_arr);
    }
    else if(strcmp(mode, "lomuto")==0){
        cout << "lomuto:\n"; 
        quick_sort(test_arr, 0, test_arr.size()-1, &lomuto, &partition_form2_void);
        print_array(test_arr);
    }
    else if(strcmp(mode, "hoare")==0){
        cout << "hoare:\n"; 
        quick_sort(test_arr, 0, test_arr.size()-1, &hoare, &partition_form2_void);
        print_array(test_arr);
    }
    else if(strcmp(mode, "dutch_flag")==0){
        cout << "dutch_flag:\n"; 
        quick_sort(test_arr, 0, test_arr.size()-1, &partition_form1_void, &dutch_flag);
        print_array(test_arr);
    }
    else if(strcmp(mode, "heap")==0){
        cout << "heap sort" << endl;
        heap_sort(test_arr);
        print_array(test_arr);
    }
}

int main() {
    char mode[] = "heap"; // choose "merge"/"lomuto"/"hoare"/"dutch_flag"/"heap" to change algorithm
    char file_name[] = "heap_records.csv"; // set output file name for records of each algorith
    unit_test(mode);
    clock_t a,b;
    vector<double> avg_sort_time;
    for(int pow_2=10; pow_2<=30; pow_2++){
        int arr_size = pow(2 ,pow_2);
        double loop_10_time=0;
        for(int _=0; _<10; _++){
            vector<int> array = gen_rand_array(arr_size);
            a = clock();
            if (strcmp(mode, "merge")==0){
                cout << "Using merge:\n";
                merge_sort(array, 0, arr_size-1);
            }
            else if (strcmp(mode, "lomuto")==0){
                cout << "Using lomuto:\n";
                quick_sort(array, 0, arr_size-1, &lomuto, &partition_form2_void);
            }
            else if (strcmp(mode, "hoare")==0){
                cout << "Using hoare:\n";
                quick_sort(array, 0, arr_size-1, &hoare, &partition_form2_void);
            }
            else if (strcmp(mode, "dutch_flag")==0){
                cout << "Using dutch_flag:\n";
                quick_sort(array, 0, arr_size-1, &partition_form1_void, &dutch_flag);
            }
            else if (strcmp(mode, "heap") == 0){
                cout << "Using heap:\n";
                heap_sort(array);
            }
            b = clock();
            double time = (double)(b-a) / CLOCKS_PER_SEC;
            loop_10_time += time;
            cout << "K=" << pow_2 << ", No" << _ << " time: " << time << ", sum of time:" << loop_10_time << endl;
            vector<int>().swap(array);
        }

        cout << "K=" << pow_2 << ", avg time: " << loop_10_time/10 << endl;
        avg_sort_time.push_back(loop_10_time/10);
        output_file(file_name, mode, avg_sort_time);
    }

    return 0;
}
