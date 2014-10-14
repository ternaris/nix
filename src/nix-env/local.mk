programs += nix-env

nix-env_DIR := $(d)

nix-env_SOURCES := $(wildcard $(d)/*.cc) $(d)/../libmain/shared.cc $(d)/../libmain/stack.cc

nix-env_LIBS = libexpr libstore libutil libformat
