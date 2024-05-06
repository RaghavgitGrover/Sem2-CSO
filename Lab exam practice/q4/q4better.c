#include <stdio.h>

long long int solve(long long int n);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int ans = solve(n);
    if (ans) printf("TRUE");
    else printf("FALSE");
    return 0;
}

// 0
// Output: TRUE
// Passed

// 1
// Output: TRUE
// Passed

// 2
// Output: TRUE
// Passed

// 69
// Output: FALSE
// Passed

// 13931
// Output: TRUE
// Passed