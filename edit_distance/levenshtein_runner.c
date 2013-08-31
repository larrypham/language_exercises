#include <stdio.h>
#include "levenshtein_distance.h"

int main(int argc, char *argv[])
{
    int ld = levenshtein_distance("Joshua", "Joshubaa");
    printf("Levenshtein distance: %d", ld);
    return 0;
}
