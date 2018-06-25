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

_ft_puts:
	cmp rdi, 0			;check for null param
	je error
	mov rsi, rdi
	xor rcx, rcx
	not rcx
	xor al, al
	cld
	repne scasb
	not rcx
	dec rcx
	mov rdx, rcx		; write
	mov rdi, 1
	mov rax, 0x2000004
	syscall	
	cmp rax, 0
	jl error
	
	mov rdi, 1			; write newline
	lea rsi, [rel endl]
	mov rdx, 1
	mov rax, 0x2000004
	syscall
	cmp rax, 0
	jl error

	mov eax, 1
	ret

error:
	mov eax, -1
	ret

section .rodata

	endl db 10