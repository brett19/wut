OUTPUT_FORMAT("elf32-powerpc")
OUTPUT_ARCH(powerpc:common)

ENTRY(_start)

MEMORY {
   code     (rwx) : ORIGIN = 0x02000000, LENGTH = 224M
   data     (rw)  : ORIGIN = 0x10000000, LENGTH = 800M
   load     (rwx) : ORIGIN = 0xC0000000, LENGTH = 128M
}

SECTIONS {

   . = ORIGIN(code);
   
   .text ALIGN(32) : { *(.text .text.*) } > code
   
   . = ORIGIN(data);
   
   .sdata2 ALIGN(32) : {
      __sdata2_start = .;
      *(.sdata2 .sdata2.*)
	  __sdata2_end = .;
   } > data
   
   .rodata ALIGN(32) : { *(.rodata .rodata.*) } > data
   .data ALIGN(32) : { *(.data .data.*) } > data
   .bss ALIGN(32) : { *(.bss .bss.*) } > data
   
   
   .sdata ALIGN(32) : {
      __sdata_start = .;
      *(.sdata .sdata.*)
      __sdata_end = .;
   } > data
   
   .sbss ALIGN(32) : {
      __sbss_start = .;
      *(.sbss .sbss.*)
	  __sbss_end = .;
	  
	  __sbss2_start = .;
	  *(.sbss2 .sbss2.*)
	  __sbss2_end = .;
   } > data
   
   
   
   __SDATA_START__ = __sdata_start;
   __SBSS_END__ = __sbss_end;

   __SDATA2_START__ = __sdata2_start;
   __SBSS2_END__ = __sbss2_end;

   _SDA_BASE_ = __sbss_end;
   _SDA2_BASE_ = __sdata2_start + ((__sbss2_end - __sdata2_start) / 2);
}
