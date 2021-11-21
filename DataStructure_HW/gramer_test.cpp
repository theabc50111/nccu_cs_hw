#include <fstream>
#include <iostream>

using namespace std;

int main()
{
    char file_name[] = "test_fstream.csv"; 
    ofstream out_file;
    out_file.open (file_name);
    out_file << "k, " << "test!!!!" << "\n";
    for(int i=10; i<=30; i++){
        out_file << "k=" << i << "," << i*100 << "," << "\n";
    }
    out_file.close();

    ifstream in_file(file_name, ifstream::in);
    string context;
    // while (in_file >> context)
    // {
    //     cout << "haha" << endl;
    //     cout << context << endl; 
    // }    

    out_file.open ("test2.csv");
    while (in_file >> context)
    {
        cout << "haha" <<endl;
        for(int i=10; i<=30; i++){
            out_file << "k=" << i << "," << i*100 << "," << context << "\n";
        }
    }    
    out_file.close();
    in_file.close();

    return 0;
}