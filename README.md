# MBR
A simple bootloader written in x86 Assembly.

## To compile the MBR and generate the disk image, simply run:
```bash
make
```

## To run the image in QEMU, use:
```bash
make run
```

## If you dont have QEMU in your linux, use:
```
sudo apt-get install qemu-system
```

## To clean up the generated files (such as mbr.bin and disk.img), use:
```bash
make clean
```
