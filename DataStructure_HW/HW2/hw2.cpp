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
    uniform_int_distribution<> distrib(1, pow(2,30));

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

/**
 *  SkipList的性質
 *  (1) 由很多層結構組成，level是通過一定的概率隨機產生的，基本是50%的產生機率。
 *  (2) 每一層都是一個有序的鏈表，默認是升序。
 *  (3) 最底層(Level 1)的鏈表包含所有元素。
 *  (4) 如果一個元素出現在Level i 的鏈表中，則它在Level i 之下的鏈表也都會出現。
 *  (5) 每個節點包含四個指針，但有可能爲nullptr。
 *  (6) 每一層鏈表橫向爲單向連接，縱向爲雙向連接。
 */
template<typename T>
class SkipList
{
public:
	SkipList() : level(1)
	{
		Listhead = new Node();
		nodeSum = 1;
	}
	/* 跳躍表的表銷燬 */
	~SkipList();
	
	/* 插入元素 */
	void insert(const T& val)
	
	/* 刪除元素 */
	void remove(const T& val)
	
	/* 查詢元素 */
	bool search(const T& val)
	
	/* 產生隨機值 */
	bool randomVal();
	
	/* 層序遍歷跳躍表 */
	void print();
private:
	struct Node
	{
		Node(T data = T())
			:_data(data)
			, _up(nullptr)
			,_down(nullptr)
			, _left(nullptr)
			, _right(nullptr)
		{}
		T _data;
		Node* _up;
		Node* _down;
		Node* _left;
		Node* _right;
	};
	Node* Listhead; // 跳躍表頭節點
	int level; // 跳躍表的層數
	int nodeSum; // 跳躍表的結點個數
};


int main(){

    return 0;
}