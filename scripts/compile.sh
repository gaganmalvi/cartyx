# Sandbox build
cd ../
mkdir out
cp -r * out
cd out

echo "Assembling boot.o..."

# Assemble boot.s file
as --32 boot/boot.s -o boot.o

echo "Building kernel..."

# Compile kernel.c file
gcc -m32 -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
gcc -m32 -c programs/*.c -o main.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
gcc -m32 -c drivers/*/*.c -o char.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

echo "Linking the kernel..."

# Linking the kernel with *.o files
ld -m elf_i386 -T boot/linker.ld kernel.o main.o char.o boot.o -o Cartyx.bin -nostdlib

# Check Cartyx.bin file is x86 multiboot file or not
grub-file --is-x86-multiboot Cartyx.bin

echo "Building Cartyx ISO image..."

# Building the iso file
mkdir -p isodir/boot/grub
cp Cartyx.bin isodir/boot/Cartyx.bin
cp boot/grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o Cartyx.iso isodir

# Run it in qemu
qemu-system-x86_64 -cdrom Cartyx.iso
