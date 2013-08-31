#import "LinkedList.h"
#import "LinkedListNode.h"

@implementation LinkedList : Object

-(id) init {
    head = nil;
    return head;
}

-(id) insertFirst: (id) _new_value {
    if (head == nil)
    {
        head = [LinkedListNode alloc];
        [head setValue: _new_value];
        printf("Inserted %d at head of empty list.\n", (int) _new_value);
        return [head getValue];
    }
    else
    {
        LinkedListNode *new_head = [LinkedListNode alloc];
        [new_head setValue: _new_value];

        [head setPrev: new_head];
        [new_head setNext: head];
        head = new_head;
        printf("Inserted %d at head of list.\n", (int) [head getValue]);
        return [head getValue];
    }
}

-(id) insertLast: (id) _new_value {
}

-(id) removeFirst {
    if (head == nil)
        return nil;

    LinkedListNode *new_head = [head getNext];
    LinkedListNode *old_head = head;
    head = new_head;
    [head setPrev: nil];

    return [old_head getValue];
}

-(id) removeLast {
}

@end
