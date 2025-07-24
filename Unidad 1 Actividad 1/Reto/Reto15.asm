//15. Implementa en ensamblador el siguiente problema. 
//En la posición R0 está almacenada la dirección inicial de una región de memoria. En la posición R1 está almacenado el tamaño de la región de memoria. 
//Almacena un -1 en esa región de memoria.

//@R2
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
