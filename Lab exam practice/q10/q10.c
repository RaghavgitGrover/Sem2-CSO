#include <stdio.h>

int solve(long long int n, long long int *arr);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[n], brr[n];
    for (int i = 0; i < n; i++) {
        scanf("%lld", &arr[i]);
        brr[i] = arr[i];
    }
    if (solve(n, &arr[0])) for (int i = 0; i < n; i++) printf("%lld ", arr[i]);
    else for (int i = 0; i < n; i++) printf("%lld ", brr[i]);
    return 0;
}

// 3
// 4 1 7
// Output: 1 4 7
// Passed

// 4
// 4 2 6 8
// Output: 4 2 6 8
// Passed

// 6
// 7 9 11 5 3 1
// Output: 7 9 11 5 3 1
// Passed

// 6
// 1 8 2 10 6 4
// Output: 1 2 4 6 8 10
// Passed