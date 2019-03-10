BITS 64

SECTION .text

GLOBAL strlen

strlen:
    PUSH    RBP
    MOV     RBP, RSP

	XOR	    RCX, RCX

check_char:
    CMP	    BYTE [RDI], BYTE 0
	JZ	    exit
    INC	    RDI
	INC	    RCX
    JMP     check_char

exit:
    MOV     RAX, RCX

    LEAVE
    RET