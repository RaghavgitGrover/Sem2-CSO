#include <stdio.h>

long long int solve(long long int n, char* str);

int main() {
    long long int n;
    scanf("%lld", &n);
    char str[n];
    for (int i = 0; i < n; i++) scanf(" %c", &str[i]);
    long long int ans = solve(n, str);
    printf("%lld", ans);
    return 0;
}