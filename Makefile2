CC=gcc

all: main

main: main.c
	$(CC) -o main main.c
	
test.o: test.c
	$(CC) -c test.c -o test.o
	
clean:
	rm main test test.o
