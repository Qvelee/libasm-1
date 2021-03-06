NAME = libasm.a
FLAGS = -Wall -Wextra -Werror
SRC = ./src/ft_strlen.s ./src/ft_strcpy.s ./src/ft_strcmp.s ./src/ft_write.s ./src/ft_read.s ./src/ft_strdup.s
BONUS = ./src/ft_list_size_bonus.s ./src/ft_list_push_front_bonus.s ./src/ft_atoi_base_bonus.s ./src/ft_list_sort_bonus.s ./src/ft_list_remove_if_bonus.s
OBJ = $(SRC:%.s=%.o)
OBJ_BONUS = $(BONUS:%.s=%.o)

%.o: %.s
	@nasm -f macho64 $< -o $@
	@echo "\033[90m[\033[32mOK\033[90m]\033[33m Compiling $<\033[0m"

all: $(NAME)

$(NAME) : $(OBJ)
	@ar rcs $(NAME) $(OBJ)
	@echo "\033[90m[\033[32mSuccess\033[90m]\033[32m Successfully compiled libasm.a .\033[0m"

bonus: all $(OBJ_BONUS)
	@ar rcs $(NAME) $(OBJ_BONUS)
	@echo "\033[90m[\033[32mSuccess\033[90m]\033[32m Successfully compiled libasm.a with bonus.\033[0m"

test: bonus
	@$(CC) main.c $(NAME) $(FLAGS)
	@echo "\033[90m[\033[32mSuccess\033[90m]\033[32m Successfully compiled test's .\033[0m"

clean:
	@$(RM) $(OBJ) $(OBJ_BONUS)
	@echo "\033[90m[\033[91mDeleting\033[90m]\033[31m Object files deleted\033[0m"

fclean: clean
	@$(RM) $(NAME) a.out
	@echo "\033[90m[\033[91mDeleting\033[90m]\033[31m libasm.a deleted.\033[0m"
	@echo "\033[90m[\033[91mDeleting\033[90m]\033[31m test deleted.\033[0m"

re: fclean bonus test

.PHONY: all test clean fclean re bonus