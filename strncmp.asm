BITS 64

GLOBAL strncmp

SECTION .text

strncmp:
    PUSH    RBP
    MOV     RBP, RSP

    XOR     RCX, RCX
    XOR     R8, R8

check_char:
    CMP     RCX, RDX
    JZ      exit_null
    MOV     R8B, BYTE [RDI + RCX]
    CMP     R8B, BYTE 0
    JZ      exit
    CMP     BYTE [RSI + RCX], BYTE 0
    JZ      exit
    CMP     R8B, BYTE [RSI + RCX]
    JNZ     exit
    INC     RCX
    JMP     check_char

exit:
    SUB     R8B, BYTE [RSI + RCX]
    MOVSX   RAX, R8B

    LEAVE
    RET

exit_null:
    MOV     RAX, 0x00

    LEAVE
    RET