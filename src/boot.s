;
; boot.s -- Kernel start location. Also defines multiboot header.
;           Based on Bran's kernel development tutorial file start.asm
;
[BITS 32]                       ; All instructions should be 32-bit.

[EXTERN __main]                   ; This is the entry point of our C code
[GLOBAL start]
start:
    cli                         ; Disable interrupts.
[BITS 64]
    call __main
    jmp $                       ; Enter an infinite loop, to stop the processor
                                ; executing whatever rubbish is in the memory
                                ; after our kernel!
