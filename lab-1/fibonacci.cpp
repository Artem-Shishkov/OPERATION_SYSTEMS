#include "fibonacci.h"

void fibonacci(int n, long long* m) {
    if (n <= 0) return;
    m[0] = 0;
    if (n == 1) return;
    m[1] = 1;
    for (int i = 2; i < n; ++i) {
        m[i] = m[i-1] + m[i-2];
    }
}