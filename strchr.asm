BITS 64

SECTION .text

GLOBAL strchr

strchr:
    PUSH    RBP
    MOV     RBP, RSP

check_char:
    CMP     [RDI], BYTE O
    JZ      exit
    CMP	    [RDI], RSI
	JZ	    exit
    INC	    RDI
    JMP     check_char

exit:
    MOV     RAX, RDI

    LEAVE
    RET