;########## Группа: ИВБ-111 #######
;########## Вариант: 20 ###########
;########## Ольга_Хонина ##########
include io.asm
.model small
.stack 100
.data
    array db 5 dup('$')     ;Массив инициализированный нулями
    x dw ?                  ;Вспомогательная переменная
    msg db "Fill the array", 0Ah, 0Dh, '$'
    msg1 db "Array[1]:", 0Ah, 0Dh, '$'
    msg2 db "Array[2]:", 0Ah, 0Dh, '$'
    msg3 db "Array[3]:", 0Ah, 0Dh, '$'
    msg4 db "Array[4]:", 0Ah, 0Dh, '$'
    msg5 db "Array[5]:", 0Ah, 0Dh, '$'
.code
    public olyapp
    olyapp proc far
    push bp
    mov bp,sp
    lea bx, array           ;Запись адреса массива в bx
    
    mov ah, 9               ;-
    lea dx, msg             ;- Вывод сообщения msg
    int 21h                 ;-
    
    mov ah, 9               ;-
    lea dx, msg1            ;- Вывод сообщения msg1
    int 21h                 ;-
    InInt x                 ;Ввод числа в x
    mov si, x               ;Запись значения x в регистр si
    mov [bx], si            ;Запись значения si по эффективному адресу bx
    inc bx                  ;Увеличение bx на 1 (Переход к следующему элементу массива)
    
    mov ah, 9               ;-
    lea dx, msg2            ;- Вывод сообщения msg2
    int 21h                 ;-
    InInt x                 ;Ввод числа в x
    mov si, x               ;-
    mov [bx], si            ;- То же самое, что и выше, но для элемента bx+1
    inc bx                  ;-
    
    mov ah, 9               ;-
    lea dx, msg3            ;- Вывод сообщения msg3
    int 21h                 ;-
    InInt x                 ;Ввод числа в x
    mov si, x               ;-
    mov [bx], si            ;- То же самое, что и выше для bx+2
    inc bx                  ;-
    
    mov ah, 9               ;-
    lea dx, msg4            ;- Вывод сообщения msg4
    int 21h                 ;-
    InInt x                 ;Ввод числа в x
    mov si, x               ;-
    mov [bx], si            ;- То же самое для bx+3
    inc bx                  ;-
    
    mov ah, 9               ;-
    lea dx, msg5            ;- Вывод сообщения msg5
    int 21h                 ;-
    InInt x                 ;Ввод числа в x
    mov si, x               ;-
    mov [bx], si            ;- То же самое для bx+4

    mov si, offset array    ;смещение
    mov cx, 5               ;количество итераций (величина массива)
    mov bx, 7Fh             ;Большое число для поиска минимума
N1: 
    lodsb                   ;считывание байта из si в al (младшая часть ax)
    cmp al, bl              ;сравнение этого байта с bl (младшая часть bx)
    jl min                  ;если al<bl, то переход на метку min
    jmp N2                  ;переход на метку N2
min: 
    mov bl, al              ;перемещение значения al в bl
    jmp N2                  ;переход на метку N2
N2:
    loop N1                 ;переход на новую итерацию цикла (cx-1, в lodsb загрузится след. байт массива)
    mov [bp+16], bx
    pop bp
    ret
olyapp endp
end