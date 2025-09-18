1.1 Considera el siguiente caso de estudio:

```cpp

class Particle {
public:
    float x, y;
    void move(float dx, float dy) {
        x += dx;
        y += dy;
    }
};

```

- ¿Qué representa la clase Particle?

R/ 

- ¿Cómo interactúan sus atributos y métodos?

R/

- Prompt para ChatGPT: explícame en detalle qué es un objeto en C++ y cómo se relaciona con una clase. Usa el ejemplo de una clase Particle con atributos `x` y `y` y un método `move`.

R/

1.2 Considera los siguientes pasos:

1. Crear instancias:

```cpp

Particle p1;
Particle p2;

```

1. Explorar la memoria usando punteros:

```cpp

std::cout << "Dirección de p1: " << &p1 << std::endl;
std::cout << "Dirección de p2: " << &p2 << std::endl;

```

1. Determinar el tamaño del objeto:

```cpp

std::cout << "Tamaño de Particle: " << sizeof(Particle) << " bytes" << std::endl;

```

1. Imprimir direcciones de atributos:

```cpp

std::cout << "Dirección de p1.x: " << &(p1.x) << std::endl;
std::cout << "Dirección de p1.y: " << &(p1.y) << std::endl;

```

Reflexión Guiada:

- ¿Los atributos están almacenados de forma contigua?

R/

- ¿Qué indica el tamaño del objeto sobre su estructura interna?

R/

- Prompt para ChatGPT: ¿Cómo se almacenan los objetos en memoria en C++? Si tengo dos instancias de Particle, ¿Cómo se relacionan sus direcciones de memoria? ¿Los atributos están contiguos?

R/

![alt text](UNIDAD5ESPITIA.jpg)

1.3

![alt text](UNIDAD5GOMEZ.jpg)

Complex ocupa 12 bytes ,
metodo no ocupan espacio en la misma 
Static modifica el tiempo de vida de la variable: la clase cuando se crea una instancia, todos los atributos tendran el mismo valor; pueden existir si no hay instancias de la clase; el timepo de vida es mayor al de esas clases.

- ¿Cómo afectan los datos estáticos al tamaño de la instancia?

R/ En este caso, si lo vemos desde diferentes apartados, los métodos no afectan el tamaño de la instancia, las datos estaticos tampoco, los unicos que ueden llegar a afectar, son los datos dinamicos, pero solo aplica con los punteros.

- ¿Qué diferencias hay entre datos estáticos y dinámicos en términos de memoria?

R/ En terminos de memoria, hay varias diferencias: los datos estaticos se almacenan en la sección de datos estaticos y existen desde qe comienza hasta que finaliza el programa; por otro lado, los datos dinamicos se almacenan en el heap y el tiempo depende de hasta que se llame un delete o free.

- Prompt para ChatGPT: explícame cómo el uso de variables estáticas y dinámicas en una clase afecta el tamaño de sus instancias. ¿Las variables estáticas ocupan espacio en cada objeto?

SESIÓN 2 DE LA TAREA