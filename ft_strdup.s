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

global _ft_strdup

extern _malloc

section	.text
global	_ft_strdup

_ft_strdup:
	push rbp
	mov rbp, rsp

	cmp rdi, 0		; check for null
	je error
	push rdi		; push string
	xor rcx, rcx	; get string length
	not rcx
	xor al, al
	cld
	repne scasb
	not rcx
	push rcx		; push string length
	mov rdi, rcx	; prep for malloc
	call _malloc
	cmp rax, 0
	je alloc_error
	pop rcx
	mov rdi, rax
	pop rsi
	cld
	rep movsb
	jmp end

error:
	xor rax, rax

alloc_error:
	pop rax
	pop rax

end:
	mov rsp, rbp
	pop rbp	
	ret
