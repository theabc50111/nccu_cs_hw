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
        void insert(const T& val)
        {
            Node* curNode = Listhead;
            /* 向下走到最底層Level 1 */
            while (curNode->_down != nullptr){
                curNode = curNode->_down;
            }

            Node* curHead = curNode;
            curNode = Listhead;
            Node* newNode = nullptr;
            /* 尋找合適位置進行插入 */
            while (curNode->_right != nullptr)
            { 
                /* 待插入元素小於表中節點值，找到了合適位置 */
                while (curNode->_down != nullptr)
                {
                    if (curNode->_right == nullptr)
                    {
                        curNode = curNode->_down;
                    }
                    else
                    {
                        if (val < curNode->_right->_data)
                        {
                            curNode = curNode->_down;
                        }
                        else
                        {
                            curNode = curNode->_right;
                        }
                    }
                }


                if (val == curNode->_data) // 要是值相同的話就取消插入
                {
                    return;
                }
                else if (curNode->_right == nullptr)
                {
                    break;
                }
                else if (val < curNode->_right->_data)
                {
                    newNode = new Node(val);
                    newNode->_right = curNode->_right;
                    curNode->_right->_left = newNode;
                    curNode->_right = newNode;
                    newNode->_left = curNode; // 更新新節點的left指針
                    break;
                }
                /* 待插入元素等於表中節點值，不進行插入 */
                else if (val == curNode->_right->_data)
                {
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
            
            /* 限制升維最高到多少層，防止不斷升層，浪費空間，但是為了比較不同機率下的平均層數，先將max level 設為一個很大的數字*/
            int maxLevel = 10000;
            
            int curLevel = 1;
            /* 根據設定好的機率函數所產生的隨機值決定是否將該元素添加至跳躍層 */
            while (randomVal(p)){
                /* 跳躍表層數不能超過最大限制，防止不斷升層 */
                if (level > maxLevel){
                    return;
                }

                curLevel++;
                
                /* 是否要進行升維，此操作每添加一個元素最多執行一次 */
                if (level < curLevel){
                    level++; // 跳躍表的層數增加
                    Node* newHead = new Node();
                    newHead->_down = Listhead;
                    Listhead->_up = newHead; // 更新up結點
                    Listhead = newHead; // 使 Listhead 指向當前新結點
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
            if (K < proba) // 當小於proba時，就增加一層，proba 可以在建立skip list 的時候另外設定
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

        /* 計算有多少個list */
        int list_count(){
            int list_count = 0;
            Node* head = Listhead;
            while (head != nullptr){
                if (head->_down ==nullptr)
                {
                    Node* curNode = head->_right;
                    while (curNode != nullptr){
                        curNode = curNode->_right;
                        list_count += 1;
                    }
                }
                /* 跳到下一層 */
                head = head->_down;
            }
            return list_count;
        };

        /* 計算有多少個node */
        int node_count()
        {
                int node_count = 0;
                Node* head = Listhead;
                while (head != nullptr){
                    Node* curNode = head->_right;
                    while (curNode != nullptr){
                        curNode = curNode->_right;
                        node_count += 1;
                    }
                    /* 跳到下一層 */
                    head = head->_down;
                }
                return node_count;

        }

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

template<typename T>
class TreapNode
{
    public:
        int key, priority;
        TreapNode *left, *right;
        // C function to search a given key in a given BST
        TreapNode* search(TreapNode* root, const T& key)
        {
            // Base Cases: root is null or key is present at root
            if (root == NULL || root->key == key)
            return root;

            // Key is greater than root's key
            if (root->key < key)
            return search(root->right, key);

            // Key is smaller than root's key
            return search(root->left, key);
        }

        /* Recursive implementation of insertion in Treap */
        TreapNode* insert(TreapNode* root, const T& key)
        {
            // If root is NULL, create a new node and return it
            if (!root)
                return newNode(key);

            // If key is smaller than root
            if (key <= root->key)
            {
                // Insert in left subtree
                root->left = insert(root->left, key);

                // Fix Minama Heap property if it is violated
                if (root->left->priority < root->priority)
                    root = rightRotate(root);
            }
            else // If key is greater
            {
                // Insert in right subtree
                root->right = insert(root->right, key);

                // Fix Minima Heap property if it is violated
                if (root->right->priority < root->priority)
                    root = leftRotate(root);
            }
            return root;
        }
        /* Recursive implementation of Delete() */
        TreapNode* deleteNode(TreapNode* root, int key)
        {
            if (root == NULL)
                return root;

            if (key < root->key)
                root->left = deleteNode(root->left, key);
            else if (key > root->key)
                root->right = deleteNode(root->right, key);

            // IF KEY IS AT ROOT

            // If left is NULL
            else if (root->left == NULL)
            {
                TreapNode *temp = root->right;
                delete(root);
                root = temp; // Make right child as root
            }

            // If Right is NULL
            else if (root->right == NULL)
            {
                TreapNode *temp = root->left;
                delete(root);
                root = temp; // Make left child as root
            }

            // If ksy is at root and both left and right are not NULL
            else if (root->left->priority < root->right->priority)
            {
                root = leftRotate(root);
                root->left = deleteNode(root->left, key);
            }
            else
            {
                root = rightRotate(root);
                root->right = deleteNode(root->right, key);
            }

            return root;
        }

        // A utility function to print tree
        void inorder(TreapNode* root)
        {
            if (root)
            {
                inorder(root->left);
                cout << "key: "<< root->key << " | priority: %d "
                    << root->priority;
                if (root->left)
                    cout << " | left child: " << root->left->key;
                if (root->right)
                    cout << " | right child: " << root->right->key;
                cout << endl;
                inorder(root->right);
            }
        }

    private:
        /* T1, T2 and T3 are subtrees of the tree rooted with y
        (on left side) or x (on right side)
                 y							     x
                / \	     Right Rotation		    / \
               x   T3     – – – – – – – >	   T1  y
              / \	     < - - - - - - -	  / \
            T1   T2	     Left Rotation		T2   T3 */

        // A utility function to right rotate subtree rooted with y
        // See the diagram given above.
        TreapNode *rightRotate(TreapNode *y)
        {
            TreapNode *x = y->left, *T2 = x->right;

            // Perform rotation
            x->right = y;
            y->left = T2;

            // Return new root
            return x;
        }

        // A utility function to left rotate subtree rooted with x
        // See the diagram given above.
        TreapNode *leftRotate(TreapNode *x)
        {
            TreapNode *y = x->right, *T2 = y->left;

            // Perform rotation
            y->left = x;
            x->right = T2;

            // Return new root
            return y;
        }

        /* Utility function to add a new key */
        TreapNode* newNode(int key)
        {
            TreapNode* temp = new TreapNode;
            temp->key = key;
            temp->priority = rand();
            temp->left = temp->right = NULL;
            return temp;
        }
};


void test_skip_list_insert(float prob, string file_name_t, string file_name_l, string file_name_al, string type_record)
{
    int var_range = 30; // the range of variable in skip list 
    int min_data_qty = 10; // set the min amount of imput data
    int max_data_qty = 30; // set the max amount of imput data
    clock_t begin_time, end_time;
    vector<double> time_records;
    vector<double> list_records;
    vector<double> ave_level_records;

    for (int data_qty=min_data_qty; data_qty<=max_data_qty; data_qty++)
    {
        SkipList<int> sk;
        sk.p = prob;
        cout << "Test Skip List insert with probability :" << sk.p << endl;
        vector<int> data = gen_rand_array(pow(2,data_qty),var_range);
        // print_array(data);
        begin_time = clock();
        for (int data_ind=0; data_ind<data.size(); data_ind++)
        {
            sk.insert(data[data_ind]);
        }
        end_time = clock();
        double spend_time = (double)(end_time-begin_time) / CLOCKS_PER_SEC;
        int list_count = sk.list_count();
        int node_count = sk.node_count();
        cout << "K=" << data_qty << " time: " << spend_time << ", list number:" << list_count << ", node number:" << node_count << ", average level:" << (float) node_count/list_count << endl;
        time_records.push_back(spend_time);
        list_records.push_back(list_count);
        ave_level_records.push_back((float) node_count/list_count);
        output_file(file_name_t, type_record, time_records);
        output_file(file_name_l, type_record, list_records);
        output_file(file_name_al, type_record, ave_level_records);
        // sk.print();
    }

}

void test_treap_insert(string file_name, string type_record)
{
    int var_range = 30; // the range of variable in skip list 
    int min_data_qty = 10; // set the min amount of imput data
    int max_data_qty = 30; // set the max amount of imput data
    clock_t begin_time, end_time;
    vector<double> time_records;
	srand(time(NULL));

    for (int data_qty=min_data_qty; data_qty<=max_data_qty; data_qty++)
    {
        TreapNode<int> t;
        TreapNode<int> *root = nullptr;
        vector<int> data = gen_rand_array(pow(2,data_qty),var_range);
        begin_time = clock();
        for (int data_ind=0; data_ind<data.size(); data_ind++)
        {
            root = t.insert(root, data[data_ind]);
        }
        end_time = clock();
        double spend_time = (double)(end_time-begin_time) / CLOCKS_PER_SEC;
        // t.inorder(root);
        cout << "K=" << data_qty << " time: " << spend_time << endl;
        time_records.push_back(spend_time);
        output_file(file_name, type_record, time_records);
    }

}


int main(){
    // test_treap_insert("tr_time.csv","treap insert");
    // test_skip_list_insert(0.1, "sl_time_01.csv", "sl_list_number_01.csv", "sl_ave_layer_01.csv" , "Skip List_0.1");
    // test_skip_list_insert(0.5, "sl_time_05.csv", "sl_list_number_05.csv", "sl_ave_layer_05.csv" , "Skip List_0.5");
    test_skip_list_insert(0.9, "sl_time_09.csv", "sl_list_number_09.csv", "sl_ave_layer_09.csv" , "Skip List_0.9");

    return 0;
}

