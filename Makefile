BINARY_TOOL = clang++
CC = $(BINARY_TOOL)
CXX = $(BINARY_TOOL)

MACRO = -D MACRODEF=true
CFLAGS = -g -fpic -fPIC
CXXFLAGS = -g -fpic -fPIC -std=c++11
LDFLAGS = -g

LDFLAGS += -I/home/cpp/include -L/home/cpp/libs -llog4cplus -liniparser -ltt -lrt -pthread

SOURCES = $(wildcard *.c) $(wildcard *.cpp)
OBJS := $(patsubst %.c, %.exe, $(wildcard *.c)) $(patsubst %.cpp, %.exe, $(wildcard *.cpp))
DEPES_C := $(patsubst %.c, %.d, $(wildcard *.c))
DEPES_CPP := $(patsubst %.cpp, %.d, $(wildcard *.cpp))
DEPES := $(DEPES_C) $(DEPES_CPP)

all: $(OBJS)
$(OBJS): %.exe: %.cpp
	$(CXX) $(MACRO) $(CXXFLAGS) $(LDFLAGS) $< -o $@
	cp $@ ../../bin

.PHONY: clean
clean:
	rm -f $(OBJS)
