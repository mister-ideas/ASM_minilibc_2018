BITS 64

SECTION .text

GLOBAL memset

memset:
    PUSH    RBP
    MOV     RBP, RSP

    XOR     RCX, RCX

fill_byte:
    CMP     RDX, RCX
    JZ      exit
    MOV     R8B, SIL
    MOV     BYTE [RDI + RCX], R8B
    INC     RCX
    JMP     fill_byte

exit:
    MOV     RAX, RDI

    LEAVE
    RET