.model tiny
.stack 0000h
.data
req_str db 'Enter your name: $'
max db 20h
len db ?
inp db 32 dup(?)
file db 'testing.txt',0
handle dw ?
.code
.startup
    MOV AH, 09h
    LEA DX, req_str
    INT 21h

    MOV AH, 0Ah
    LEA DX, max
    INT 21h

    MOV AH, 3Ch
    LEA DX, file
    MOV CL, 01h
    INT 21h
    MOV handle, AX

    MOV AH, 3Dh
    MOV AL, 01h
    INT 21h
    MOV handle, AX

    MOV AH, 40h
    MOV BX, handle
    XOR CH, CH
    MOV CL, len
    LEA DX, inp
    INT 21h

    MOV  AH, 3Eh
    INT 21h
.exit
end