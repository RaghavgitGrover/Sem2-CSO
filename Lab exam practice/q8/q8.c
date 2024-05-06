#include <stdio.h>

void solve(long long int n, long long int *arr);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[n];
    for (int i = 0; i < n; i++) scanf("%lld", &arr[i]);
    solve(n, &arr[0]);
    for (int i = 0; i < n; i++) printf("%lld ", arr[i]);
    return 0;
}

// 4
// 1 2 3 4
// Output: 2 1 4 3

// 2
// 1 2
// Output: 2 1

// 10
// 8 7 19 47 20 9 1 97 38 2
// Output: 2 1 8 7 19 9 38 20 97 47