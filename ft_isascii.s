; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isascii.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mleclair <mleclair@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/06/19 11:46:13 by mleclair          #+#    #+#              ;
;    Updated: 2018/06/19 11:46:13 by mleclair         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_isascii

_ft_isascii:                    ; int ft_isascii(char a)
    cmp edi, 0                
    jl false                   
    cmp edi, 127             
    jg false
    mov eax, 1
    ret

false:
    mov eax, 0
    ret