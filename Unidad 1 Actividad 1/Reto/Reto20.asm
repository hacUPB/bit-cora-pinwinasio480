//20. Implementa un programa en lenguaje ensamblador que dibuje el bitmap que diseñaste en la pantalla 
//solo si se presiona la tecla “d”.

(LOOP)
    @24576     
    D=M
    @100       
    D=D-A
    @DRAW
    D;JEQ     

    @LOOP
    0;JMP

(DRAW)
    // 
    // 
    @16384     
    D=A
    @R0
    M=D        

    @LOOP
    0;JMP