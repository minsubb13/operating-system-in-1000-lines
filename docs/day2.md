# Day 2

## 05. Hello World!

### `register` keyword

It's a hint to the compiler that the variable will be heavily used and that you recommend it be kept in a processor register if possible

The `register` and `__asm__("register name")` used in each local variable declaration asks the compiler to place values in the specified registers. This is a common idiom in system call invocations

### `ecall` instruction

The `ecall` instruction is executed in inline assembly. When this is called, the CPU's execution mode switches from kernel mode (S-Mode) to OpenSBI mode (M-Mode), and OpenSBI's processing handler is invoked. Once it's done, it switches back to kernel mode, and execution resumes after the `ecall` instruction.

Instead of reimplementing hardware logic, Linux uses the SBI to "call" the firmware


### Cross-Architecture Comparison

All modern architectures employ a "Firmware Abstraction Layer" that operates at a higher privilege level than the OS.

- ARM64 (aarch64)
  Most similar to RISC-V
  - Firmware: TF-A (Trusted Firmware-A)

- x86-64 (Intel/AMD)
  This is conceptually similar but historically more complex
  - Firmware: UEFI (Unified Extensible Firmware Interface) / BIOS
  - Interface: ACPI (Advanced Configuration and Power Interface).

Linux is designed to run on top of the platform firmware. It treats the firmware as a trusted API provider. This separation ensures that the OS kernel remains portable and secure, delegating low-level hardware initialization and critical power management to the vendor-specific firmware layer.