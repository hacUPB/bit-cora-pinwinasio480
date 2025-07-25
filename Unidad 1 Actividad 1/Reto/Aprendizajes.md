General: Durante esta unidad acerca del uso del software Nand2tetris, asi como el manejo de lenguaje ensamblador por medio de la opción CPU Emulator. Durante los ejercicios de clase y algunos retos, pude identificar la importancia de la capacidad de almacenamiento de las memorias ROM Y RAM, ya sea con el fin de guardar variables, guardar números en una posición, asi como el hecho de que una variable como "i", el ensamblador la puede identificar.

Algo interesante de este ensamblador, es el como se pueden incluso realizar operaciones como sumar y restar variables, almacenar datos en diferentes partes de la RAM, y como incluso etiquetas como 0;JMP pueden causar saltos dentro de la ROM (a esto se le suma el uso de etiquetas como CONT Y LOOP para generar bucles dentro del codigo).

Aunque he de reconocer que debo aun repasar más el concepto de las etiquetas dentro de los ensambladores.

Apesar de que un aprendizaje general (lo de arriba) no fue solicitado, decidi agregarlo como recordatorio personal, ahora bien, si vamos hablamos de aprendizajes y conclusiones de los retos, algunos los juntare y otros los comentare por separado, esto dependiendo en que archivos los haya ordenado, para no alargarlo tanto.

Retos 1-7: Durante estos primeros retos, he estado reforzando la practica con el uso de instrucciones básicas del lenguaje ensamblador, especialmente @, D=A, M=D y D=M, así como aprender un poco más sobre el manejo de saltos condicionales como D;JEQ (Jump if Equal) y D;JLT (Jump if Lower Than). Así mismo, he estado comprendiendo un poco más la diferencia entre cargar valores (con A y constantes) y posiciones de memoria (con M y los registros de la memoria RAM). También pude aprender más sobre cómo manipular valores mediante operaciones aritméticas básicas como suma y resta, además de los saltos condicionales para implementar estructuras de control, como condicionales simples.

Retos 8-9:

Retos 10-11:

Retos 12-14: En estos tres retos logre aprender cosas diferentes. Desde sumar dos valores almacenados en dos posiciones de la memoria RAM y sumarlo con una constante, teniendo su resultado en una posición diferente a las dos sumadas (sumar registros con una constante); así como ver de mejor forma el uso de etiquetas (en este caso, una de ella es NEG, la cual sirve para marcar posición) en donde si el valor en el registro D es < 0, se activaría el condicional D;JLT (Jump if Lower Than), saltara hacia la posición de NEG, en donde se almacenara -1 en [R1], pero si pasa lo contrario (es decir, el valor de D > 0), R1 cargara 1 a esa memoria; y por ultimo, también pude apreciar como una posición de la memoria RAM [R4] por ejemplo, puede leer y obtener el contenido de otra posición (en este caso, R4 almaceno el contenido de la dirección apuntada por R1).

Reto 15:

Reto 16:

Reto 17:

Reto 18: Este reto me dio la posibilidad de comprender la manipulación directa del Jack bitmap editor para dibujar un bitmap. Además de aprender a que incluso un dibujo desde un programa así, con la opción Hack Assembly activa, este traducirá todo el dibujo que haya hecho en lenguaje ensamblador, y al reproducir todo el código del dibujo desde CPU EMULATOR (.asm), en la pantalla se mostrara como el programa hará el dibujo que hice en cuestión de segundos.

Reto 19: Este reto me permitió observar cómo el lenguaje binario se puede traducir a ensamblador, y como dependiendo de como lo implementes, es decir, si cargas un archivo .hack, si escribes linea por línea primero en binario o incluso dependiendo de la inteligencia artificial a la que le preguntes, algunas líneas tendrán varias interpretaciones (esto lo digo en base a lo que me sucedió en este decimo noveno reto).

Reto 20: Este último se me hizo interesante, ¿en que sentido?, en que en este, también use el código del reto 18 para su funcionamiento, así mismo, he destacar que me ha ayudado a como hacer que el programa detecte entradas especificas del teclado, como en este reto, en donde el lienzo de bitmap no se dibujaba hasta que se oprimiera la tecla 'd' (y también aprendí mejor a ver lo valores de algunas teclas, la de la letra 'h' aun no sale de mi cabeza, es 104 si mal no recuerdo).


