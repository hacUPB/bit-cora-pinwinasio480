### ANALISIS DE MEMORIA

1. **Investiga:** investiga cómo se gestionan los vectores de `ofVec3f` en C++. ¿Dónde se almacenan? ¿En qué parte de la memoria se guardan los objetos y cómo se gestionan?

Los vectores de ofVec3f en C++ se gestionan haciendo uso de una la clase estándar std::vector. Los objetos que contiene se almacenan en una memoria dinámica (heap). La gestión de memoria es automática: cuando el vector necesita crecer, reserva más espacio en el heap y copia los elementos existentes a la nueva ubicación. Cuando el vector se destruye, libera automáticamente la memoria reservada, sin que el usuario tenga que intervenir por si mismo.

2. **Experimenta:** utiliza el depurador de Visual Studio para examinar la memoria de la aplicación en tiempo de ejecución. Observa en qué parte de la memoria se encuentran los objetos (`stack`, `heap`, memoria global).

Los objetos en heap se almacenan en:

```cpp

+		[Vista sin formato]	{_Myval2={_Myfirst=0x000000000d0ed280 {x=-640.000000 r=-640.000000 s=-640.000000 ...} _Mylast=0x000000000d0ee4c8 {...} ...} }	std::_Compressed_pair<std::allocator<glm::vec<3,float,0>>,std::_Vector_val<std::_Simple_types<glm::vec<3,float,0>>>,1>

 ```

 Esto debido a que stb::vector reserva espacio por medio de un new, y en los campos _Myfirst (0x000000000d1260c0 (dirección de inicio del bloque de memoria en el que se almacenan los valores)) y _Mylast (0x000000000d127308 (dirreción despues del último elemento válido)): dirección de inicio del bloque de memoria donde se almacenan los vectores.
 Es importante recalcar que si el vector fue declarado de forma local, este se almacenara en el stack, mientras que si se hace con un new, este se almacenara en el heap.

3. **Documenta:** documenta tus hallazgos en un informe breve, explicando qué descubriste sobre la gestión de la memoria en tu aplicación.

Mientras hacia la depuración y ponia un punto de interrupción en esta linea:

```cpp

const auto & p = spherePositions[i];

```
pude descubrir que la cantidad de objetos mencionados en con un número estan presentes, además de que mientras hacia el proceso, pude identificar que la cantidad de esferas creadas que hay en el programa son 390, y que 432 es la cantidad de memoria pedida por el programa para hacer esa cantidad de esferas, todo esto contenido en el vector spherePositions.