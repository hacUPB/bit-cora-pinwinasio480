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

//INTENTO 2 (EL QUE FUNCIONA)

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

//Intento 2 no se traba en el bucle.

//PREGUNTAS

//- ¿Cómo están implementadas las variables `i` y `sum`?

//Ambas se almacenan en direcciones de la memoria RAM [R16] y [R17]. 

//- ¿En qué direcciones de memoria están estas variables?

//i esta en [R16], mientras que sum esta en [R17] hablando de la memoria RAM.

//- ¿Cómo está implementado el ciclo `while`?

//Se implementa con un LOOP para que haga un bucle donde si i <= 100, 
//se repetira el bucle para que siga sumando
//pero si i es >= 101, el bucle acabara.

//- ¿Cómo se implementa la variable `i`?

//Se almacena en una dirección de la RAM como dije antes, su valor se lee con el registro D.

//- ¿En qué parte de la memoria se almacena la variable `i`?

//A juzgar por el enunciado, dire que esta almacenado en la memoria RAM, como dije antes,
//en [R16].

//- Después de todo lo que has hecho, ¿Qué es entonces una variable?

//Es una forma de almacenar valores (o algo contenido) en una dirección de forma más eficaz
//odria decirse que son como etiquetas especiales pero para contener datos.

//- ¿Qué es la dirección de una variable?

//Es en donde esta ubicado la variable dentro de la memoria RAM, la cual incia desde la dirección 16
//[R16] en adelante, excepto en la última, ya que es la del teclado si mal no recuerdo.

//- ¿Qué es el contenido de una variable?

//Es el valor que se contiene o asigna en una variable, es como aqui, donde yo pongo en el contenido de i 1,
//o en el de sum 0.




























    
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