#import <objc/Object.h>

@interface BinarySearchTreeNode : Object {
    BinarySearchTreeNode *left;
    BinarySearchTreeNode *right;
    id value;
}

-(id) init: (id) _value;

-(id) getLeft;
-(id) getRight;
-(id) getValue;

-(void) setLeft:  (id)_left;
-(void) setRight: (id)_right;
-(void) setValue: (id)_value;

@end
