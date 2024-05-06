#include <stdio.h>
#include <string.h>

long long int solve(char str[], int n);

int main() {
    char str[100000];
    scanf("%s", str);
    long long int n = strlen(str);
    printf("%lld", solve(str, n));
    return 0;
}