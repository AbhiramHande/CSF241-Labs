.model tiny
.386
.stack 0000h
.data
inp1 db 'Abhiram H'
colmstr dw ?
cnt db 09h
.code
.startup
    XOR AH, AH
    MOV AL, 03h
    INT 10h

    LEA SI, inp1
    LEA DI, cnt
    XOR CH, CH
    MOV CL, [DI]
    MOV colmstr, 20
    LEA DI, colmstr

WRTIE:
    PUSH CX

    MOV AH, 02h
    MOV DH, 20
    MOV DL, [DI]
    XOR BH, BH
    INT 10h

    MOV AH, 09h
    MOV AL, [SI]
    XOR BH, BH
    MOV BL, 10001001b
    MOV CX, 01
    INT 10h
    POP CX 

    INC SI
    INC word ptr [DI]
    DEC CL
    JNZ WRTIE

BLOCK:
    MOV AH, 07h
    INT 21h
    CMP AL, '%'
    JNZ BLOCK

    MOV AH, 4Ch
    INT 21h
.exit
end