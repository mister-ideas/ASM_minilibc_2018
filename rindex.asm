BITS 64

GLOBAL rindex

SECTION .text

rindex:
    PUSH    RBP
    MOV     RBP, RSP

    XOR     RAX, RAX

to_end:
    CMP     SIL, BYTE 0
    JZ      exit
    CMP     [RDI], BYTE 0
    JZ      check_char
    INC     RDI
    JMP     to_end

check_char:
    DEC     RDI
    CMP     BYTE [RDI], SIL
    JZ      exit
    CMP     [RDI], BYTE 0
    JZ      exit_null
    JMP     check_char

exit:
    MOV     RAX, RDI

    LEAVE
    RET

exit_null:
    MOV     RAX, 0x00

    LEAVE
    RET