# Sandbox build
cd ../
mkdir out
cp -r * out
cd out

# Assemble boot.s file
as --32 boot/boot.s -o boot.o

# Compile kernel.c file
gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

# Linking the kernel with kernel.o and boot.o files
ld -m elf_i386 -T boot/linker.ld kernel.o boot.o -o Cartyx.bin -nostdlib

# Check Cartyx.bin file is x86 multiboot file or not
grub-file --is-x86-multiboot Cartyx.bin

# Building the iso file
mkdir -p isodir/boot/grub
cp Cartyx.bin isodir/boot/Cartyx.bin
cp boot/grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o Cartyx.iso isodir

# Run it in qemu
qemu-system-x86_64 -cdrom Cartyx.iso
