CC = gcc
LIBS = -lobjc
OBJECTS = LinkedList.o LinkedListNode.o

all: run_lili_demo

LinkedList.o: LinkedList.m LinkedList.h
	$(CC) -c LinkedList.m -o LinkedList.o

LinkedListNode.o: LinkedListNode.m LinkedListNode.h
	$(CC) -c LinkedListNode.m -o LinkedListNode.o

run_lili_demo: $(OBJECTS) run_lili_demo.m
	$(CC) $(OBJECTS) run_lili_demo.m -o run_lili_demo $(LIBS)

clean:
	rm -f $(OBJECTS) run_lili_demo
