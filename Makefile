#CC=aarch64-linux-gnu-gcc-9
CC=gcc
export $(dbus-launch)

all: server client

%.o: %.c
	$(CC) -Wall -c $< `pkg-config --cflags dbus-1`

server: server.o
	$(CC) server.o -o server `pkg-config --libs dbus-1`

client: client.o
	$(CC) client.o -o client `pkg-config --libs dbus-1`

.PHONY: clean
clean:
	rm -rf *.o server client

