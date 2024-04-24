.model tiny
.data
array db 91h, 02h, 83h, 0Ah, 75h, 0Ah, 47h, 12h, 76h, 61h
.code
.startup
    MOV CX, 0Ah
    LEA SI, array
BACK:
    MOV AL, [SI]
    CMP AL, 0Ah
    JNE NEXT
    MOV AH, 45h
    MOV [SI], AH
NEXT:
    ADD SI, 01h
    LOOP BACK
.exit
end
