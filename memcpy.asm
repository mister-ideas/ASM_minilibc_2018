BITS 64

SECTION .text

GLOBAL memcpy

memset:
    PUSH    RBP
    MOV     RBP, RSP

    XOR     RCX, RCX

fill_byte:
    CMP     RDX, RCX
    JZ      exit
    MOV     [RDI + RCX], SIL
    INC     RSI
    INC     RCX
    JMP     fill_byte

exit:
    MOV     RAX, RDI

    LEAVE
    RET