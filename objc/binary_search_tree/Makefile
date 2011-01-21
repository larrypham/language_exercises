all: bst_test

bst_test: bst_test.m BinarySearchTreeNode.m BinarySearchTree.m
	gcc -x objective-c -Wno-import BinarySearchTreeNode.m BinarySearchTree.m bst_test.m -lobjc -o bst_test

clean:
	rm -f bst_test
