### Actividad 1

En el capítulo 4 del libro “The Elements of Computing Systems” que puedes encontrar [**aquí**](https://www.nand2tetris.org/_files/ugd/44046b_7ef1c00a714c46768f08c459a6cab45a.pdf), vas a repasar de nuevo cómo se realizan las operaciones de entrada y salida en la plataforma de cómputo que estamos estudiando, es decir, la plataforma Hack y la CPU Hack. También puedes ver [**este**](https://youtu.be/gTOFd80QfBU?si=6FLpT907cx1Q_NDB) video, si quieres, donde te explican el concepto. En la sección 4.2.5. vas a encontrar el concepto de entrada-salida mapeada a memoria o *memory maped* I/O. Analiza lo siguiente:

- ¿Qué es la entrada-salida mapeada a memoria?

Es la localización de la memoria de 16 bits para representar el teclado, estando este ubicado en el registro 24576.

- ¿Cómo se implementa en la plataforma Hack?

Cuando la tecla es presionada, aparecera la cantidad de esta.

¿como accedo a la ram?

- Inventa un programa que haga uso de la entrada-salida mapeada a memoria.



- Investiga el funcionamiento del programa con el simulador.



### Actividad 2

Vas a revisar de nuevo el reto 20 de la unidad anterior. Asegúrate de entenderlo, simularlo y experimentar con él antes de continuar con el siguiente reto.

### Actividad 3

Vas a implementar y simular una modificación al reto 20 de la unidad anterior. Si se presiona la letra “d” muestras la imagen que diseñaste en el reto 18. Si no se presiona ninguna tecla, borrarás la imagen. 

Si quiero que se borre al no presionar ninguna tecla, debo hacer que los registros llenados con algun número por el mismo dibujo, sean cambiados por 0 para asi que las lineas del registro desaparezcan.


Hasta ahora no me deja borrar el dibujo completo, solo unas cuantas lineas, pero nada

### Actividad 4

Ahora realizarás una nueva variación al programa de la actividad anterior. Si se presiona la letra “d” muestras la imagen que diseñaste en el reto 18. Solo si se presiona la letra “e” borrarás la imagen que se muestra en pantalla.

Debo modificar el loop de eliminar para que sea similar al de 0.

En codigoActividad3.asm el error que tengo aparece debido a que tengo una instrucción ASM

si D == 100, E == 101, la correcio