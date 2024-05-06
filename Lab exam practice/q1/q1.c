#include <stdio.h>

long long int solve(long long int m, long long int n, long long int s);

int main() {
    long long int m, n, s;
    scanf("%lld %lld %lld", &m, &n, &s);
    long long int ans = solve(m, n, s);
    printf("%lld", ans);
    return 0;
}

// 7 5 1
// Output: 12
// Passed

// 7 5 2
// Output: 2
// Passed

// 10 5 3
// Output: 2
// Passed

// 9 5 4
// Output: 59049
// Passed

// 9 5 5
// Output: 4
// Passed