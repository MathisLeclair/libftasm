; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mleclair <mleclair@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2018/06/19 11:46:13 by mleclair          #+#    #+#              ;
;    Updated: 2018/06/19 11:46:13 by mleclair         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;

global _ft_isalnum

_ft_isalnum:                    ; int ft_isalnum(char a)
    cmp edi, '0'                ; greater than 0(30) 
    jl false                    ; jump to false
    cmp edi, '9'                ; greater than 9(39) 
    jg false
    cmp edi, 'z'                ; greater than z(122) 
    jg false                    ; jump to false
    and edi , 95                ; a(97) AND 95 -> A(65)
    cmp edi, 'Z'                ; greater than Z(90) 
    jg false
    cmp edi, 'A'                ; less than A(65)
    jl false
    mov eax, 1
    ret

false:
    mov eax, 0
    ret