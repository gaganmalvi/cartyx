#ifndef VGA_DRV_H
#define VGA_DRV_H

#include "../types.h"

#define VGA_ADDRESS 0xB8000
#define BUFSIZE 2200

uint16* vga_buffer;

#define NULL 0

enum vga_color {
    BLACK,
    BLUE,
    GREEN,
    CYAN,
    RED,
    MAGENTA,
    BROWN,
    GREY,
    DARK_GREY,
    BRIGHT_BLUE,
    BRIGHT_GREEN,
    BRIGHT_CYAN,
    BRIGHT_RED,
    BRIGHT_MAGENTA,
    YELLOW,
    WHITE,
};

#include "../io/keyboard.h"

#endif
