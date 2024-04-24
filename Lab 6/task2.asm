.model tiny
.data
req db 'Enter input string in lowercase: $'
max db 255
len db ?
inp db 255 dup(?)
otp db 255 dup(?)
.code
.startup
    LEA DX, req
    MOV AH, 09h
    INT 21h

    LEA DX, max
    MOV AH, 0Ah 
    INT 21h

    CLD
    XOR CH, CH
    MOV CL, len
    LEA SI, inp
    LEA DI, otp
BACK:
    LODSB
    SUB AL, 20h
    STOSB
    LOOP BACK
    MOV byte ptr [DI], '$'

    LEA DX, otp
    MOV AH, 09h
    INT 21h
.exit
end