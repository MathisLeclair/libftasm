; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isdigit.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mleclair <mleclair@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/06/19 11:46:13 by mleclair          #+#    #+#              ;
;    Updated: 2018/06/19 11:46:13 by mleclair         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_isdigit

_ft_isdigit:                    ; int ft_isdigit(char a)
    cmp edi, '0'                ; greater than 0(30) 
    jl false                    ; jump to false
    cmp edi, '9'                ; greater than 9(39) 
    jg false
    mov eax, 1
    ret

false:
    mov eax, 0
    ret