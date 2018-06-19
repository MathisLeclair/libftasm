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

extern _ft_strlen
global	_ft_strlen
section .text

_ft_strlen:                 ; int strlen(const char *string)
	push	edi
	sub	ecx, ecx
	mov	edi, [esp+8]
	not	ecx
	sub	al, al
	cld
repne	scasb
	not	ecx
	pop	edi
	lea	eax, [ecx-1]
	ret