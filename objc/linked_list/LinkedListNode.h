#import <objc/Object.h>

@interface LinkedListNode : Object {
  LinkedListNode *previous;
  LinkedListNode *next;
  id value;
}

-(id) init: (id) _v;

-(id) getPrev;
-(id) getNext;
-(id) getValue;

-(void) setPrev:  (id) _p;
-(void) setNext:  (id) _n;
-(void) setValue: (id) _v;

@end
