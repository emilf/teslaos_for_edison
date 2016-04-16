# Makefile for JamesM's kernel tutorials.
# The C and C++ rules are already setup by default.
# The only one that needs changing is the assembler 
# rule, as we use nasm instead of GNU as.

SOURCES=boot.o main.o

WARNINGS := -Wall -Wextra -pedantic -Wshadow -Wpointer-arith -Wcast-align \
            -Wwrite-strings -Wmissing-prototypes -Wmissing-declarations \
            -Wredundant-decls -Wnested-externs -Winline -Wno-long-long \
            -Wuninitialized -Wconversion -Wstrict-prototypes

CFLAGS=-nostdlib -nostdinc -fno-builtin -fno-stack-protector -ffreestanding -mcmodel=small -mno-red-zone -mno-mmx -mno-sse -mno-sse2 -fno-common -g -std=c99 $(WARNINGS)
LDFLAGS=-Tlink.ld
ASFLAGS=-felf64

CC=x86_64-elf-gcc.exe
LD=x86_64-elf-ld.exe

.PHONY: all clean

all: $(SOURCES) link

clean:
	-rm *.o kernel

link:
	$(LD) $(LDFLAGS) -o kernel $(SOURCES)

.s.o:
	nasm $(ASFLAGS) $<
