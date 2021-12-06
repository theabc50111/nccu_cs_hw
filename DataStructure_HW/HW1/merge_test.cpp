// C++ code
#include <iostream>
#include <vector>
#include <random>
#include <ctime> 
#include <algorithm>    // std::merge, std::sort


using namespace std;


int main() {
    int front = 0, end = 7, mid=3;
    vector<int> v(8);
    vector<int> array = {12,25,10,5,8,21,7,10};

    vector<int> left_sub(array.begin()+front, array.begin()+mid+1), right_sub(array.begin()+mid+1, array.begin()+end+1);

    for (vector<int>::iterator it=left_sub.begin(); it!=left_sub.end(); ++it){
        cout << ' ' << *it;
    }
    cout << '\n';

    for (vector<int>::iterator it=right_sub.begin(); it!=right_sub.end(); ++it){
        cout << ' ' << *it;
    }
    cout << '\n';
    sort(array.begin()+front, array.begin()+mid+1);
    sort(array.begin()+mid+1, array.begin()+end+1);
    merge(array.begin()+front, array.begin()+mid+1, array.begin()+mid+1, array.begin()+end+1, v.begin());

    for (vector<int>::iterator it=v.begin(); it!=v.end(); ++it){
        cout << ' ' << *it;
    }
    cout << '\n';

}
