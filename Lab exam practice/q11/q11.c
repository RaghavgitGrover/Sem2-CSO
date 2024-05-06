#include <stdio.h>

void solve(long long int n, long long int *arr, long long int *brr, long long int *ans);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[n], brr[n], ans[n + 1];
    for (int i = 0; i < n; i++) scanf("%lld", &arr[i]);
    solve(n, &arr[0], &brr[0], &ans[0]);
    for (int i = 1; i <= n; i++) printf("%lld ", ans[i]);
    return 0;
}

// 3
// 001
// Output: 3 5 5


// 9
// 010101010
// Output: 44 50 54 56 56 56 56 56 56