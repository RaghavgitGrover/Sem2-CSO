#include <stdio.h>

long long int solve(long long int n, long long int r);

int main() {
    long long int n, r;
    scanf("%lld %lld", &n, &r);
    long long int ans = solve(n, r);
    printf("%lld", ans);
}