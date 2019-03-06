BITS 64

SECTION .text

GLOBAL memset

memset:
    PUSH    RBP
    MOV     RBP, RSP

    XOR     RCX, RCX
    MOV     RAX, RDI

fill_byte:
    CMP     [RDX], [RCX]
    JZ      exit
    MOV     [RDI], [RSI]
    INC     RDI
    INC     RCX
    JMP     fill_byte

exit:
    LEAVE
    RET
