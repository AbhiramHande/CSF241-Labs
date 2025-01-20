.model tiny
.data
inp_str db 'wasitcatisaw'
length db 0ch
res dw 00h
.code
.startup
    LEA SI, inp_str
    LEA DI, length
    DEC DI              ;Sets DI to the end of the input string
    MOV CX, length
    SHR CX              ;Divides the count by 2
FOR:
    CMPSB
    JNZ TERM
    LOOP FOR
    MOV res, 01h
TERM:
    MOV res, 00h
.exit
end