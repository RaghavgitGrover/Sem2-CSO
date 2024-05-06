#include <stdio.h>
#include <stdlib.h>

long long int solve(long long int arr[], long long int result[], long long int n);

int main() {
    long long int n;
    scanf("%lld", &n);
    long long int arr[n], result[n];
    for (long long int i = 0; i < n; i++) {
        scanf("%lld", &arr[i]);
        result[i] = 1;
    }
    solve(arr, result, n);
    for (long long int i = 0; i < n; i++) printf("%lld ", result[i]);
    return 0;
}