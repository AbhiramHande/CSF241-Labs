.model tiny
.386
.stack 0000h
.data
num1 db 01h
num2 db 01h
count db 08h
.code
.startup
    XOR AH, AH
    MOV AL, 03h
    INT 10h

    XOR DH, DH
    XOR CH, CH
    MOV CL, count
    LEA SI, num1

WRITE:
    XOR DL, DL
    PUSH CX 
    MOV CL, [SI]
    XOR CH, CH
    MOV AL, CL
    ADD AX, 40h

    MOV AH, 02h
    XOR BH, BH
    INT 10h

    MOV AH, 09h
    XOR BH, BH
    MOV BL, 00001010b
    INT 10h

    INC DH
    MOV CL, num1
    MOV CH, num2
    ADD CL, CH
    MOV byte ptr [SI], CH
    MOV byte ptr [SI+01], CL

    POP CX
    LOOP WRITE
    
BLOCK:
    MOV AH, 07h
    INT 21h
    CMP AL, '%'
    JNZ BLOCK

    MOV AH, 4Ch
    INT 21h
.exit
end
