; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mleclair <mleclair@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/06/19 11:46:13 by mleclair          #+#    #+#              ;
;    Updated: 2018/06/19 11:46:13 by mleclair         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_strcat

section .text

_ft_strcat:
	cmp rdi, 0			; check for null params
	je err
	cmp rsi, 0			
	je err
	mov r11, rdi
	cld
	xor al, al			; scan for 0

	xor rcx, rcx		; clear iterator
	not rcx
	repne scasb			; go trough s1 to \0
	dec rdi
	mov r10, rdi

	mov rdi, rsi
	xor rcx, rcx
	not rcx
	repne scasb
	not rcx				; iterator now equal to len(s2) + 1

	mov rdi, r10
	rep movsb
	mov rax, r11
end:
	ret
err:
	mov rax, rdi
	ret
