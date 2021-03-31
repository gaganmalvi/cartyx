#include "include/display/vga_drv.h"
#include "include/display/vga_func.h"

void mainfunc();

void kern_main()
{
  //first init vga with fore & back colors
  init_vga(WHITE, BLACK);
  mainfunc();
}

void mainfunc()
{
  strprint("Welcome to Cartyx!");
  nline();
  strprint("==================");
  nline();
}
