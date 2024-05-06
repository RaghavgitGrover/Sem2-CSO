#include <stdio.h>

void solve(long long int* l, long long int x, long long int* ans1, long long int* ans2);

int main() {
    long long int n = 32;
    long long int l[n];
    for (int i = 0; i < n; i++) scanf("%lld", &l[i]);
    long long int x;
    scanf("%lld", &x);
    long long int ans1, ans2;
    solve(&l[0], x, &ans1, &ans2);
    printf("%lld %lld", ans1, ans2);
    return 0;
}