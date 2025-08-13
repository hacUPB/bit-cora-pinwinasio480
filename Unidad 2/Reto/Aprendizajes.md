Apunte General:

El puntero se reclama con un asterisco. Es una variable que almacena la direccion de memoria de otra .variable (puntero).
Un ountero se asigna a yba dureccuón de memoria.
& guarda la dirección de la variable.
referenciar es que accede al valor que esta guardado en esa dirección.

Reto 1

Con el reto 1 lo que pude evidenciar, es como se pueden usar dos variables al mismo tiempo de formas diferentes en un while, al final en la variable i se almaceno la cantidad de veces sumados, 
mientras que en la variable sum se fue acumulando las sumas en total.

[<video controls src="GrabaciónReto1-1.mkv" title="Title"></video>]

Reto 2

De este no tengo mucho que decir, fue más como un recordatorio de como se aplica un for, 
algo que desde la materia de programación anterior no recordaba. Y como puse en las notas de ahi:
"Ahora en vez de evaluarse i <= 100, el programa debe ejecutar un número determinado de veces".

Reto 3

Aunque logre hacer el reto, fue curioso intentar pasar de un while a for en ensamblador, especialmente porque viendo ambas versiones de mis codigos, tienen diferencias que si bien en un lenguaje ensamblador son contadas, en uno de alto nivel se hace más evidente.

Reto 4

Las respuestas de este reto aunque son teoricas, fueron de utlidad para aprender mejor el concepto de
punteros, lo cual me fue util para los retos posteriores.

Reto 5

Con este reto fue que pude ir aprendiendo a como hacer uso de los punteros en un lenguaje ensamblador y como por ejemplo se almacena la dirección de la variable a en la variable p.

Reto 6

Es de los retos que más me costo porque exactamente no recordaba que habia que hacer, en mi respuesta solo puse la explicación de como interprete ese codigo. Lo pongo nuevamente aqui por si algo.

Lo que estoy entendiendo, es que debo declarar en la variable `var` un 10, y en `bis` un 5. 
Despues declaro un puntero en `p_var` el cual incializo en la dirección var,
posterior a eso asigno a la variable `bis` el valor apuntado por `p_var`.
Lo cual implica que el valor de `bis` cambia de 5 a 10.

Reto 7

Al pasarlo a ensamblador aunque hubo cosas nuevas, tuve de base algunas partes que habia hecho en el reto 5 para realizar el programa de este.

Reto 8

Este reto es más que todo una prueba para recordar que hace cada cosa del concepto de puntero y almacenamiento de variables, ojo, puede que la forma en la que lo este diciendo ahora mismo sea erronea, ironicamente, ese ejercicio es de memoria y yo aqui lo que estoy escribiendo es intentando recordar con memoria.

Reto 9

Este fue por mucho el más complicado, más que todo porque hay cosas del enunciado que interpretaba de formas opuestas o distintas. Porque si, almacenar variables en a y b y hacer una suma hasta ahi va todo bien, el retorno normal, pero ya cuando hay un main de por medio, o cosas como "std::cout << "El valor de c es: " << c << std::endl;" son cosas que dejan rascando la cabeza por muy buen rato.