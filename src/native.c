#include <string.h>
#include <stdlib.h>

char* encrypt(char *x, char *y) {
    char *z = malloc(strlen(x) + strlen(y) + 1);
    strcpy(z, x);
    strcat(z, y);
    return z;
}