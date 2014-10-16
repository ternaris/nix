nix_perl_sources := \
  $(d)/lib/Nix/Store.pm \
  $(d)/lib/Nix/Manifest.pm \
  $(d)/lib/Nix/GeneratePatches.pm \
  $(d)/lib/Nix/SSH.pm \
  $(d)/lib/Nix/CopyClosure.pm \
  $(d)/lib/Nix/Config.pm.in \
  $(d)/lib/Nix/Utils.pm \
  $(d)/lib/Nix/Crypto.pm

nix_perl_modules := $(nix_perl_sources:.in=)

$(foreach x, $(nix_perl_modules), $(eval $(call install-data-in, $(x), $(perllibdir)/Nix)))

ifeq ($(perlbindings), yes)

  $(d)/lib/Nix/Store.cc: $(d)/lib/Nix/Store.xs
	$(trace-gen) xsubpp $^ -output $@

  libraries += Store

  Store_DIR := $(d)/lib/Nix

  Store_SOURCES := $(Store_DIR)/Store.cc

  Store_LIBS = libstore libutil

  #Store_LDFLAGS = /usr/lib/perl5/core_perl/CORE/msys-perl5_20.dll
  #Store_LDFLAGS = /usr/lib/perl5/5.14/i686-cygwin-threads-64int/CORE/cygperl5_14.dll
  archlib = $(shell perl -E 'use Config; print $$Config{archlib};')
  libperl = $(shell perl -E 'use Config; print $$Config{libperl};')
  Store_LDFLAGS = $(shell find ${archlib} -name ${libperl})

  Store_CXXFLAGS = \
    -I$(shell $(perl) -e 'use Config; print $$Config{archlibexp};')/CORE \
    -D_FILE_OFFSET_BITS=64

  Store_ALLOW_UNDEFINED = 1

  Store_FORCE_INSTALL = 1

  Store_INSTALL_DIR = $(perllibdir)/auto/Nix/Store

endif

clean-files += $(d)/lib/Nix/Config.pm $(d)/lib/Nix/Store.cc
