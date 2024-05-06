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
// FALSE
// Passed

// 1
// TRUE
// Passed

// 2
// TRUE
// Passed

// 5
// FALSE
// Passed

// 7
// TRUE
// Passed