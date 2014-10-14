programs += nix-instantiate

nix-instantiate_DIR := $(d)

nix-instantiate_SOURCES := $(d)/nix-instantiate.cc $(d)/../libmain/shared.cc $(d)/../libmain/stack.cc

nix-instantiate_LIBS = libexpr libstore libutil libformat
