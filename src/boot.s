;
; boot.s -- Kernel start location. Also defines multiboot header.
;           Based on Bran's kernel development tutorial file start.asm
;
[BITS 32]                       ; All instructions should be 32-bit.

[EXTERN __main]                   ; This is the entry point of our C code
[GLOBAL start]
start:
    cli                         ; Disable interrupts.
    xor eax, eax
 
    ; Set up segment registers.
    mov ss, eax
    ; Set up stack so that it starts below start.
    mov esp, start
 
    mov ds, eax
    mov es, eax
    mov fs, eax
    mov gs, eax
    cld
 
    call CheckCPU                     ; Check whether we support Long Mode or not.
    jc .NoLongMode

[BITS 64]
    call __main
    jmp $                       ; Enter an infinite loop, to stop the processor
                                ; executing whatever rubbish is in the memory
                                ; after our kernel!
