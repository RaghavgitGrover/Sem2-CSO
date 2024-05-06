#include <stdio.h>

long long int solve(long long int m, long long int n);

int main() {
    long long int m, n;
    scanf("%lld %lld", &m, &n);
    long long int ans = solve(m, n);
    printf("%lld", ans);
    return 0;
}

// 7 5
// Output: 1
// Passed

// 24 39
// Output: 3
// Passed

// 210 955
// Output: 5
// Passed