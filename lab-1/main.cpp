#include <iostream>
#include "fibonacci.h"
using namespace std;

int main() {
    const int N = 20;
    long long m[N];
    fibonacci(N, m);
    for (int i = 0; i < N; ++i)
        cout << m[i] << " ";
    cout << endl;
}