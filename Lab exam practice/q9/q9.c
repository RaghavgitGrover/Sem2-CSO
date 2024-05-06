#include <stdio.h>

int solve(long long int n, long long int sum, long long int *arr);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[n];
    for (int i = 0; i < n; i++) scanf("%lld", &arr[i]);
    long long int ans = solve(n, ((n+1)*n) / 2, &arr[0]);
    printf("%lld", ans);
    return 0;
}

// 3
// 2 1 0
// Output: 3

// 4
// 3 4 -1 1
// Output: 2

// 4
// 1 2 3 4
// Output: 5

// 6
// -6 -5 -4 -3 -2 2
// Output: 1