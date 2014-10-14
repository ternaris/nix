programs += nix-daemon

nix-daemon_DIR := $(d)

nix-daemon_SOURCES := $(d)/nix-daemon.cc $(d)/../libmain/shared.cc $(d)/../libmain/stack.cc

nix-daemon_LIBS = libstore libutil libformat

ifeq ($(OS), SunOS)
        nix-daemon_LDFLAGS += -lsocket
endif

$(eval $(call install-symlink, nix-daemon, $(bindir)/nix-worker))
