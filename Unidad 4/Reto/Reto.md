### RETO

**Preguntas para guiar el proceso**

1. **Exploración creativa:** ¿Qué tipo de efecto visual quieres lograr? ¿Cómo pueden ayudarte las diferentes estructuras de datos a lograr ese efecto?

La idea de efecto visual que quiero lograr es la creación dinámica de rectángulos que aparezcan en posiciones aleatorias y con un color diferente según la tecla que se oprima: ‘r’ para rojo y ‘b’ para azul. Estos rectángulos se desplazan dentro de la pantalla simulando el rebote del logotipo de DVD y responden a la interacción del usuario: con las flechas arriba/abajo se controla la velocidad, con ‘c’ se desvanecen los rectángulos, con ‘v’ reaparecen si no han desaparecido por completo, y con ‘z’ se elimina el último rectángulo creado. Para administrar estos elementos, utilizo una lista enlazada, que permite recorrer y controlar dinámicamente los rectángulos, y una pila, que facilita la función de deshacer al eliminar el último elemento añadido.

De esta manera, las estructuras de datos no solo organizan los elementos en memoria, sino que también aportan al comportamiento visual de la aplicación, haciendo posible una experiencia interactiva donde la creación, eliminación y control de los rectángulos generan un efecto artístico en constante cambio.

2. **Gestión de memoria:** ¿Qué consideraciones debes tener en cuenta al gestionar dinámicamente la memoria de los objetos? ¿Cómo asegurar que no haya fugas de memoria?

En el código debo tener consideración usando 'delete' para eliminar los nodos y liberar memoria, como por ejemplo aqui:

```cpp

void eliminarEspecifico(RectNode * nodo) {
	if (!head || !nodo) return;
	if (head == nodo) {
		RectNode * temp = head;
		head = head->next;
		delete temp;
		size--;
		return;
	}
}
```

Asi mismo, debo evitar dejar punteros colgados (no dejar refencias a objetos borrados), usar destructores como:

```cpp

~ListaRectangulos() { clear(); }

```

3. **Interacción y dinamismo:** ¿Cómo puedes hacer que la interacción del usuario influya en múltiples estructuras de datos simultáneamente para crear un efecto visual coherente y dinámico?

Cuando se hace que una tecla haga x cosa en el programa, esto no solo afecta a la lista enlazada, sino que tambien afecta a la pila al mismo tiempo. Por otra parte, el dinamismo hace presencia cuando se coordinan las dos estructuras, es decir, la lista menja lo que se ve mientras que la pila maneja el historial, y ya que tocamos el tema de la memoria, el usuario no interactua con esta, sino con los efectos ligados a la estrcutura, es decir, los cambios de velocidad, desvanecimiento, reaparición, etc.

4. **Optimización:** ¿Qué técnicas puedes implementar para optimizar la gestión de memoria y el rendimiento de tu aplicación mientras mantienes una experiencia visual rica y fluida?

Las tecnicas más importantes que puedo tomar en cuenta seria tener un límite de rectangulos que puedan ser creados (10 en este caso, no puede haber más de esa cantidad, si llegara el caso de que se intente crear un undecimo rectangulo, se tendra que borrar el primer rectangulo creado de los que esten en pantalla), actualizar los nodos, Usar ofColor para la asignación de cada color (azul y rojo) además de ofVec2f para las direcciones de los rectangulos. Y por último, mantener estructuras simples debido a que no se requiere vectores enormes con erase.

**Ejemplo de idea:«Lluvia de colores:»** crea una simulación de gotas de lluvia de colores que caen desde la parte superior de la pantalla. Usa un arreglo para almacenar las posiciones iniciales de las gotas y una pila para apilar nuevas gotas a medida que se generan. Al liberar las gotas que han caído fuera de la pantalla, asegúrate de gestionar y liberar correctamente la memoria.