### Actividad 1:

Gestión de memoria: se maneja explícitamente la liberación de memoria mediante la función `clear()`. Nota que también se llama a clear en el destructor de la clase LinkedList para asegurar que la memoria se libere cuando el objeto se destruye.

Vas a reportar en tu bitácora de aprendizaje:

1. **Entiende la aplicación**: comienza explorando detenidamente cómo funciona el programa. Usa un un modelo del lenguaje como ChatGPT y el depurador para que verifiques las explicaciones que te propone ChatGPT. Puedes escribir el prompt: quiere entender de manera muy detallada el siguiente programa escrito en C++ y el openframeworks. Luego le das el código. Ve preguntando lo que no entiendas. recuerda ir usando al mismo tiempo el depurador de visual studio.

Acorde a la información propuesta por Chat GPT, el programa lo que realiza es crear una lista enlazada de objetos Node (esto se crea dentro de una clase LinkedList, y dichos Node cuenta con un x, y y next.) Toda esa lista reperesenta a la serpiente, head es su cabeza y tail es la parte trasera, cada frame al cabeza toma la posición del mouse y cada frame tomala posición del mouse y cada segmento toma la posición anterior de su antecesor, por eso “siguen” al mouse.
Por otra parte, offApp::setup() añade 10 nodos (y el constructor del LinkedList ya crea 1, así que inicialmente hay 11). keyPressed('c') llama snake.clear() para eliminar todos los nodos y liberar memoria. display() dibuja cada nodo como un círculo rojo.

2. **Realiza evaluaciones formativas**. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.


a. ¿Cuántos nodos tiene la serpiente justo después de que se ejecute setup()?

b. ¿Dónde se posiciona inicialmente el head al construirse la lista?

c. ¿Quién se mueve primero en update(): la cabeza o el resto del cuerpo?

d. ¿Qué pasa cuando presionas la tecla 'c' durante la ejecución?

e. Tras limpiar la lista, ¿update() o display() llegan a crashear?

f. ¿Qué ocurre si llamas addNode() después de haber hecho un clear()?

g. ¿La complejidad de addNode() es O(1) o O(n)?

h. ¿Cuál es la complejidad de update() y display()?

i. ¿Hay riesgo de problemas de memoria si copias un LinkedList (p. ej. LinkedList b = a;)?

j. ¿Es posible que el head aparezca en (0,0) al inicio? ¿Por qué?

k. ¿Qué dibuja exactamente la función display() en pantalla?

l. ¿Se liberan todos los nodos correctamente cuando la aplicación se cierra?

m. ¿Qué sucede visualmente si mueves el mouse muy rápido?

n. ¿Es necesario llamar ofBackground() en setup() si en draw() también se llama cada frame?



3. ¿Qué es una lista enlazada y en qué se diferencia de un arreglo en cuanto a la forma en que los elementos están almacenados en la memoria?

Una lista enlazada es una estructura de nodos es una estructura dinamica de datos conformada por nodos, los cuales estan conformadospor dos partes:

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
Y dentro de newNode, se encuentran X, Y y Next. Lo cual significa que cada nodo se crea en newNode se guarda en el heap, en donde cada nodo guarda un puntero en Next para poder recorrerlo. Siendo aqui la diferencia entre una arreglo y lista enlazada, pues las listas enlazadas tienen los nodos dispersos pero estan unidos con un puntero, mientras que con una lista enlazada estos estan en direcciones contiguas.

4. Al observar el código de una lista enlazada en C++, ¿Cómo crees que se vinculan los nodos entre sí? ¿Qué estructura se utiliza para lograr esta conexión?

Un factor muy importante son los punteros, dentro del programa cuando se hace un new Node(), se crea un nuevo nodo en la memoria, mientras que el nodo anterior apunta al nuevo a traves de un next, con lo que de esa forma se forma una cadena de nodos conectados por punteros.

Si lo vemos en como se representa dentro del programa, un ejemplo para explicar la estructura de que logra dicha conexión es:

```cpp

Node* next;

```

5. ¿Cómo se gestiona la memoria en una lista enlazada? Investiga cómo se crea y se destruye un nodo en memoria utilizando el operador new y delete en C++.

En este caso, para crear un nodo, utilizo el operador new:

```cpp

Node* newNode = new Node(x, y);

```

Y para eliminarlos, se debe implementar un operador delete:

```cpp

delete current;

```

Recorriendo todos los nodos y liberando memoria en el heap. En ptras palabras, la gestión de una lista enlazada se basa en como yo puedo manualmente crear nodos con new y eliminarlos con delete.

6. Considerando la estructura de una lista enlazada, ¿qué ventajas ofrece en comparación con un arreglo cuando se trata de insertar o eliminar elementos en posiciones intermedias?



7. En el código presentado, ¿Cómo se asegura que no haya fugas de memoria? ¿Qué papel juega el destructor en la clase LinkedList?
8. ¿Qué sucede en la memoria cuando se invoca el método clear() en una lista enlazada? Explica paso a paso cómo se liberan los recursos.



9. Explica cómo cambia la estructura en memoria de una lista enlazada al agregar un nuevo nodo al final de la lista. ¿Cómo afecta esto al rendimiento de la lista enlazada?



10. Analiza una situación en la que utilizar una lista enlazada sería más ventajoso que utilizar un arreglo. Justifica tu respuesta considerando la gestión de memoria y las operaciones de inserción y eliminación.



11. Después de estudiar el manejo de memoria en listas enlazadas, ¿Cómo aplicarías este conocimiento para diseñar una estructura de datos personalizada para una aplicación creativa? ¿Qué aspectos considerarías para asegurar la eficiencia y evitar fugas de memoria?



12. Reflexiona sobre las diferencias en la gestión de memoria entre C++ y un lenguaje con recolección de basura automática como C#. ¿Qué ventajas y desafíos encuentras en la gestión explícita de memoria en C++ al trabajar con estructuras de datos?



13. Imagina que estás optimizando una pieza de arte generativo que usa listas enlazadas para representar elementos en movimiento. ¿Qué consideraciones tomarías en cuenta para garantizar que la gestión de la memoria sea eficiente y que no ocurran fugas de memoria?



14. **Pruebas:** pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.