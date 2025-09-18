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

Complex ocupa 12 bytes ,
metodo no ocupan espacio en la misma 
Para poder ca