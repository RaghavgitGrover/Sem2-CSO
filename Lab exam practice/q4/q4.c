#include <stdio.h>

long long int solve(long long int n, long long int digits, long long int *arr);

int main() {
    long long int n, digits = 0;
    scanf("%lld", &n);
    for (long long int i = n; i > 0; i /= 10) digits++;
    long long int arr[digits];
    for (long long int i = 0; i < digits; i++) {
        arr[i] = n % 10;
        n /= 10;
    }
    long long int ans = solve(n, digits, &arr[0]);
    if (ans) printf("True");
    else printf("False");
    return 0;
}