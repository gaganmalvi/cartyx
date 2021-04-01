#include "drivers/display/vga.h"
#include "drivers/io/kb.h"

void kern_main()
{
  char ch = 0;
  //first init vga with fore & back colors
  init_vga(WHITE, BLACK);
  mainfunc();
  test_input();
}
