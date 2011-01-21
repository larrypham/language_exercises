#import "BinarySearchTreeNode.h"

@implementation BinarySearchTreeNode : Object

-(id)init: (id)_value
{
    if (self = [super init])
    {
        left = nil;
        right = nil;
        value = _value;
    }
    return self;
 
}

-(id) getLeft { return left; }
-(id) getRight { return right; }
-(id) getValue { return value; }
 
-(void) setLeft:  (id)_left { left = _left; }
-(void) setRight: (id)_right { right = _right; }
-(void) setValue: (id)_value { value = _value; }


@end
