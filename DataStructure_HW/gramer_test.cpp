#include <iostream>
#include <vector>
#include <bitset>
#include <string>
#include <random>


using namespace std;

int main()
{
    int b = 99735;
    int prime=b;
    bool is_prime = true;

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

    cout << prime << "\n";
    return 0;
}
