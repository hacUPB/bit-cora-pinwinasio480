// 3. Escribe un programa en lenguaje ensamblador que implemente el programa anterior.

//Programa de lenguaje superior del punto 2:


//int sum = 0;
//for (int i = 1; i <= 100; i++)
//{
//    sum += i;
//}

//Versión en lenguaje ensamblador:

//PRIMER INTENTO

//       @sum
//        M=0

//        @1
//        D=A
//        @i
//        M=D               // i = 1

//(LOOP)
//        @i
//        D=M
//        @101
//        D=D-A             // D = i − 101
//        @END
//        D;JGE             // si i ≥ 101, salir

        // i++
//        @i
//        M=M+1

        // sum = sum + i
//        @i
//        D=M
//        @sum
//        M=D+M

//        @LOOP        // Volver al inicio del bucle
//        0;JMP

//(END)
//        @END
//        0;JMP             // acaba el bucle

//SEGUNDO INTENTO

// sum = 0
@sum
M=0

// i = 1

@i 
M=1 

(FOR_LOOP)
// if (i > 100) salta a END (salir del bucle)
@i 
D=M 
@100 
D=D-A 
@END 
D;JGT //Jump if Greather Than 

// sum += i
@i 
D=M 
@sum 
D=D+M
@sum 
M=D 

// i++
@i 
M=M+1

//Regresa al for

@FOR_LOOP
0;JMP

// Fin para acabar el programa
(END)
@END 
0;JMP