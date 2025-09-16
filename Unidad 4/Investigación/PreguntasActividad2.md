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

Y por último, llendo a App.cpp contamos con lo siguiente:

setup(): Sirve para definir el color del fondo, en este caso, gris claro.

draw(): Muestra los circulos de la pila

Y en keypressed tiene estas funciones:

Si oprimo 'a': Se apila un nuevo circulo donde este posicionado el mouse.

Si oprimo 'd': Se desapila el último circulo agregado.


COLA:


2. **Realiza evaluaciones formativas**. Dile a ChatGPT que te genere preguntas para verificar si entiendes cómo funciona el programa. Trata de verificar tus hipótesis usando el depurador y luego con las conclusiones del experimento responde la pregunta de ChatGPT. Continúa con este proceso hasta que estés seguro de que entiendes cómo funciona el programa.


3. **Pruebas:** pregunta a ChatGPT cómo podrías probar las partes del programa y el programa completo. Luego realiza las pruebas y verifica si los resultados coinciden con tus expectativas.
