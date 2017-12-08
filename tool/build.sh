#! /bin/sh

mksquashfs ./root root_new.img -noappend -root-owned -comp xz -b 128k

./trx -o ac15.bin -m 100000000 -f kernel.bin -f root_new.img

mkimage -A arm -a 0x80000000 -e 0xc0008000 -C lzma -d ac15.bin ac15_new.bin
