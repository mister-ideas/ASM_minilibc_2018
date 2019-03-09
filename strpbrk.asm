BITS 64

GLOBAL strpbrk

SECTION .text

strpbrk:
    PUSH    RBP
    MOV     RBP, RSP

    XOR     RCX, RCX
    XOR     R8, R8
    XOR     R9, R9

check_char:
    MOV     R8B, BYTE [RDI + RCX]
    CMP     R8B, BYTE 0
    JZ      exit_null

check_list:
    CMP     BYTE [RSI + R9], BYTE 0
    JZ      next_char
    CMP     R8B, BYTE [RSI + R9]
    JZ      exit
    INC     R9
    JMP     check_list

exit:
    ADD     RDI, RCX
    MOV     RAX, RDI

    LEAVE
    RET

exit_null:
    MOV     RAX, 0x00

    LEAVE
    RET

next_char:
    INC     RCX
    XOR     R9, R9
    JMP     check_char