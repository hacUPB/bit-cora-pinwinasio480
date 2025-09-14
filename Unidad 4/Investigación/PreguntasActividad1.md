### Actividad 1:

Gestión de memoria: se maneja explícitamente la liberación de memoria mediante la función `clear()`. Nota que también se llama a clear en el destructor de la clase LinkedList para asegurar que la memoria se libere cuando el objeto se destruye.

Vas a reportar en tu bitácora de aprendizaje:

1. **Entiende la aplicación**: comienza explorando detenidamente cómo funciona el programa. Usa un un modelo del lenguaje como ChatGPT y el depurador para que verifiques las explicaciones que te propone ChatGPT. Puedes escribir el prompt: quiere entender de manera muy detallada el siguiente programa escrito en C++ y el openframeworks. Luego le das el código. Ve preguntando lo que no entiendas. recuerda ir usando al mismo tiempo el depurador de visual studio.

Acorde a la información propuesta por Chat GPT, El programa crea una lista enlazada de Node (cada nodo guarda x, y y next) que representa la serpiente: head es la cabeza y tail la cola. En cada frame la cabeza toma la posición del mouse y cada segmento adopta la posición anterior de su antecesor, por eso “siguen” al cursor. En ofApp::setup() se añaden 10 nodos (y el constructor de LinkedList crea 1), por lo que hay 11 segmentos al iniciar. keyPressed('c') llama a snake.clear(), que elimina todos los nodos con delete y libera la memoria; display() recorre la lista y dibuja cada nodo como un círculo rojo.

2. **Realiza evaluaciones formativas**. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.


a. ¿Cuántos nodos tiene la serpiente justo después de que se ejecute setup()?

b. ¿Dónde se posiciona inicialmente el head al construirse la lista?

c. ¿Quién se mueve primero en update(): la cabeza o el resto del cuerpo?

R/ La cabeza de la serpiente.

d. ¿Qué pasa cuando presionas la tecla 'c' durante la ejecución?

R/ La serpiente desaparece del programa (se borra).

e. Tras limpiar la lista, ¿update() o display() llegan a crashear?

R/ No, porque se manejan los punteros nulos adecuadamente

f. ¿Qué ocurre si llamas addNode() después de haber hecho un clear()?

g. ¿La complejidad de addNode() es O(1) o O(n)?

h. ¿Cuál es la complejidad de update() y display()?

i. ¿Hay riesgo de problemas de memoria si copias un LinkedList (p. ej. LinkedList b = a;)?

j. ¿Es posible que el head aparezca en (0,0) al inicio? ¿Por qué?

k. ¿Qué dibuja exactamente la función display() en pantalla?

La serpiente

l. ¿Se liberan todos los nodos correctamente cuando la aplicación se cierra?

m. ¿Qué sucede visualmente si mueves el mouse muy rápido?

n. ¿Es necesario llamar ofBackground() en setup() si en draw() también se llama cada frame?


3. ¿Qué es una lista enlazada y en qué se diferencia de un arreglo en cuanto a la forma en que los elementos están almacenados en la memoria?

Una lista enlazada es una estructura dinámica de datos conformada por nodos, los cuales estan conformadospor dos partes:

- El dato
- Un puntero al siguiente nodo

Los nodos se pueden guardar en cualquier parte del heap y el puntero se encarga de enlazarlos. Un ejemplo de como se veria en Visual es:

```cpp

[10|*] -> [20|*] -> [30|null]

```

Y al depurar con breakpoint esta linea:

```cpp

Node* newNode = new Node(x, y);

```
Y revisarla en inspecciones rapidas, saldra newNode de esta manera:

```cpp

-		newNode	0x000000000014f1d8 {x=8.306e-39#DEN y=0.00000000 next=0x00000000005a7280 {x=3.41384697 y=1.401e-45#DEN ...} }	Node *

```
Y dentro de newNode, se encuentran X, Y y Next. Lo cual significa que cada nodo se crea en newNode se guarda en el heap, en donde cada nodo guarda un puntero en Next para poder recorrerlo. Siendo aqui la diferencia entre una arreglo y lista enlazada, pues en un arreglo, los elementos están en direcciones contiguas de memoria, mientras que en una lista enlazada, los nodos pueden estar dispersos en memoria, pero están unidos por punteros.

