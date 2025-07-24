// 8. Considera el siguiente programa:

@var1
D=M
@var2
D=D+M
@var3
M=D

// - ¿Qué hace este programa?

//El programa se encarga de cargar los datos de var1 (16) el registro D, 
//sumar ese dato con el del var2 (17) y guardar su resultado en el registro D, 
//y finalmente, guardara ese resultado en el var3. 
//En otras palabras, se suman los dos primeros var, y el resultado de la suma se guarda en var3.

// - En qué posición de la memoria está `var1`, `var2` y `var3`? ¿Por qué en esas posiciones?

// var1 esta en la posición 16, var2 en posición 17 y var3 en posición 18,
// esto debido a que las primeros 15 posicione sestan reservadas para ciertos usos.

// 9. Considera el siguiente programa:

//i = 1
//sum = 0
//sum = sum + i
//i = i + 1

//La traducción a lenguaje ensamblador del programa anterior es:
// i = 1
@i
M=1
// sum = 0
@sum
M=0
// sum = sum + i
@i
D=M
@sum
M=D+M
// i = i + 1
@i
D=M+1
@i
M=D

// ¿Qué hace este programa?

// El programa en cuestion asigna 0 y 1 a las variables sum e i respectivamente, 
// despues toma el valor de sum (0) y se suma con el valor de i (1), haciendo que ahora sum sea 1,
// y por ultimo, se le suma 1 a el valor actual de i (1), conviirtiendolo en 2.

//¿En qué parte de la memoria RAM está la variable i y sum? ¿Por qué en esas posiciones?

// Por un lado, la variable i esta en la posición 16, mientras que sum en la posición 17,
// al igual que el ejercicio 8, esto es debido a que las posiciones 0-15 estan reservadas para registros predefinidos.

//Optimiza esta parte del código para que use solo dos instrucciones:
// i = i + 1

//@i
//D=M+1
//@i
//M=D

@i
M=M+1