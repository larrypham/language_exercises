#include <stdlib.h>
#import "BinarySearchTree.h"
 
int main(void)
{
    BinarySearchTree *bst = [BinarySearchTree new];

    int i = 0;
    int s = 0;

    for (i = 0; i < 100; i++)
    {
        s = rand();
        [bst insert:(id)s];
        printf("Current size: %d\n\n", [bst getSize]);
        [bst find:(id)s];
    }

/*
    [bst insert:(id)5];
    printf("Current size: %d\n\n", [bst getSize]);
    [bst insert:(id)3];
    printf("Current size: %d\n\n", [bst getSize]);
    [bst insert:(id)9];
    printf("Current size: %d\n\n", [bst getSize]);
    [bst insert:(id)2];
    printf("Current size: %d\n\n", [bst getSize]);
    [bst insert:(id)4];
    printf("Current size: %d\n\n", [bst getSize]);
    [bst insert:(id)6];
    printf("Current size: %d\n\n", [bst getSize]);
    [bst remove:(id)5];
    printf("Current size: %d\n\n", [bst getSize]);
    [bst remove:(id)9];
    printf("Current size: %d\n\n", [bst getSize]);
    [bst remove:(id)2];
    printf("Current size: %d\n\n", [bst getSize]);
    [bst remove:(id)4];
    printf("Current size: %d\n\n", [bst getSize]);
*/

    return 0;
}
