// 1. Escribe un programa en lenguaje ensamblador que sume los primeros 100 números naturales.
    
//   int i = 1;           //la variable i almacena R1
//   int sum = 0;         // la variable sum almacena R0
//   While (i <= 100){   //Si i es menor o igual a 100
//      sum += i;        //se suma el valor de i a sum
//      i++;             //aumenta el valor de i con el valor asignado (1)
//   }

//INTENTO 1

// i = 1
//@i 
//M=1 
// sum = 0
//@sum 
//M=0 
//(LOOP)
// While (i>= 101, necesario, o sino sumara más de 100)
//@i
//D=M         // D = i
//@101
//D=D-A       // D = i - 101
//@END
//D;JGE       // Si D >= 0 == si i >= 101, salta al final del ciclo, de lo contrario, nunca terminara

// sum = sum + i , aqui empieza a sumar
//@i
//D=M
//@sum
//M=D+M

// i = i + 1
//@i
//M=M+1

//@WHILE        // Volver al inicio del ciclo
//0;JMP

//(END)         // Fin del ciclo
//@END
//0;JMP         // Loop infinito o punto final del programa

//INTENTO 2

// i = 1
@i 
M=1 

// sum = 0
@sum 
M=0 

(LOOP)
// Si i >= 101, termina el ciclo de lo contrario, seria un bucle infinito
@i
D=M       //El registro D almacena el valor de i (1) 
@101      //<= 100
D=D-A     //Se usa como comparativo ya que no hay comparativos aparte de las funcionas de salto
@END      //Etiqueta para finalizar el bucle
D;JGE     //Jump if Greather or Equal

// sum = sum + i
@i
D=M
@sum
M=D+M

// i++
@i
M=M+1

@LOOP        // Volver al inicio del bucle
0;JMP

(END)         // Fin del blucle
@END
0;JMP         // Loop infinito para detener el programa

//Intento 2 no se traba en el bucle, pero se esta duplicando los valores de sum, se detiene en 101
//durante el intento 2, si bien suma 1 en 1 en la variable i, en la variable sum se esta duplicando
//es decir, si esta acumulando los valores de las sumas
































    
//    - ¿Cómo están implementadas las variables `i` y `sum`?



//    - ¿En qué direcciones de memoria están estas variables?

//Ambas variables estan almacenadas en ubicaciones de la memoria RAM diferentes, por un lado,
//la variable sum esta almacenada en 17 [R17] debido a que ahi se guarda el valor de la suma, mientras que
//la variable i esta en la dirección 16 [R16] porque es el número que suma a sum hasta llegar a 100.


//    - ¿Cómo está implementado el ciclo `while`?

//El ciclo 'While' esta implementado de tal forma que en el programa, se encarga de identificar que,
//en caso de que la variable 1 sea menor o igual a 100, se ira sumando 1 a la variable sum hasta llegar
//a ese valor.


//    - ¿Cómo se implementa la variable `i`?

//La variable i esta implementado para ser la cantidad de número que se va a sumar hasta llegar a 100,
//lo que quiero decir no es que solo va a sumar 1 número, sino que va a ir sumando valores


//   - ¿En qué parte de la memoria se almacena la variable `i`?




//    - Después de todo lo que has hecho, ¿Qué es entonces una variable?




//    - ¿Qué es la dirección de una variable?




//    - ¿Qué es el contenido de una variable?