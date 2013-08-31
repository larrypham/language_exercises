#include <stdlib.h>
#import "BinarySearchTree.h"
 
int main(void)
{
    BinarySearchTree *bst = [BinarySearchTree new];

    int i = 0;
    int s = 0;

    for (i = 0; i < 10000; i++)
    {
        s = rand();
        [bst insert:(id)s];
        printf("Current size: %d\n\n", [bst getSize]);
        [bst find:(id)s];
    }

    return 0;
}
