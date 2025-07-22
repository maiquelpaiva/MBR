ASM_FILE = mbr.s
BIN_FILE = mbr.bin
IMG_FILE = disk.img
MBR_SIZE = 512
DISK_SIZE = 2048
QEMU = qemu-system-i386

NASM_FLAGS = -f bin
DD_FLAGS = bs=512

QEMU_DRIVE_FLAGS = -drive file=$(IMG_FILE),format=raw

all: $(BIN_FILE) $(IMG_FILE)

$(BIN_FILE): $(ASM_FILE)
	nasm $(NASM_FLAGS) -o $(BIN_FILE) $(ASM_FILE)

$(IMG_FILE): $(BIN_FILE)
	dd if=/dev/zero of=$(IMG_FILE) bs=512 count=$(DISK_SIZE)
	dd if=$(BIN_FILE) of=$(IMG_FILE) $(DD_FLAGS) seek=0

run: $(IMG_FILE)
	$(QEMU) $(QEMU_DRIVE_FLAGS)

clean:
	rm -f $(BIN_FILE) $(IMG_FILE)

help:
	@echo "Comandos disponíveis:"
	@echo "  make        - Compila o código e cria a imagem do disco"
	@echo "  make run    - Compila e executa no QEMU"
	@echo "  make clean  - Limpa arquivos gerados (mbr.bin, disk.img)"
