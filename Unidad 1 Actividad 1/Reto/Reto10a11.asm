// 10. Las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólico R0 a R15. 
// Escribe un programa en lenguaje ensamblador que guarde en R1 la operación 2 * R0.

    @0
    D=M
    @0
    D=D+M
    @1
    M=D

// 11. Considera el siguiente programa:
    
    //i = 1000
    //LOOP:
    //if (i == 0) goto CONT
    //i = i - 1
    //goto LOOP
    //CONT:
    
//La traducción a lenguaje ensamblador del programa anterior es:
    
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
    
    //- ¿Qué hace este programa?

    //Se carga el valor 1000 a la variable i (16), carga el valor i en el registro D (Desde LOOP empieza el bucle) 
    //verifica si el valor en D es == 0 para acabar el loop (CONT), en este caso, continua,
    //se disminuye el valor de en 1 (999), y finalmente, con el JMP, el bucle empieza de nuevo hasta que i sea 0.

    //- ¿En qué memoria está almacenada la variable i? ¿En qué dirección de esa memoria?

    //La variable i esta guardada en la memoria RAM, debido a que el ensamblador asgina variables como i desde la RAM 16 en adelante.

    //- ¿En qué memoria y en qué dirección de memoria está almacenado el comentario //`i = 1000?`

    // Los comentarios no se guardan en ninguna parte, solo son visibles para el usuario desde su bitacora o codigo,
    //pero para el ensamblador es imposible detectar un comentario. Solo se guarda como instrucción @1000.

    //- ¿Cuál es la primera instrucción del programa anterior? ¿En qué memoria y en qué dirección de memoria está almacenada esa instrucción?

    // La primera instrucción es @1000, ubicada en la ROM [0].

    //- ¿Cuál es la diferencia entre los símbolos `i` y `CONT`?

    // "i" es una variable dentro del ensamblador (desde la RAM 16 en adelante), mientras que CONT es una etiqueta para marcar posición.