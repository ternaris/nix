programs += nix-hash

nix-hash_DIR := $(d)

nix-hash_SOURCES := $(d)/nix-hash.cc $(d)/../libmain/shared.cc $(d)/../libmain/stack.cc

nix-hash_LIBS = libstore libutil libformat
