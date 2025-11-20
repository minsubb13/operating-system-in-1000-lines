#pragma once // let compiler compile only once

// __FINE__ and __LINE__ would show the file name and line number
// where PANIC is defined, not where it's called.
#define PANIC(fmt, ...) \
  do { \
    printf("PANIC: %s:%d: " fmt "\n", __FILE__, __LINE__, ##__VA_ARGS__); \
    while (1) {} \
  } while (0)

struct sbiret {
  long error;
  long value;
};
