BITS 64

SECTION .text

GLOBAL _start

_start:
        PUSH    RBP
        MOV     RBP, RSP

        MOV     RAX, 60
        XOR     RDI, RDI
        SYSCALL

        LEAVE
        RET