#import "BinarySearchTree.h"
#import "BinarySearchTreeNode.h"

@implementation BinarySearchTree : Object

-(id)init {
    root_node = nil;
    return self;
}

-(id)init: (BinarySearchTreeNode *)_root_node {
    root_node = _root_node;
    return self;
}


-(id) insert: (id) o {
    if (root_node == nil)
    {
        root_node = [[BinarySearchTreeNode alloc] init: o];
        printf("Inserted root node.\n");
    }
    else
    {
        BinarySearchTreeNode *current_node = root_node;
        BOOL inserted = NO;

        while(inserted == NO)
        {
            if ([current_node getValue] == o)
            {
                printf("Not root node. Equal value. Counting as insert.\n");
                inserted = YES;
            }
            else if (o < [current_node getValue])
            {
                if ([current_node getLeft] == nil)
                {
                    BinarySearchTreeNode *new_node = [[BinarySearchTreeNode alloc] init: o];
                    [current_node setLeft: new_node];
                    printf("Inserted leaf node %d on left.\n", (int)o);
                    inserted = YES;
                }
                else
                {
                    printf("Moving left from node %d.\n", (int)[current_node getValue]);
                    current_node = [current_node getLeft];
                }
            }
            else if (o > [current_node getValue])
            {
                if ([current_node getRight] == nil)
                {
                    BinarySearchTreeNode *new_node = [[BinarySearchTreeNode alloc] init: o];
                    [current_node setRight: new_node];
                    printf("Inserted leaf node %d on right.\n", (int)o);
                    inserted = YES;
                }
                else
                {
                    printf("Moving right from node %d.\n", (int)[current_node getValue]);
                    current_node = [current_node getRight];
                }
            }
        }
    }

    return o;
}

-(id) find:(id) o
{
    if (root_node == nil)
        return nil;

    id root_value = [root_node getValue];

    if (root_value == o)
        return root_node;
    else if (o < root_value)
    {
        printf("Jumping left.\n");
        BinarySearchTree *new_tree = [[BinarySearchTree alloc] init:[root_node getLeft]];
        return [new_tree find:o];
    }
    else if (o > root_value)
    {
        printf("Jumping right.\n");
        BinarySearchTree *new_tree = [[BinarySearchTree alloc] init:[root_node getRight]];
        return [new_tree find:o];
    }
    

}

// Returns new BinarySearchTreeNode that should be the new root.
-(id) remove: (id)o
{
    if (root_node == nil)
        return nil;

    id root_value = [root_node getValue];
    BinarySearchTreeNode *left = [root_node getLeft];
    BinarySearchTreeNode *right = [root_node getRight];

    // Base case: The current node is the one that needs to be removed.
    if (root_value == o)
    {
        if (left == nil && right == nil)
        {
            // TODO: Release this properly if it isn't already.
            printf("remove(): Removing singleton root %d.\n", (int)[root_node getValue]);
            root_node = nil;
            return root_node;
        }
        else if (left != nil && right == nil)
        {
            printf("remove(): Replacing %d with %d.\n", (int)[root_node getValue], (int)[left getValue]);
            root_node = left;
            return left;
        }
        else if (right != nil && left == nil)
        {
            printf("remove(): Replacing %d with %d.\n", (int)[root_node getValue], (int)[right getValue]);
            root_node = right;
            return root_node;
        }
        else if (right != nil && left != nil)
        {
            BinarySearchTree *left_subtree = [[BinarySearchTree alloc] init:left];
            BinarySearchTreeNode *left_maxnode = [left_subtree findMaxNode];

            id v = [left_maxnode getValue];
            printf("remove(): two children: Replacing %d with %d.\n", (int)[root_node getValue], (int)v);
            [root_node setValue:v];
            [root_node setLeft: [left_subtree remove:v]];
            return root_node;
        }

    }
    else if (o < root_value)
    {
        if (left == nil)
            return nil;

        BinarySearchTree *sub_tree = [[BinarySearchTree alloc] init:left];
        [root_node setLeft: [sub_tree remove:o]];
        return root_node;
    }
    else if (o > root_value)
    {
        if (right == nil)
            return nil;

        BinarySearchTree *sub_tree = [[BinarySearchTree alloc] init:right];
        [root_node setRight: [sub_tree remove:o]];
        return root_node;
    }
}

-(BinarySearchTreeNode *) findMaxNode
{
    if (root_node == nil)
        return nil;

    BinarySearchTreeNode *right = [root_node getRight];
    if (right == nil)
        return root_node;
    else
    {
        BinarySearchTree *sub_tree = [[BinarySearchTree alloc] init:right];
        return [sub_tree findMaxNode];
    }
}

-(BinarySearchTreeNode *) findMinNode
{
    if (root_node == nil)
        return nil;

    BinarySearchTreeNode *left = [root_node getLeft];
    if (left == nil)
        return root_node;
    else
    {
        BinarySearchTree *sub_tree = [[BinarySearchTree alloc] init:left];
        return [sub_tree findMinNode];
    }
}

-(int) getSize
{
    if (root_node == nil)
        return 0;
    else
    {
        BinarySearchTreeNode *left = [root_node getLeft];
        BinarySearchTreeNode *right = [root_node getRight];
        BinarySearchTree *left_subtree = [[BinarySearchTree alloc] init:left];
        BinarySearchTree *right_subtree = [[BinarySearchTree alloc] init:right];

        return 1 + [left_subtree getSize] + [right_subtree getSize];
    }
}

@end

