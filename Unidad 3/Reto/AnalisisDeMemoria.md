### ANALISIS DE MEMORIA

1. **Investiga:** investiga cómo se gestionan los vectores de `ofVec3f` en C++. ¿Dónde se almacenan? ¿En qué parte de la memoria se guardan los objetos y cómo se gestionan?



2. **Experimenta:** utiliza el depurador de Visual Studio para examinar la memoria de la aplicación en tiempo de ejecución. Observa en qué parte de la memoria se encuentran los objetos (`stack`, `heap`, memoria global).

Los objetos en heap se almacenan en:

```cpp

+		[Vista sin formato]	{_Myval2={_Myfirst=0x000000000d0ed280 {x=-640.000000 r=-640.000000 s=-640.000000 ...} _Mylast=0x000000000d0ee4c8 {...} ...} }	std::_Compressed_pair<std::allocator<glm::vec<3,float,0>>,std::_Vector_val<std::_Simple_types<glm::vec<3,float,0>>>,1>

 ```

 Esto debido a que stb::vector reserva espacio por medio de un new, y en los campos _Myfirst (0x000000000d1260c0 (dirección de inicio del bloque de memoria en el que se almacenan los valores)) y _Mylast (0x000000000d127308 (dirreción despues del último elemento válido)): dirección de inicio del bloque de memoria donde se almacenan los vectores.
 Es importante recalcar que si el vector fue declarado de forma local, este se almacenara en el stack, mientras que si se hace con un new, este se almacenara en el heap.

3. **Documenta:** documenta tus hallazgos en un informe breve, explicando qué descubriste sobre la gestión de la memoria en tu aplicación.