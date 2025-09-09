### RETO

**Preguntas para guiar el proceso**

1. **Exploración creativa:** ¿Qué tipo de efecto visual quieres lograr? ¿Cómo pueden ayudarte las diferentes estructuras de datos a lograr ese efecto?

La idea inicial de lo que quiero lograr y como lo visualizo, es que en la pantalla pueda agregar rayas dinamicas, a que me refiero, a que cuando yo las genere, se crearan con un color azul o rojo dependiendo de la tecla que oprima en posiciones aleatorias y que por ejemplo, si doy tecla arriba, aumenta el movimiento, si es tecla abajo, se disminuye y si oprimo la tecla c, se desbanecen todas las letras creadas.

Refuerzo de la idea: El programa empieza con la pantalla vacia, hay una secuencia en el que por ejemplo, si yo oprimo R, se genera un rectangulo rojo, y si yo oprimo B se genera un rectangulo azul, dichos rectangulos puedo aumentar o disminuir su tamaño dependiendo de si oprimo la tecla flecha arriba o abajo, dichos rectangulos se van moviendo por la pantalla como si fuera esas pantallas de bloqueo de los dvds. No recuerdo en que parte el profe sugirio que puede la lista enlazada, pila y cola, pero esos objetos tienen un limite (pueden ser 10) y que cuando ya llegué a su limite, ahi tenga que empezar a borrar con la tecla c.

Por cierto, ten en cuenta que estoy trabajando con OpenFrameWorks.


NOTA: SOLO SE OCULTA LOS RECTANGULOS, FALTA OTRA TECLA PARA VERLOS DEVUELTA.

tipo con rayas y que dependiendo de que tecla oprime, puedo agregar más rayas de colores, dichas rayas se pueden mover y si oprimo otra tecla se pueden eliminar, ¿que sugieres para hacerlo más creativo?

2. **Gestión de memoria:** ¿Qué consideraciones debes tener en cuenta al gestionar dinámicamente la memoria de los objetos? ¿Cómo asegurar que no haya fugas de memoria?



3. **Interacción y dinamismo:** ¿Cómo puedes hacer que la interacción del usuario influya en múltiples estructuras de datos simultáneamente para crear un efecto visual coherente y dinámico?



4. **Optimización:** ¿Qué técnicas puedes implementar para optimizar la gestión de memoria y el rendimiento de tu aplicación mientras mantienes una experiencia visual rica y fluida?



**Ejemplo de idea:«Lluvia de colores:»** crea una simulación de gotas de lluvia de colores que caen desde la parte superior de la pantalla. Usa un arreglo para almacenar las posiciones iniciales de las gotas y una pila para apilar nuevas gotas a medida que se generan. Al liberar las gotas que han caído fuera de la pantalla, asegúrate de gestionar y liberar correctamente la memoria.