4. Al observar el código de una lista enlazada en C++, ¿Cómo crees que se vinculan los nodos entre sí? ¿Qué estructura se utiliza para lograr esta conexión?

Un factor muy importante son los punteros, dentro del programa cuando se hace un new Node(), se crea un nuevo nodo en la memoria, mientras que el nodo anterior apunta al nuevo a traves de un next, con lo que de esa forma se forma una cadena de nodos conectados por punteros, sin estos punteros, los nodos quedarían aislados y no sería posible recorrer la lista.

Si lo vemos en como se representa dentro del programa, un ejemplo para explicar la estructura de que logra dicha conexión es:

```cpp

Node* next;

```

5. ¿Cómo se gestiona la memoria en una lista enlazada? Investiga cómo se crea y se destruye un nodo en memoria utilizando el operador new y delete en C++.

En este caso, para crear un nodo, utilizo el operador new:

```cpp

Node* newNode = new Node(x, y);

```

Y para eliminarlos, se debe usar un operador delete:

```cpp

delete current;

```

Recorriendo todos los nodos y liberando memoria en el heap. En otras palabras, la gestión de una lista enlazada se basa en como yo puedo manualmente crear nodos con new y eliminarlos con delete, y si no se usa delete, se puede generar un memory leak (fuga de memoria).

6. Considerando la estructura de una lista enlazada, ¿qué ventajas ofrece en comparación con un arreglo cuando se trata de insertar o eliminar elementos en posiciones intermedias?

Hablando de las ventajas, al poder gestionar manualmente los nodos al gusto que uno quiera, no debo mover todos los elementos o grandes bloques, cosa que pasa en el arreglo, sino que solo se ajustan los punteros, además de que pueden crecer dinamicamente en la memoria del heap sin un tamaño fijo.

7. En el código presentado, ¿Cómo se asegura que no haya fugas de memoria? ¿Qué papel juega el destructor en la clase LinkedList?

Para asegurar que no haya fugas de memoria, la clase LinkedList implementa el método clear(), el cual recorre la lista y elimina cada nodo utilizando el operador delete. De esta forma, se libera la memoria dinámica que fue reservada en el heap.
Y hablando sobre el papel destructor de la clase anteriormente mencionada, este se encarga de llamar automáticamente a clear() cuando el objeto deja de existir (por ejemplo, al finalizar su alcance). Esto garantiza que todos los nodos se liberen correctamente y que no queden segmentos de memoria sin utilizar, previniendo fugas de memoria (memory leaks).

8. ¿Qué sucede en la memoria cuando se invoca el método clear() en una lista enlazada? Explica paso a paso cómo se liberan los recursos.

Cuando se invoca clear() la lista recorre desde head hasta el final; en cada paso guarda la dirección del siguiente nodo (next = current->next), llama a delete current, que ejecuta el destructor de Node si existe y libera la memoria ocupada en el heap, y avanza a current = next. Al terminar se asigna head = tail = nullptr y size = 0 para evitar punteros colgantes y dejar la lista en un estado consistente.

Para explicarlo mejor, este es paso a paso:

a. current = head.

b. Mientras current != nullptr: guarda next = current->next para no perder el enlace al resto de la lista.

c. Se llama a delete current, esto ejecuta el destructor de Node (si existe) y libera la memoria ocupada por ese nodo en el heap.

d. Se avanza a current = next y se repite hasta el final.

e. Al finalizar, se pone head = tail = nullptr y size = 0 para evitar punteros colgantes y dejar la lista en un estado adecuado.

9. Explica cómo cambia la estructura en memoria de una lista enlazada al agregar un nuevo nodo al final de la lista. ¿Cómo afecta esto al rendimiento de la lista enlazada?


