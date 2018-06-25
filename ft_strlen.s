; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mleclair <mleclair@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/06/19 11:46:13 by mleclair          #+#    #+#              ;
;    Updated: 2018/06/19 11:46:13 by mleclair         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global	_ft_strlen
section .text

_ft_strlen:                 ; int strlen(const char *string)
	cmp rdi, 0
	je error
	xor rcx, rcx
	not rcx
	xor al, al
	repne scasb
	not rcx
	dec rcx
	mov rax, rcx
	ret

error:
	mov rax, 0
	ret