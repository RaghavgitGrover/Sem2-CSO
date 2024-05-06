#include <stdio.h>

void solve(long long int n, long long int *arr);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[n];
    solve(n, &arr[0]);
    for (int i = 0; i < n; i++) printf("%lld ", arr[i]);
    return 0;
}

// 5
// Output: 1 2 -1 4 -2
// Passed

// 17
// Output: 1 2 -1 4 -2 -1 7 8 -1 -2 11 -1 13 14 -3 16 17
// Passed