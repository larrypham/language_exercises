#import <objc/Object.h>
#import "BinarySearchTreeNode.h"

#define MAX_SIZE 1000

@interface BinarySearchTree : Object {
    BinarySearchTreeNode *root_node;
}

-(id)init: (BinarySearchTreeNode *)_root_node;
-(id) insert: (id) o;
-(id) find: (id) o;
-(id) remove: (id) o;
-(BinarySearchTreeNode *) findMaxNode;
-(BinarySearchTreeNode *) findMinNode;
-(int) getSize;

@end
