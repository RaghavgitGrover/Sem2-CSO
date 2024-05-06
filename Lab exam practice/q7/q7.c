#include <stdio.h>

int solve (long long int n, long long int B, long long int *arr);

int main() {
    long long int n, B;
    scanf("%lld %lld", &n, &B);
    long long int arr[n];
    for (int i = 0; i < n; i++) scanf("%lld", &arr[i]);
    long long int ans = solve(n, B, &arr[0]);
    printf("%lld", ans);
    return 0;
}

// 5 3
// 5 -2 3 1 2
// Output: 8
// Passed

// 2 1
// 1 2
// Output: 2
// Passed

// 15 7
// 1 2 3 4 5 6 7 8 -9 -10 -11 -12 -13 -14 -15
// Output: 28
// Passed

// 5 0
// 1 2 3 4 5
// Output: 0
// Passed

// 7 7
// 11 -12 13 -14 15 -16 17
// Output: 14
// Passed