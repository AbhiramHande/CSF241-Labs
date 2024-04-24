.model tiny
.data 
success db 'The character entered is a$'
failure db 'The character entered is not a$'
.code
.startup
    MOV AH, 08h
    INT 21h
    CMP AL, 'a'
    JNZ NEXT
    LEA DX, success
    MOV AH, 09h
    INT 21h
    JMP TERM
NEXT:
    LEA DX, failure
    MOV AH, 09h
    INT 21h
TERM:
.exit
end