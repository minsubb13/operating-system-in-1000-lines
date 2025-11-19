#pragma once

// builtin features provided by the compiler (clang) itself
#define va_list   __builtin_va_list
#define va_start  __builtin_va_start
#define va_end    __builtin_va_end
#define va_arg    __builtin_va_arg

void printf(const char *fmt, ...);