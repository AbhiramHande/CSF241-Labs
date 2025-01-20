.model tiny
.data
string db 'BITSIOTLAB'
substring db 'IOT'
stringlength db 0ah
substringlength db 03h
.code
.startup
    CLD
    XOR CH, CH
    MOV CL, stringlength
    SUB CL, substringlength
    INC CX
    LEA BX, string

FindSubstr:
    PUSH CX
    MOV SI, BX
    LEA DI, substring
    MOV CL, substringlength
    REPE CMPSB
    JZ SubstrFound

    INC BX
    POP CX
    DEC CX
    JNZ FindSubstr
    JMP EndProg

SubstrFound:
    MOV DI, BX
    MOV BYTE PTR [DI], '*'
    MOV SI, DI
    INC DI
    ADD SI, substringlength 

    XOR CH, CH
    MOV CL, substringlength
    LEA AX, string
    ADD AX, stringlength
    SUB AX, SI
    MOV CL, AL

    LOOP MOVSB

EndProg:
    NOP
.exit
end