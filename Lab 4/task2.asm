.model tiny
.data
array db 03h, 24h, 67h, -27h, 0Ah, -26h
count db 06h
neg_count db 00h
.code
.startup
    MOV CL, count
    XOR CH, CH       
    XOR BL, BL         ; Clear counter for negative numbers
    LEA SI, array
BACK:
    XOR AH, AH
    LODSB
    ADD AH, AL          ; Set the sign flag
    JNS NEXT
    INC BL
NEXT:
    LOOP BACK
    MOV neg_count, BL
.exit
end