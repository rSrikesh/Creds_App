#include <string.h>
#include <stdlib.h>


#define SECUREKEY "y0u3c4ntf1ndth1skeyc0zits0s3cur3"

char* encrypt(char *x, char *y) {
    char *z = malloc(strlen(x) + strlen(y) + 1);
    strcpy(z, x);
    strcat(z, y);
    
    for (int i = 0; i < strlen(z); i++) {
        z[i] = z[i] ^ SECUREKEY[i % strlen(SECUREKEY)];
    }

    return z;
}