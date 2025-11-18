ENTRY(boot)

SECTIONS {
	. = 0x80200000;

  /* the code of the program */
	.text :{
		KEEP(*(.text.boot));
		*(.text .text.*);
	}

  /* constant data that is read-only */
	.rodata : ALIGN(4) {
		*(.rodata .rodata.*);
	}

  /* read/write data */
	.data : ALIGN(4) {
		*(.data .data.*);
	}

  /* read/write data with an initial value of zero */
	.bss : ALIGN(4) {
		__bss = .;
		*(.bss .bss.* .sbss .sbss.*);
		__bss_end = .;
	}

	. = ALIGN(4);
	. += 128 * 1024; /* 128KB */
	__stack_top = .;
}

