#ifndef _Tree_H
struct Tree_node;
typedef struct Tree_node *Position;
typedef struct Tree_node *AVL_tree;
AVL_tree delete( ElementType X, AVL_tree T );
#endif

struct Tree_node
{
    ElementType key;
    AVL_tree parent;
    AVL_tree left;
    AVL_tree right;
    int height;
};


// Get height of the tree
int height(AVL_tree t)
{
    if (t == NULL)
        return 0;
    return t->height;
}

// Get Balance factor of node t
int getBalance(AVL_tree t)
{
    if (t == NULL)
        return 0;
    return height(t->left) - height(t->right);
}


/*
                y                               x
               / \     Right Rotation          /  \
              x   T3   – - – - – - – >        T1   y
             / \       < - - - - - - -            / \
            T1  T2     Left Rotation            T2  T3
*/
AVL_tree rightRotate(AVL_tree y)
{
    AVL_tree x = y->left;
    AVL_tree T2 = x->right;
 
    // Perform rotation
    x->right = y;
    y->left = T2;
 
    // Update heights
    y->height = max(height(y->left),
                    height(y->right)) + 1;
    x->height = max(height(x->left),
                    height(x->right)) + 1;
 
    // Return new root
    return x;
}
 
AVL_tree leftRotate(AVL_tree x)
{
    AVL_tree y = x->right;
    AVL_tree T2 = y->left;
 
    // Perform rotation
    y->left = x;
    x->right = T2;
 
    // Update heights
    x->height = max(height(x->left),
                    height(x->right)) + 1;
    y->height = max(height(y->left),
                    height(y->right)) + 1;
 
    // Return new root
    return y;
}

// binary search node
Position find( ElementType x, AVL_tree t )
{
    if( t == NULL)
        return NULL;
    if( x < t->key )
        return find( x, t->left );
    if( x > t->key )
        return find( x, t->right );
    else
        return t;
}



AVL_tree delete( ElementType x, AVL_tree t ){
    // binary search for x
    Position p = find(x);
    if (p == NULL){
        printf("Can't find data");
        return NULL;
    }
    
    // BST deletion
    if ( x < t->key )
        delete( x, t->left );
    else if ( x > t->key )
        delete( x, t->right );
    else if (t->right!=NULL && t->left!=NULL){       // for two children node
        Find the minimun m of T’s right subtree ;
        Replace t.key with m;
        free(m);
    }
    else {                                          // for sigle children node or leaf node 
        Adjusts t’s parent a pointer to bypass the node
        free(t);
    }


    // update height and balance
    t->height = 1 + max(height(t->left),height(t->right));
    int balance = getBalance(t); 

    // deletion might cause arbitrary frequency rotations
    while (balance>1 || balance<-1){

        // Left Left Case
        if (balance > 1 && getBalance(t->left)==1)
            return rightRotate(t);
    
        // Right Right Case
        if (balance < -1 && getBalance(t->right)==-1)
            return leftRotate(t);
    
        // Left Right Case
        if (balance > 1 && getBalance(t->left)==-1)
        {
            t->left = leftRotate(t->left);
            return rightRotate(t);
        }
    
        // Right Left Case
        if (balance < -1 && getBalance(t->right)==1)
        {
            t->right = rightRotate(t->right);
            return leftRotate(t);
        }

        // update height and balance
        t->height = 1 + max(height(t->left),height(t->right));
        int balance = getBalance(t); 
    }

    
    return t;
}
