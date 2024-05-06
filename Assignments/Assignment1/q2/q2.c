#include <stdio.h>

void solve(long long int arr[], long long int n);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[n];
    for (long long int i = 0; i < n; i++) scanf("%lld", &arr[i]);
    solve(arr, n);
    for (long long int i = 0; i < n; i++) printf("%lld ", arr[i]);
    return 0;
}