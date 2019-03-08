BITS 64

SECTION .text

GLOBAL strchr

strchr:
    PUSH    RBP
    MOV     RBP, RSP

check_char:
    CMP	    BYTE [RDI], SIL
	JZ	    exit
    CMP     [RDI], BYTE 0
    JZ      exit_null
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