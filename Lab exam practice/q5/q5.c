#include <stdio.h>

void solve(long long int n, long long int *arr);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[n];
    for (long long int i = 0; i < n; i++) scanf("%lld", &arr[i]);
    solve(n, &arr[0]);
    for (int i = 0; i < n; i++) printf("%lld ", arr[i]);
    return 0;
}

// 3
// 1 1 1
// Output: 1 1 1
// Passed

// 4
// 0 1 0 0
// Output: 0 0 0 1
// Passed

// 5
// 0 1 1 0 1
// Output: 0 0 1 1 1
// Passed

// 6
// 1 0 1 0 1 0
// Output: 0 0 0 1 1 1
// Passeds