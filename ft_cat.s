; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mleclair <mleclair@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/06/19 11:46:13 by mleclair          #+#    #+#              ;
;    Updated: 2018/06/19 11:46:13 by mleclair         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_cat

section .text

_ft_cat:
	push rbp
	mov rbp, rsp

	cmp edi, -1
	je end
	cmp edi, 255
	jg end

read_loop:
	push rdi			; read
	lea rsi, [rel buf]
	mov rdx, 256
	mov rax, 0x2000003
	syscall
	jc end_loop
	cmp rax, 0			; check for end
	je end_loop

	mov rdi, 1			; write
	lea rsi, [rel buf]
	mov rdx, rax
	mov rax, 0x2000004
	syscall
	jc end_loop
	pop rdi
	jmp read_loop
end_loop:
	pop rdi
end:
	mov rsp, rbp
	pop rbp
	ret

section .data

buf: times 256 db 0