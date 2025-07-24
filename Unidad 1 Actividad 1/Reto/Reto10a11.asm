// 10. Las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólico R0 a R15. 
// Escribe un programa en lenguaje ensamblador que guarde en R1 la operación 2 * R0.





// 11. Considera el siguiente programa:
    
    i = 1000
    LOOP:
    if (i == 0) goto CONT
    i = i - 1
    goto LOOP
    CONT:
    
    La traducción a lenguaje ensamblador del programa anterior es:
    
    // i = 1000
    @1000
    D=A
    @i
    M=D
    (LOOP)
    // if (i == 0) goto CONT
    @i
    D=M
    @CONT
    D;JEQ
    // i = i - 1
    @i
    M=M-1
    // goto LOOP
    @LOOP
    0;JMP
    (CONT)
    
    - ¿Qué hace este programa?
    - ¿En qué memoria está almacenada la variable i? ¿En qué dirección de esa memoria?
    - ¿En qué memoria y en qué dirección de memoria está almacenado el comentario //`i = 1000?`
    - ¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?
    - ¿Qué son CONT y LOOP?
    - ¿Cuál es la diferencia entre los símbolos `i` y `CONT`?