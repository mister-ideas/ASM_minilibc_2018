BITS 64

SECTION .text

GLOBAL strchr

strchr:
    PUSH    RBP
    MOV     RBP, RSP

check_char:
    CMP     BYTE [RDI], 0x00
    JZ      exit_null
    CMP	    [RDI], RSI
	JZ	    exit
    INC	    RDI
    JMP     check_char

exit:
    MOV     RAX, RDI

    LEAVE
    RET

exit_null:
    MOV     RAX, 0x00

    LEAVE
    RET