##
## EPITECH PROJECT, 2019
## ASM_minilibc_2018
## File description:
## Makefile
##

ASM=		nasm

SRC=		strlen.asm		\
			strchr.asm		\
			memset.asm		\
			memcpy.asm

OBJ=		$(SRC:.asm=.o)

NAME=		libasm.so

ASMFLAGS=	-f elf64

RM=			rm -f

all:		$(NAME)

%.o:		%.asm
			$(ASM) $(ASMFLAGS) $^

$(NAME):	$(OBJ)
			$(LD) -shared -fpic -o $(NAME) $(OBJ)

clean:
			$(RM) $(OBJ)

fclean:		clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:		all clean fclean re