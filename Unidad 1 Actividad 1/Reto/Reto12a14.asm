//12. Implemente en ensamblador:
R4 = R1 + R2 + 69

//@20
  D=A
  @R1
  M=D
  @15
  D=A
  @R2
  M=D
  @R1
  D=M 
  @R2
  D=D+M 
  @69
  D=D+A
  @R4
  M=D

//13. Implementa en ensamblador:
if R0 >= 0 then R1 = 1
else R1 = –1

(LOOP)
goto LOOP

 //@R0
   D=M
   @NEG
   D;JLT
   @1
   D=A 
   @R1
   M=D 
   @LOOP
   0;JMP
   (NEG)
   @1
   D=-A 
   @R1 
   M=D 
   (LOOP)
   @LOOP
   0;JMP

//14. Implementa en ensamblador:
R4 = RAM[R1]

//@20
  D=A
  @R1
  M=D 
  @99
  D=A 
  @20
  M=D
  @R1
  A=M
  D=M 
  @R4
  M=D