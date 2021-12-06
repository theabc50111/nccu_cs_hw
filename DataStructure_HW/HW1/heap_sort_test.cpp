// range heap example
#include <iostream>     // std::cout
#include <algorithm>    // std::make_heap, std::pop_heap, std::push_heap, std::sort_heap
#include <vector>       // std::vector

using namespace std;

int main () {
  int myints[] = {8, 10,20,30,5,15};
  vector<int> v(myints,myints+5);

  cout << "before max heap   : " << v.front() << '\n';
  make_heap (v.begin(),v.end()); 

   cout << "final sorted range :";
    for (unsigned i=0; i<v.size(); i++)
        cout << ' ' << v[i];

    cout << '\n'; cout << "initial max heap   : " << v.front() << '\n';

//   pop_heap (v.begin(),v.end()); v.pop_back();
//   cout << "max heap after pop : " << v.front() << '\n';

//   v.push_back(99); push_heap (v.begin(),v.end());
//   cout << "max heap after push: " << v.front() << '\n';

  sort_heap (v.begin(),v.end());

  cout << "final sorted range :";
  for (unsigned i=0; i<v.size(); i++)
    cout << ' ' << v[i];

  cout << '\n';

  return 0;
}