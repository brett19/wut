LIBPATHS  := -L$(WUT_ROOT)/lib
CFLAGS    := -I$(WUT_ROOT)/include -fno-builtin -ffreestanding -Qn
CXXFLAGS  := $(CFLAGS)
LDFLAGS   := -nostdlib -T $(WUT_ROOT)/rules/rpl.ld -r -z common-page-size=64 -z max-page-size=64 -lcoreinit -lcrt
ELF2RPL   := $(WUT_ROOT)/bin/elf2rpl

include $(WUT_ROOT)/rules/base.mk

%.rpx: %.elf
	@echo "[RPX] $(notdir $@)"
	@$(ELF2RPL) $(BUILDDIR)/$(notdir $<) $@
