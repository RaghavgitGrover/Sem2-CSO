#include <stdio.h>

long long int solve(long long int n);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int ans = solve(n);
    if (ans) printf("TRUE");
    else printf("FALSE");
    // printf("%lld", ans);
    return 0;
}

// 1
// TRUE

// 0
// FALSE

// 2
// TRUE

// 145
// TRUE

// 40585
// TRUE

// 100
// FALSE

// 9999
// FALSE