#include <iostream>
#include <vector>
#include <random>
#include <ctime> 
#include <fstream>
#include <bits/stdc++.h>
#include <cstdlib> 
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

template<typename T>
class SkipList{
    public:
        float p = 0.1;
        int seed = 0;
        SkipList() : level(1){ // constructor
            Listhead = new Node();
            nodeSum = 1;
        }
        /* 跳躍表的表銷燬 */
        ~SkipList(){ // destructor
            Node* head = Listhead;
            Node* delNode = nullptr;
            while (head != nullptr){
                /* 釋放本層元素 */
                Node* curNode = head->_right;
                while (curNode != nullptr){ 
                    delNode = curNode;
                    curNode = delNode->_right;
                    delete delNode;
                    delNode = nullptr;
                }
                
                /* 釋放頭節點，並使head指針指向下一層，準備釋放下一層的元素 */
                delNode = head;
                head = head->_down;
                delete delNode;
            }
        };
        
        /* 插入元素 */
        void insert(const T& val){
            Node* curNode = Listhead;
            /* 向下走到最底層Level 1 */
            while (curNode->_down != nullptr){
                curNode = curNode->_down;
            }

            Node* curHead = curNode;
            Node* newNode = nullptr;
            /* 尋找合適位置進行插入 */
            while (curNode->_right != nullptr)
            { 
                /* 待插入元素小於表中節點值，找到了合適位置 */
                if (val < curNode->_right->_data){
                    newNode = new Node(val);
                    newNode->_right = curNode->_right;
                    curNode->_right->_left = newNode;
                    curNode->_right = newNode;
                    newNode->_left = curNode; // 更新新節點的left指針
                    break;
                }
                /* 待插入元素等於表中節點值，不進行插入 */
                else if (val == curNode->_right->_data){
                    return;
                }
                curNode = curNode->_right; // 如果val> curNode => 更新 curNode
            }
            
            /* 遍歷到末節點也沒有合適位置，直接插入到鏈表末尾即可 */
            if (newNode == nullptr)
            {
                newNode = new Node(val);
                curNode->_right = newNode;
                newNode->_left = curNode;
            }
            
            /* 限制升維最高升一層，防止不斷升層，浪費空間 */
            int maxLevel = 30;
            
            int curLevel = 1;
            /* 根據拋硬幣產生的隨機值決定是否將該元素添加至跳躍層 */
            while (randomVal(p)){
                /* 跳躍表層數不能超過最大限制，防止不斷升層 */
                if (level > maxLevel){
                    cout << "meet max level:30" << endl;
                    return;
                }

                curLevel++;
                
                /* 是否要進行升維，此操作每添加一個元素最多執行一次 */
                if (level < curLevel){
                    level++; // 跳躍表的層數增加
                    Node* newHead = new Node();
                    newHead->_down = Listhead;
                    Listhead->_up = newHead; // 更新up結點
                    Listhead = newHead; // 使Listhead指向當前新結點
                }
                
                // curHead 升一層（要麼進行了升維，要麼本來層數就大於1）
                curHead = curHead->_up; 
                curNode = curHead;
                
                /* 將新插入的結點繼續添加到跳躍層中，搜尋算法與Level 1層相同 */
                Node* skipNode = nullptr;
                while (curNode->_right != nullptr){
                    if (val < curNode->_right->_data && skipNode == nullptr){
                        skipNode = new Node(val);
                        skipNode->_right = curNode->_right;
                        curNode->_right->_left = skipNode;

                        curNode->_right = skipNode;
                        skipNode->_left = curNode; // 更新left指針域
                    }
                    curNode = curNode->_right;
                }
                
                /* 該跳躍層沒有結點，即上述升維後的結果。將新結點添加到新產生的跳躍層 */
                if (skipNode == nullptr){
                    skipNode = new Node(val);
                    curNode->_right = skipNode;
                    skipNode->_left = curNode; // 更新left指針域
                }
                
                /**
                 * 將基礎層和跳躍層 或 跳躍層與跳躍層 中新插入的結點串聯起來
                 * newNode初始是Level 1層中新插入的結點
                 * 我們需要使newNode走向其值存在的最高層（垂直關係）
                 */
                while (newNode->_up != nullptr){
                    newNode = newNode->_up;
                }
                skipNode->_down = newNode; // 更新跳躍結點的down指針域
                newNode->_up = skipNode; // 更新newNode的up指針域

                // /* 保證在一層只有一個元素的情況下，不會再向上擴層 */
                // if (curHead->_right == skipNode){
                //     return;
                // }
            }
        };
        
        /* 刪除元素 */
        void remove(const T& val);
        
        /* 查詢元素 */
        bool search(const T& val){
        /* 從首層結點開始 */
            Node* preNode = Listhead;
            Node* curNode = preNode->_right;

            while (true){
                if (curNode != nullptr){
                    /* 要查詢的val大，在本層向右遍歷 */
                    if (curNode->_data < val){
                        preNode = curNode;
                        curNode = curNode->_right;
                        continue;
                    }
                    /* 找到要查詢的元素 */
                    else if (val == curNode->_data){
                        return true;
                    }
                }
                /* 判斷是否將所有層都遍歷完 */
                if (preNode->_down == nullptr){
                    return false;
                }
                
                /* 繼續向下層遍歷 */
                preNode = preNode->_down;
                curNode = preNode->_right;
            } 
        };
        
        /* 產生隨機值 */
        bool randomVal(float proba){
            if (seed == 0)
                seed = (unsigned)time(NULL);

            srand(seed);
            float K= (float)rand()/RAND_MAX;  // 得到一個0~1 之間的數值
            seed = rand();
            if (K < proba)
                return true;
            else
                return false;
        };
        
        /* 層序遍歷跳躍表 */
        void print(){
            cout << "level = " << level << endl;
            Node* head = Listhead;
            while (head != nullptr){
                Node* curNode = head->_right;
                while (curNode != nullptr){
                    cout << curNode->_data << " ";
                    curNode = curNode->_right;
                }
                cout << endl;
                /* 跳到下一層 */
                head = head->_down;
            }
        };
    private:
        struct Node{
            Node(T data = T())
                :_data(data)
                , _up(nullptr)
                ,_down(nullptr)
                , _left(nullptr)
                , _right(nullptr)
            {} // construcor of Node
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
    SkipList<int> sk_05;
    sk_05.p = 0.5;
    cout << "Now probability is :" << sk_05.p << endl;
    for (int arr_size=4; arr_size<=6; arr_size++)
    {
        vector<int> data = gen_rand_array(pow(2,arr_size),10);
        for (int data_ind=0; data_ind<data.size(); data_ind++)
        {
            sk_05.insert(data[data_ind]);
        }
        sk_05.print();
    }

    return 0;
}

