.MODEL SMALL

.DATA
    newline DB "",0DH,0AH
    hours DB ?,?,":"
    minutes DB ?,?,":"
    seconds DB ?,?,"   ","(hour:minute:second)",0DH,0AH
    month DB ?,?,"/"
    day DB ?,?,"/"
    year DB ?,?,"   ","(month/day/year)",0DH,0AH,"$"
    
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    XOR AX,AX
    
    L:
        MOV AH,2CH
        INT 21H
        
        MOV AL,CH
        AAM
        ADD AX,3030H
        MOV hours,AH
        MOV hours+1,AL
        
        XOR AX,AX
        
        MOV AL,CL
        AAM
        ADD AX,3030H
        MOV minutes,AH
        MOV minutes+1,AL
        
        XOR AX,AX
        
        MOV AL,DH
        AAM
        ADD AX,3030H
        MOV seconds,AH
        MOV seconds+1,AL
        
        XOR AX,AX  
        
        MOV AH,2AH
        INT 21H
        
        MOV AL,DH   
        AAM   
        ADD AX,3030H                     
        MOV month,AH
        MOV month+1,AL
        
        XOR AX,AX
        
        MOV AL,DL
        AAM
        ADD AX,3030H
        MOV day,AH
        MOV day+1,AL
        
        XOR AX,AX
        
        SUB CX,7D0H
        MOV AL,CL
        AAM
        ADD AX,3030H
        MOV year,AH
        MOV year+1,AL
        
        XOR AX,AX
        
        MOV AH,9H
        LEA DX,newline
        INT 21H
        
        XOR AX,AX
        XOR CX,CX
        XOR DX,DX      
                
        JMP L