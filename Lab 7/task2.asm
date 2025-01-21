.model tiny
.stack 0000h
.data
inp_file1 db 'name.txt',0
handle1 dw ?
inp_file2 db 'id.txt',0
handle2 dw ?
otp_file db 'splice.txt',0
handle dw ?

len_name db 07h
len_id db 0Dh
id db 13 dup(?)
inp_name db 07 dup(?)
.code
.startup
    MOV AH, 3Dh
    XOR AL, AL
    LEA DX, inp_file1
    INT 21h
    MOV handle1, AX

    MOV AH, 3Fh
    MOV BX, handle1
    XOR CH, CH
    MOV CL, len_name
    LEA DX, inp_name
    INT 21h

    MOV AH, 3Eh
    INT 21h

    MOV AH, 3Dh
    XOR AL, AL
    LEA DX, inp_file2
    INT 21h
    MOV handle2, AX

    MOV AH, 3Fh
    MOV BX, handle2
    XOR CH, CH
    MOV CL, len_id
    LEA DX, id
    INT 21h

    MOV AH, 3Eh
    INT 21h

    MOV AH, 3Ch
    LEA DX, otp_file
    MOV CL, 01h
    INT 21h
    MOV handle, AX

    MOV AH, 3Dh
    MOV AL, 01h
    LEA DX, otp_file
    INT 21h
    MOV handle, AX

    MOV AH, 40h
    MOV BX, handle
    XOR CH, CH
    MOV CL, len_id
    ADD CL, len_name
    LEA DX, id
    INT 21h

    MOV AH, 3Eh
    LEA DX, otp_file
    INT 21h
.exit
end