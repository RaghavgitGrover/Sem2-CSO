#include <stdio.h>

long long int solve(long long int n, long long int *arr, long long *brr);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[n], brr[n+1];
    for (int i = 0; i < n; i++) scanf("%lld", &arr[i]);
    for (int i = 0; i < n + 1; i++) brr[i] = 0;
    long long int ans = solve(n, &arr[0], &brr[0]);
    printf("%lld", ans);
    return 0;
}

// 3
// 2 1 0
// Output: 3
// Passed

// 4
// 3 4 -1 1
// Output: 2
// Passed

// 4
// 3 4 2 1
// Output: 5

// 6
// -6 -5 -4 -3 -2 2
// Output: 1
// Passed