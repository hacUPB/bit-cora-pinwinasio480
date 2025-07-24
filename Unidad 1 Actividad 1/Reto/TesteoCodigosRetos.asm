@R2
M=0

(LOOP)
@R2
D=M 
@R1
D=D-M 
@END 
D;JEQ

@R0
D=M 
@R2 
A=D+M 
M=-1 

@R2 
M=M+1 
@LOOP 
0;JMP