Cuando el nodo se agrega al final de la lista, se reserva espacio en el heap con new. El puntero next, anteriormente el último (tail), deja de ser nullptr y pasa al nuevo nodo. Finalmente, el puntero tail se actualiza para señalar este nuevo nodo, que ahora es el último y cuyo next es nullptr.
En lo que respecta al rendimiento, esta operación es muy efecticiente: gracias al puntero tail, no hay necesidad de recorrer toda la lista para encontrar el último nodo, por lo que la inserción ocurre en tiempo constante O(1).

10. Analiza una situación en la que utilizar una lista enlazada sería más ventajoso que utilizar un arreglo. Justifica tu respuesta considerando la gestión de memoria y las operaciones de inserción y eliminación.

Una lista enlazada sería más ventajosa en situaciones donde se esten realizando muchas inserciones y eliminaciones ya sea en posiciones intermedias o al inicio, debido a que con un arreglo este tipo de operaciones implica mover múltiples elementos para mantener el orden, lo cual hasta cierto punto se vuelve tedioso para quien este haciendo el programa, lo cual no sucede con las listas enlazadas, debido a que en ese caso, solo es necesario ajustar los punteros de los nodos.

Además, como la lista enlazada gestiona la memoria dinámicamente en el heap, puede crecer o reducirse según se requiera sin tener que reservar un bloque como ocurre con los arreglos. Esto evita desperdiciar la memoria y la hace más flexible en contextos donde el tamaño de los datos no esta definido.

11. Después de estudiar el manejo de memoria en listas enlazadas, ¿Cómo aplicarías este conocimiento para diseñar una estructura de datos personalizada para una aplicación creativa? ¿Qué aspectos considerarías para asegurar la eficiencia y evitar fugas de memoria?

Si quisiera hacer una aplicación tipo videojuego ligero, podría aplicar la gestión de memoria con listas enlazadas en un juego estilo Slither.io. Por ejemplo, al igual que en el ejercicio donde se limpia la lista de nodos de la serpiente cuando desaparecen, en este caso eliminaría los nodos de cada serpiente de los jugadores cuando estos sean eliminados, liberando la memoria inmediatamente en lugar de esperar hasta el final del juego. Para asegurar que no haya fugas de memoria ni errores, usaría un método como clear() para recorrer y liberar todos los nodos correctamente.

12. Reflexiona sobre las diferencias en la gestión de memoria entre C++ y un lenguaje con recolección de basura automática como C#. ¿Qué ventajas y desafíos encuentras en la gestión explícita de memoria en C++ al trabajar con estructuras de datos?

Si hablamos de las diferencias, en C++ la gestión de memoria es explícita, es decir, uno decide cuándo crear (new) y destruir (delete) los objetos, lo que da un control total sobre el uso de la memoria y la eficiencia de las estructuras de datos. Sin embargo, esto también implica riesgos, como olvidarse de liberar memoria y generar fugas (memory leaks) o punteros colgantes.

En cambio, en un lenguaje como C# la memoria se gestiona automáticamente mediante recolección de basura, lo que hace que sea más seguro y menos propenso a errores, pero también limita el control directo que tengo sobre cuándo y cómo se liberan los recursos.

En resumen, C++ ofrece libertad y eficiencia a cambio de más responsabilidad, mientras que C# sacrifica un poco de control para garantizar seguridad y simplicidad.

13. Imagina que estás optimizando una pieza de arte generativo que usa listas enlazadas para representar elementos en movimiento. ¿Qué consideraciones tomarías en cuenta para garantizar que la gestión de la memoria sea eficiente y que no ocurran fugas de memoria?

Lo más esencial es asegurarse de eliminar los nodos que ya no sean necesarios, mantener correctamente los punteros next para no perder acceso a los nodos restantes, usar el método clear() cuando sea necesario para liberar memoria de manera segura y, por último, insertar nodos de manera controlada a medida que se generan los movimientos.

14. **Pruebas:** pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.