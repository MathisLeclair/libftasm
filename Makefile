# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mleclair <mleclair@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/09/12 19:21:21 by mleclair          #+#    #+#              #
#    Updated: 2018/06/25 14:25:06 by mleclair         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libfts.a

PATH = ./sprintf/

FILE_S =	ft_bzero \
			ft_strcat \
			ft_isalpha \
			ft_isdigit \
			ft_isalnum \
			ft_isascii \
			ft_isprint \
			ft_toupper \
			ft_tolower \
			ft_puts \
			ft_strlen \
			ft_memset \
			ft_memcpy \
			ft_strdup \
			ft_cat \

OBJ_S  := $(addsuffix .o, $(FILE_S))

TEST =				test.out
TEST_FILES =		main
TEST_OBJ :=			$(addsuffix .o,$(TEST_FILES))

all: $(NAME)

$(NAME): $(OBJ_S)
	@ar rc $(NAME) $(OBJ_S)


$(OBJ_S): %.o: %.s
	~/.brew/bin/nasm -f macho64 $< -o $@

test: re $(TEST_OBJ)
	clang -Wall -Wextra -Werror $(TEST_OBJ) -I. -L. -lfts -o $(TEST)

$(TEST_OBJ): $(TEST_DIR)%.o: $(TEST_DIR)%.c
	clang -Wall -Wextra -Werror -c -I. $< -o $@

clean:
	@rm -rf $(OBJ_S)
	@rm -rf $(TEST_OBJ)

clean_test:
	@rm -rf $(TEST)

fclean: clean
	@rm -rf $(NAME)
	@rm -rf $(TEST)

re: fclean all

.PHONY : all clean fclean re
