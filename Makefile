MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

.SECONDEXPANSION:
.DELETE_ON_ERROR:


EXE_SRC := prog.c
SRC := $(EXE_SRC) fail.c

OBJ := $(SRC:%.c=%.o)
EXE := $(EXE_SRC:%.c=%)

CC := gcc
CFLAGS := $(if $(DEBUG),-DDEBUG) \
	-std=c99 -pedantic -g -Wall -Wextra -Werror \
	$(if $(STRICT),-Wunused,-Wno-unused)


all: $(EXE) $(EXTRA_EXE)

$(OBJ): $$(patsubst %.o,%.c,$$@)
	$(CC) $(CFLAGS) -c -o $@ $<

$(EXE) $(EXTRA_EXE):
	$(CC) -o $@ $^

$(EXE): $$@.o

clean:
	rm -f $(OBJ) $(EXE)


fail.o: common.h fail.h
prog.o: common.h fail.h

prog: fail.o prog.o


.DEFAULT_GOAL := all
.PHONY: all clean
