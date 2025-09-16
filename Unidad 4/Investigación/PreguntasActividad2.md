Vas a reportar en tu bitácora de aprendizaje:

1. **Entendiendo la aplicación**: comienza explorando detenidamente cómo funciona el programa. Usa un un modelo del lenguaje como ChatGPT y el depurador para que verifiques las explicaciones que te propone ChatGPT. Puedes escribir el prompt: quiere entender de manera muy detallada el siguiente programa escrito en C++ y el openframeworks. Luego le das el código. Ve preguntando lo que no entiendas. recuerda ir usando al mismo tiempo el depurador de visual studio.

PILA:

En la pila, se implementa la estructura LIFO, es decir, el último nodo que entra es el primero en salir.
Dentro de la clase nodo, 'ofVec2f position' tiene como objetivo guardar la posición 2d del circulo que dibujemos;'Node* next' es un puntero al siguiente nodo en la pila, debido a que se esta usando una lista enlazada, cada nodo sabe cual es el que viene posteriormente; y el constructor inicializa la posición (x, y) y next = nullptr debido a que cuando se crea un nodo, este aun no está enlazada a nada.

Pasando a la clase Stack, este cuenta con otro puntero 'top' al último nodo apilado, es desde este que se puede recorrer todos los nodos de la pila; además cuenta con constructor ('top = nullptr' significa que empieza vacio) y destructor (con clear se llama para liberar memoria al cerrar el programa):

```cpp

    Stack() {
        ;
    }

    ~Stack() {
        clear();
    }

``` 

En el push, se crea un nuevo nodo en la posición del mouse y lo conecta con el que anteriormente era top, por lo que ahora se nuevo nodo es el top.
En el pop, hay elementos y guarda un puntero temporal a top:

```cpp

 Node* temp = top;

```

Avanza top si siguiente nodo ('next') y borra el antiguo con un 'delete'.

En la clase clear, se eliminan todos los nodos de la pila uno por uno si 'top' es diferente de 'nullptr' (esto lo comento por el signo "!="). Y si pasamos al display, aqui se recorren todos los nodos desde top hasta nullptr (el último) y dibuja los circulos en cada posición.

Y por último, llendo a ofApp.cpp contamos con lo siguiente:

setup(): Sirve para definir el color del fondo, en este caso, gris claro.

draw(): Muestra los circulos de la pila

Y en keypressed tiene estas funciones:

Si oprimo 'a': Se apila un nuevo circulo donde este posicionado el mouse.

Si oprimo 'd': Se desapila el último circulo agregado.


COLA:

A diferencia de la pila, en la cola se aplica la estructura FIFO, en donde el primero que entra, es el que sale, no el último.

La clase Node es exactamente igual a la del stack; en la clase Queue fron apunta al primer nodo de la cola y rear al último:

```cpp

    Node* front;
    Node* rear;

```

El constructor nuevamente empieza vacio al igual que la pila y el destructor limpia la memoria; 

la clase enquque se asegura de que si esta vacía, front y rear apuntan a un nuevo nodo, pero de lo contrario, el nuevo nodo se enlaza al final y rear se actualiza. La clase dequeque por otra parte, elimina el nodo al frente de la cola y si despues de quitarlo la cola queda vacía (front == nullptr), tambien se actualiza 'rear == nullptr'.

En clear se borra toda la cola y en display recorre de front a rear y dibuja los círculos.

Y al pasar al ofApp.cpp contamos lo mismo que la pila: el setup() para el color del fondo, draw para mostrar los círculos de la cola, y el keyPressed(), en donde 'a' encola (crea) un círculo en la posición del mouse y 'd' desencola el primer círculo, osea, lo borra.

Resumen de este apartado:

El stack (pila) elímina el último en entrar, mientras que el queue (cola) elimina el primero.

2. **Realiza evaluaciones formativas**. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.

STACK:

