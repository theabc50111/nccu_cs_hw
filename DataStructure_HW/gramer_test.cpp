// C++ code
#include <iostream>
#include <string>
#include <queue>

using std::string;
using std::cout;
using std::endl;

class BST;
class TreeNode{
private:
    TreeNode *leftchild;
    TreeNode *rightchild;
    TreeNode *parent;
    int key;
    string element;
public:
    TreeNode():leftchild(0),rightchild(0),parent(0),key(0),element(""){};
    TreeNode(int a, string b):leftchild(0),rightchild(0),parent(0),key(a),element(b){};

    int GetKey(){return key;}              // 為了在main()要能夠檢視node是否正確
    string GetElement(){return element;}   // 才需要這兩個member function讀取private data

    // 其餘情況, 因為class BST是class TreeNode的friend class
    // 在class BST的member function中, 可以直接存取class TreeNode的private data

    friend class BST;   // 放在 private 或 public 都可以 
};

class BST{
private:
    TreeNode *root;
    TreeNode* Leftmost(TreeNode *current);
    TreeNode* Successor(TreeNode *current);
public:
    BST():root(0){};    

    TreeNode* Search(int key);
    void InsertBST(int key, string element);
};

TreeNode* BST::Search(int KEY){

    TreeNode *current = root;               // 將curent指向root作為traversal起點

    while (current != NULL && KEY != current->key) {  // 兩種情況跳出迴圈：
                                                      // 1.沒找到 2.有找到
        if (KEY < current->key){                      
            current = current->leftchild;   // 向左走
        }
        else {
            current = current->rightchild;  // 向右走
        }
    }
    return current;
}

// C++ code
void BST::InsertBST(int key, string element){

    TreeNode *y = 0;        // 準新手爸媽
    TreeNode *x = 0;        // 哨兵
    TreeNode *insert_node = new TreeNode(key, element);   // insert_node為將要新增的node

    x = root;
    while (x != NULL) {                 // 在while中, 以如同Search()的方式尋找適當的位置       
        y = x;                          // y先更新到原來x的位置
        if (insert_node->key < x->key){ // 判斷x是要往left- 還是right- 前進
            x = x->leftchild;
        }
        else{
            x = x->rightchild;
        }
    }                                   // 跳出迴圈後, x即為NULL
                                        // y即為insert_node的parent
    insert_node->parent = y;            // 將insert_node的parent pointer指向y

    if (y == NULL){                     // 下面一組if-else, 把insert_node接上BST
        this->root = insert_node;
    }
    else if (insert_node->key < y->key){
        y->leftchild = insert_node;
    }
    else{
        y->rightchild = insert_node;
    }
}




int main() {

    BST T;

    T.InsertBST(8,"龜仙人");
    T.InsertBST(1000,"悟空");
    T.InsertBST(2,"克林");
    T.InsertBST(513,"比克");


    // cout << "Inorder Traversal:\n";
    // T.InorderPrint();
    // cout << endl;
    // cout << "Level-order Traversal:\n";
    // T.Levelorder();
    // cout << endl << endl;

    TreeNode *node = T.Search(1000);
    if(node != NULL){
        cout << "There is " << node->GetElement() << "(" << node->GetKey() << ")" << endl;
    }
    else {
        cout << "no element with Key(1000)" << endl;
    }

    node = T.Search(73);
    if(node != NULL){
        cout << "There is " << node->GetElement() << "(" << node->GetKey() << ")" << endl;
    }
    else {
        cout << "no element with Key(73)" << endl;
    }

    return 0;
}