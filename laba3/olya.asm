;########## Группа: ИВБ-111 #######
;########## Вариант: 20 ###########
;########## Ольга_Хонина ##########
Extrn olyapp: Far
include io.asm
.model small
.stack 100
.data
    outputmsg db "Minimal element of Array is:", 0Ah, 0Dh, '$'
.code                        ;конец макроса
.startup
    push bx
    call olyapp              ;вызов макроса
    mov ah, 9               ;-
    lea dx, outputmsg       ;- Вывод сообщения outputmsg
    int 21h                 ;-
    OutInt bx                ;вывод значения x на экран
.exit 0
end