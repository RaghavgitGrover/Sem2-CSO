#include <stdio.h>

long long int solve(long long int arr[], long long int n);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[2*n + 1];
    for (long long int i = 0; i < 2*n + 1; i++) scanf("%lld", &arr[i]);
    long long int ans = solve(arr, 2*n + 1);
    printf("%lld", ans);
    return 0;
}
