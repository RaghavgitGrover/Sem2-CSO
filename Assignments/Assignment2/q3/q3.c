#include <stdio.h>

long long int evaluatePostfix(long long int n, char *s);

int main() {
    long long int n; 
    scanf("%lld", &n);
    n = n/2 + 1;
    char s[n];
    for (int i = 0; i < n; i++) scanf(" %c", &s[i]);
    long long int ans = evaluatePostfix(n, &s[0]);
    printf("%lld", ans);
    return 0;
}

// 5
// 7 3 -

// 9
// 8 4 / 2 -

// 13
// 3 5 + 7 2 -
