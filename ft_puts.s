; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mleclair <mleclair@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/06/19 11:46:13 by mleclair          #+#    #+#              ;
;    Updated: 2018/06/19 11:46:13 by mleclair         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_puts

extern _ft_strlen

_ft_puts:                    ; int ft_puts(char *str)
	mov rcx, rdi
	call _ft_strlen          ; get lenght
	mov rdi, 1               ; set fd to 1
	mov rdx, rax
	mov rax, 0x2000004
	mov rsi, rcx
	syscall

	mov rdx, 1
	mov rax, 0x2000004
	lea rsi, [rel 0x0a]       ;write newline char
	syscall