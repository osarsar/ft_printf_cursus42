NAME		= libftprintf.a
LIBFT		= libft

SRC_FILE =	ft_printf.c	\
			ft_printf_utils.c	\
			ft_print_ptr.c	\
			ft_print_unsigned.c \
			ft_print_hex.c


all: $(NAME)

%.o: %.c ft_printf.h
	@echo "Compiling: $< "
	@gcc -Wall -Wextra -Werror -c $< -o $@

$(NAME):$(SRC_FILE:.c=.o)
	@make -C $(LIBFT)
	@cp libft/libft.a .
	@mv libft.a $(NAME)
	@ar -r $(NAME) $(SRC_FILE:.c=.o)
	@echo "ft_printf compiled!"


clean:
	@rm -rf $(SRC_FILE:.c=.o)
	@make clean -C $(LIBFT)
	@echo "libftprintf.a erased!"


fclean:	clean
	@rm -rf $(NAME)
	@rm -rf $(LIBFT)/libft.a
	@echo "libftprintf.a erased!"
	@echo "libft.a erased!"


re:	fclean all
	@echo "Cleaned and rebuilt everything for ft_printf!"

