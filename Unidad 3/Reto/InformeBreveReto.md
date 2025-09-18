### Informe sobre el programa (memoria)

Las posiciones de las esferas se almacenan en:

```cpp

std::vector<glm::vec3> spherePositions;

```

Es importante aclarar que mientras que spherePositions se guarda en el stack,  la memoria interna <glm::vec3> se guarda en el heap. Por ejemplo, cuando uso : 

```cpp

spherePositions.emplace_back(x, y, z);

```

, se reserva un espacio en el heap para guardar en la memoria interna.

Además, las variables simples como xStep, yStep, selectedIndex, selectedPoint, entre otras, se guardan en la stack debido a que pertenecen al objeto ofApp del stack del main(). Se puede decir que cuando modificamos el valor de la grafica con el teclado (por medio del metodo keyPressed) se estan cambiando los datos de la stack.

En funciones como rayIntersectsSphere y convertMouseToRay, la variables a, b , c que se encuentran como float por ejemplo, son creadas temporalmente en la stack cada que la función se llama y cuando esta finaliza, desaparecen.

Algo tambien a tomar en cuenta, es que objetos graficos como ofColor, ofSetColor y ofDrawSphere no se guardan permanentemente en la memoria, sino que solo se encuentran visibles en la stack mientras se dibuja cada frame.
