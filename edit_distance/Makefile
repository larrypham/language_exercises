CC=gcc
OBJECTS=levenshtein_distance.o levenshtein_runner.o

all: $(OBJECTS)
	$(CC) $(OBJECTS) -o levenshtein

clean:
	rm -f $(OBJECTS) levenshtein

levenshtein_distance.o: levenshtein_distance.c
	$(CC) -c levenshtein_distance.c -o levenshtein_distance.o

levenshtein_runner.o: levenshtein_runner.c
	$(CC) -c levenshtein_runner.c -o levenshtein_runner.o
