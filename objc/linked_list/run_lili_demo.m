#import <stdlib.h>
#import "LinkedList.h"
#import "LinkedListNode.h"

int main(int argc, char *argv[]) 
{
    LinkedList *lili = [LinkedList alloc];
    [lili insertFirst: (id)3];
    [lili insertFirst: (id)4];
    [lili insertFirst: (id)5];
    [lili insertFirst: (id)6];

    [lili removeFirst];
    [lili removeFirst];
    [lili removeFirst];
    [lili removeFirst];
    [lili removeFirst];
    [lili removeFirst];
    [lili removeFirst];

    [lili insertFirst: (id)6];
    return 0;
}