a.¿Qué pasa en memoria cuando haces circleStack.push(ofGetMouseX(), ofGetMouseY())?

R/ Apila un nuevo círculo en la posición actual del mouse.

b. ¿Cuál es la función de la línea newNode->next = top; dentro de push?

R/ Luego de crear un nuevo nodo en la posición del mouse, esa función hace que el nuevo nodo enlaza hacia abajo, osea, conecta con el que antes era top.

c. En pop(), ¿qué ocurriría si no pusieras delete temp;?

R/ No liberaria memoria de los nodos eliminados y quedaria acumulada o suelta en el programa.

d. Cuando llamas a display(), ¿cómo sabe el programa por dónde empezar a recorrer los nodos?

R/ Debido a que display siempre recorre desde top, va siguienndo los next hasta llegar a nullptr.

QUEUE:

e. ¿Por qué en enqueue() hay una condición especial cuando rear == nullptr?

R/  Porque aqui significa que la cola estaba vacia, por lo que el nuevo nodo tiene que ser tanto front como rear.

f. ¿Qué diferencia importante hay entre dequeue() y pop() respecto a cuál nodo se elimina?

R/ En pop() hay elementos y se guarda un puntero temporal hacia top y libera memoria del nodo eliminado, mientras que dequeue() una de las cosas que hace por ejemplo es eliminar todos los nodos al frente de la cola.

g. ¿Qué sucedería si en dequeue() no actualizaras rear = nullptr cuando la cola queda vacía?

R/ Se quedarian nodos acumulados en rear y eso a largo plazo puede causar problemas en el rendimiento del programa.

COMPARACIÓN:

h. Si presionas 3 veces la tecla 'a' y luego 'd', ¿qué círculo se elimina primero en la pila y cuál en la cola?

R/ En la pila se elimina el último y en la cola el primero.


3. **Pruebas:** pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.

Sugerencias por parte de ChatGPT:

🔹 Pruebas por partes (funciones individuales)
1. Stack (pila)

push()

Prueba presionando varias veces la tecla a.

Esperado: aparecen círculos en las posiciones exactas del mouse y el último agregado siempre está en la parte superior (LIFO).

pop()

Presiona varias veces d después de haber apilado varios círculos.

Esperado: los círculos se eliminan en orden inverso al que se agregaron.

Prueba qué pasa si presionas d cuando la pila está vacía. No debería crashear el programa (gracias a la condición if (top != nullptr)).

display()

Después de cada push/pop verifica que los círculos se dibujan correctamente en pantalla.

Esperado: la pila se recorre desde arriba hasta abajo (top → next → next…).

2. Queue (cola)

enqueue()

Presiona varias veces la tecla a.

Esperado: los círculos aparecen en el orden en que los agregaste (FIFO).

dequeue()

Presiona varias veces d después de haber encolado varios círculos.

Esperado: los círculos desaparecen en el mismo orden en que fueron agregados.

Igual que con la pila, prueba qué pasa si presionas d cuando la cola está vacía.

display()

Verifica que siempre se dibujen todos los elementos en el orden correcto: desde front hasta rear.

🔹 Prueba del programa completo

Escenario 1:

Apila/encola varios círculos seguidos (ej: 5) y elimínalos todos con d.

Esperado: al final la pantalla quede vacía y no haya errores de memoria.

Escenario 2:

Alterna entre agregar y eliminar (ej: a → a → d → a → d).

Esperado: siempre se respete el orden (LIFO para pila, FIFO para cola).

Escenario 3 (límite):

Intenta eliminar más veces de las que agregaste.

Esperado: el programa no se rompe y simplemente ignora el pop() o dequeue() cuando ya no hay nodos.

Escenario 4 (estrés):

Agrega muchos círculos (ej: 50–100) y observa que el programa sigue funcionando fluido.

Esperado: sigue dibujando todo y no hay fugas visibles de memoria (aunque para verificar fugas necesitarías un analizador de memoria o el depurador).
