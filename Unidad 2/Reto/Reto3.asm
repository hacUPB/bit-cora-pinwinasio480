// 3. Escribe un programa en lenguaje ensamblador que implemente el programa anterior.

//Programa de lenguaje superior del punto 2:


//int sum = 0;
//for (int i = 1; i <= 100; i++)
//{
//    sum += i;
//}

//Versión en lenguaje ensamblador:

        @sum
        M=0

        @1
        D=A
        @i
        M=D               // i = 1

(LOOP)
        @i
        D=M
        @101
        D=D-A             // D = i − 101
        @END
        D;JGE             // si i ≥ 101, salir

        // i++
        @i
        M=M+1

        // sum = sum + i
        @i
        D=M
        @sum
        M=D+M

        @LOOP        // Volver al inicio del bucle
        0;JMP

(END)
        @END
        0;JMP             // acaba el bucle

// Por el momento el programa esta funcionando...pero me esta almacenando los valores en las direcciones opuestas.