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

section .text

_ft_strcat:                 ;ft_strcat(char *s1, const char *s2)

    cmp rdi, 0              ;check if s1 1 s2 are non-nul
    je end
    cmp rsi, 0 
    je end

	push rbx
	mov rbx, rsi
	mov rax, rdi
	mov rcx, 0

get_end:
	cmp byte [rdi], 0
	je len
	inc rdi
	jmp get_end

len:
	cmp byte [rbx], 0
	je copy
	inc rbx
	inc rcx
	jmp len

copy:
	inc rcx
	rep movsb
	pop rbx
	ret

end:
    ret
