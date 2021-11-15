#include <iostream>
#include <cstdlib>
#include <cmath>

static unsigned int seed = 0; // 隨機種子


bool randomVal(float threshold){
            if (seed == 0)
                seed = (unsigned)time(NULL);

            srand(seed);
            float K= (float)rand()/RAND_MAX;  // 得到一個0~1 之間的數值
            seed = rand();
            if (K > threshold)
                return true;
            else
                return false;
};

int main() {
    float exp = 0;
    for (int i=1; i<=1000; i++){
        exp += pow(0.9,i)*i;
    }
    std::cout << exp << std::endl;

    int a = 0;
    while (randomVal(0.1)){
        a += 1;
    }
    std::cout << a << std::endl;
    
    return 0;
}
