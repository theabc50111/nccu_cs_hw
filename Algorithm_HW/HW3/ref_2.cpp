
// C++ program for weighted job scheduling using Naive Recursive Method
#include <iostream>
#include <algorithm>
using namespace std;
 
int temp[100];

// A job has start time, finish time and profit.
struct Job
{
    int start, finish, profit;
};
 
// A utility function that is used for sorting events
// according to finish time
bool jobComparator(Job s1, Job s2)
{
    return (s1.finish < s2.finish);
}
 
// Find the latest job (in sorted array) that doesn't
// conflict with the job[i]. If there is no compatible job,
// then it returns -1.
int latestNonConflict(Job arr[], int i)
{
    for (int j=i-1; j>=0; j--)
    {
        if (arr[j].finish <= arr[i-1].start)
            return j;
    }
    return -1;
}
 
// A recursive function that returns the maximum possible
// profit from given array of jobs.  The array of jobs must
// be sorted according to finish time.
int findMaxProfitRec(Job arr[], int n)
{
    // Base case
    if (n == 1) return arr[n-1].profit;
 
    // Find profit when current job is included
    int inclProf = arr[n-1].profit;
    int i = latestNonConflict(arr, n);
    if (i != -1)
      inclProf += findMaxProfitRec(arr, i+1);
 
    // Find profit when current job is excluded
    int exclProf = findMaxProfitRec(arr, n-1);

    temp[n-1] = max(inclProf,  exclProf);
    cout << "temp[" << n-1 << "] choose to : 『" << ((inclProf>exclProf) ? true:false) << "』 include no." << n-1 << " jobs(" << arr[n-1].start << "~" << arr[n-1].finish << "), and its profit is:" << arr[n-1].profit << ", so the max profit at " << n-1 << " round is:" << temp[n-1] << endl ;
 
    return max(inclProf,  exclProf);
}
 
// The main function that returns the maximum possible
// profit from given array of jobs
int findMaxProfit(Job arr[], int n)
{
    // Sort jobs according to finish time
    sort(arr, arr+n, jobComparator);

    cout << endl;
    for(int i =0; i<n; i++){
        cout << arr[i].start << "~" << arr[i].finish << endl;
    }
 
    return findMaxProfitRec(arr, n);
}
 
// Driver program
int main()
{
    int result;
    int n = 0;  
    scanf("%d",&n); // n = number of schedule
    Job arr[n]; 

    int i,j,date,s;  
    for(i=0;i<n;i++){
        scanf("%d",&s);  
        arr[i].start= s;  
        scanf("%d",&s);  
        arr[i].finish= s;  
        arr[i].profit = arr[i].finish - arr[i].start; // count start, end, duration of scheduled
        cout << "number" << i << "job:" << arr[i].start << "~" << arr[i].finish << " = " << arr[i].profit << endl;
    }
    result = findMaxProfit(arr, n);
    cout << "The optimal profit is " << result << endl;

    for (int i=0; i<100 ;i++){

        cout << temp[i] << ", ";
    }

    return 0;
}