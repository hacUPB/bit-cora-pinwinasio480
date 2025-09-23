Considera los siguientes pasos:

1. Crea una jerarquía de clases con métodos virtuales:

```cpp
class Base {
public:
    virtual void display() {
        std::cout << "Base display" << std::endl;
    }
};

class Derived : public Base {
public:
    void display() override {
        std::cout << "Derived display" << std::endl;
    }
};
```

1. Analiza la vtables. ¿En qué parte de la memoria se encuentran las vtable de cada objeto?

```cpp
Base b;
Derived d;
std::cout << "Vtable de Base: " << *(void**)&b << std::endl;
std::cout << "Vtable de Derived: " << *(void**)&d << std::endl;
```

1. Usar un depurador: observar cómo se resuelven las llamadas a métodos virtuales en tiempo de ejecución. Puedes usar para ello varias herramientas del depurador. En el menú Debug de Visual Studio, selecciona Windows y luego Memory. Allí podrás explorar la memoria. Si das click derecho sobre una función del código puedes ver el programa en ensamblador con Go to Dissasembly.
- ¿Cómo afecta la presencia de métodos virtuales al tamaño del objeto?
- ¿Qué papel juegan las vtables en el polimorfismo?
- Prompt para ChatGPT: ¿Cómo se implementan los métodos virtuales en C++? Explica el concepto de vtable y cómo se utiliza para resolver llamadas a métodos virtuales.

<aside>
⚠️

**MUY IMPORTANTE**
Confirma las respuestas de ChatGPT experimentando con código y depuradores.

</aside>

![alt text](SESION2.1SAMUEL.jpg)

### Uso de punteros y referencias

Objetivo: explorar cómo los punteros y referencias afectan la gestión de la memoria y la llamada a métodos.

Considera estos pasos:

1. Implementar una clase con punteros a funciones:

```cpp
class FunctionPointerExample {
public:
    void (*funcPtr)();
    static void staticFunction() {
        std::cout << "Static function called" << std::endl;
    }
    void assignFunction() {
        funcPtr = staticFunction;
    }
};
```

1. Analizar el impacto en memoria:
- Observar si el tamaño de la instancia cambia al usar punteros a funciones.
- Verificar cómo se almacenan estos punteros.
1. Reflexión Guiada:
- ¿Cuál es la relación entre los punteros a métodos y la vtable?
- ¿Cómo afectan estos mecanismos al rendimiento del programa?
- Prompt para ChatGPT: ¿Qué diferencia hay entre punteros a funciones y punteros a métodos miembro en C++? ¿Cómo afectan al tamaño de los objetos y al rendimiento?