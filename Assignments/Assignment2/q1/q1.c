#include <stdio.h>

long long int solve(long long int n, long long int l, long long int r, long long int *arr);

int main() {
    long long int n, l, r;
    scanf("%lld %lld %lld", &n, &l, &r);
    long long int arr[n];
    for (long long int i = 0; i < n; i++) scanf("%lld", &arr[i]);
    long long int ans = solve(n, l, r, &arr[0]);
    printf("%lld", ans);
    return 0;
}