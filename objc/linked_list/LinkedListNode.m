#import "LinkedListNode.h"

@implementation LinkedListNode : Object

-(id)init: (id)_v
{
    if(self = [super init])
    {
      previous = nil;
      next = nil;
      value = _v;
    }
    return self;
}

-(id) getPrev  { return previous; }
-(id) getNext  { return next; }
-(id) getValue { return value; }

-(void) setPrev:  (id)_p { previous = _p; } 
-(void) setNext:  (id)_n { next = _n; } 
-(void) setValue: (id)_v { value = _v; } 

@end
