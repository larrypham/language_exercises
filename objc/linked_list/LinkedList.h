#import <objc/Object.h>
#import "LinkedListNode.h"

@interface LinkedList : Object {
  LinkedListNode *head;
}

-(id) init;
-(id) insertFirst: (id) _new_value;
-(id) insertLast: (id) _new_value;
-(id) removeFirst;
-(id) removeLast;

@end
