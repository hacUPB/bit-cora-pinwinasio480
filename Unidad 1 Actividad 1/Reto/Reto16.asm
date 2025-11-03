// 16. Implementa en lenguaje ensamblador el siguiente programa:
//int[] arr = new int[10];
//int sum = 0;
//for (int j = 0; j < 10; j++) {
//sum = sum + arr[j];
//}

//arr y sum son etiquetas

      @2000
        D=A
        @arr
        M=D               // arr = 2000

        @0
        D=A
        @sum
        M=D               // sum = 0

        @0
        D=A
        @j
        M=D               // j = 0

(LOOP)
        @j
        D=M
        @10
        D=D-A             // D = j − 10
        @END
        D;JGE             // si j ≥ 10, salir

        @arr
        D=M               // D = base(arr)
        @j
        D=D+M             // D = base(arr) + j
        A=D               // A apunta a arr[j]
        D=M               // D = arr[j]

        @sum
        M=D+M             // sum = sum + arr[j]

        @j
        M=M+1             // j = j + 1

        @LOOP
        0;JMP             // vuelve al bucle

(END)
        @END
        0;JMP             // acaba el bucle