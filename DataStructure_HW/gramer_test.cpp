#include <iostream>
#include <cstdlib>
#include <cmath>

static unsigned int seed = 0; // 隨機種子


/* 丟硬幣產生隨機值 */
bool randomVal(float p){
	if (seed == 0)
		seed = (unsigned)time(NULL);

	srand(seed);
	float K = (float)rand()/RAND_MAX;  // 兩種情況，正反兩面
	seed = rand();
	if (K > p)
		return true;
	else
		return false;
}

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
