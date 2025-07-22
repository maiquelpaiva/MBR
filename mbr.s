[BITS 16]
[ORG 0x7C00]

start:
    mov ah, 0x0
    mov al, 0x3
    int 0x10

    mov si, msg

print_loop:
    lodsb
    cmp al, 0
    je fim

    mov ah, 0x0E
    int 0x10
    jmp print_loop

fim:
    jmp $

msg db "Welcome to MyOS!", 0

times 510-($-$$) db 0
dw 0xAA55
