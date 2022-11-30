CXX = g++
CXXFLAGS = -std=c++17
INCLUDEDIR = include
SRCDIR = src
OUTDIR = bin
CPPFLAGS = -I./include
DEPS = $(shell find $(SRCDIR) -type f -name '*.cc')
TARGETS = $(basename $(notdir $(wildcard src/*.cc)))
PROJECTNAME = Copyfile_Valeria_Bosch_Perez

default_target: all

all:
	make clean
	mkdir -p bin
	$(CXX) $(CXXFLAGS) $(USER_DEFINES) -o $(OUTDIR)/copyfile $(DEPS) $(CPPFLAGS)

.PHONY: all clean prepare

clean :
	rm -fr bin
	mkdir bin

tar:
