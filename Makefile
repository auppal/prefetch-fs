PROGS=loop fusexmp_fh
CFLAGS+=-Wall -O0 -g -DHAVE_MCD=0
all: $(PROGS)

loop: loop.c circ.c
	$(CC) $(CFLAGS) $^ -o $@ `pkg-config fuse --cflags --libs` -pthread -ldb

fusexmp_fh: fusexmp_fh.c
	$(CC) $(CFLAGS) $^ -o $@ `pkg-config fuse --cflags --libs` -pthread

clean:
	$(RM) $(PROGS)

test:
	./loop mnt && ls -l mnt && cat mnt/loop

mount:
	./loop mnt

umount:
	fusermount -u mnt
