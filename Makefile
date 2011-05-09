# Executables
CC = gcc
LINK = $(CC) $(LDFLAGS) $(CFLAGS) -o $@
COMPILE = $(CC) $(CFLAGS)

CFLAGS = -g -O2
LDFLAGS =

# Includes
DEFAULT_INCLUDES = -I.

# Objects
inform_OBJECTS = arrays.o asm.o bpatch.o chars.o directs.o errors.o expressc.o expressp.o files.o inform.o lexer.o linker.o memory.o objects.o states.o symbols.o syntax.o tables.o text.o veneer.o verbs.o

# Rules:

.SUFFIXES: .c .o .obj
.c.o:
	$(COMPILE) -MT $@ -MD -MP -c -o $@ $<;

.c.obj:
	$(COMPILE) -MT $@ -MD -MP -c -o $@ $<;

all: inform

inform: $(inform_OBJECTS)
	$(LINK) $(inform_OBJECTS)

inform.so: $(inform_OBJECTS)
	$(LINK) -shared $(inform_OBJECTS)

inform.dll: $(inform_OBJECTS)
	$(LINK) -shared $(inform_OBJECTS)

clean:
	$(RM) $(inform_OBJECTS)

.PHONY: all inform
