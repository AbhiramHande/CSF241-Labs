.model tiny
.386
.stack 0000h
.data
inp db 'Abhiram H'
count db 09h
position db ?
.code 
.startup
    XOR AH, AH
    MOV AL, 03h
    INT 10h

    XOR CH, CH              ;Initialize count register
    MOV CL, count

    STD                     
    LEA SI, inp
    ADD SI, CX
    DEC SI

    MOV position, 00h
    LEA DI, position

WRITE:
    PUSH CX
    MOV AH, 02h
    MOV DL, [DI]
    MOV DH, DL
    XOR BH, BH
    INT 10h

    MOV AH, 09h
    LODSB
    XOR BH, BH
    MOV BL, 00001011b
    MOV CX, 01h
    INT 10h

    POP CX
    INC byte ptr [DI]
    LOOP WRITE

BLOCK:
    MOV AH, 07h
    INT 21h
    CMP AL, '%'
    JNZ BLOCK
.exit
end