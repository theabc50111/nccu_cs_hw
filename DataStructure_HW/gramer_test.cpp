#include <iostream>
#include <vector>
#include <bitset>
#include <string>
#include <random>


using namespace std;

int main()
{   
    string ht = "hash table", tr = "treap", sk = "skip list", sa = "sorted array";
    cout << ht.compare("hash table") << endl;
    cout << tr.compare("treap") << endl;
    cout << sk.compare("skip list") << endl;
    cout << sa.compare("sorted array") << endl;
    cout << ht.compare("treap") << endl;
    cout << tr.compare("hash table") << endl;
    cout << sk.compare("sorted array") << endl;
    cout << sa.compare("skip list") << endl;
    return 0;
}
