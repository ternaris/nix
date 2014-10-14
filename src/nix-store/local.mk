programs += nix-store

nix-store_DIR := $(d)

nix-store_SOURCES := $(wildcard $(d)/*.cc) $(d)/../libmain/shared.cc $(d)/../libmain/stack.cc

nix-store_LIBS = libstore libutil libformat

nix-store_LDFLAGS = -lbz2
