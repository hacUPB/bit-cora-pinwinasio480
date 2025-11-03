### REFLEXIÓN (UNIDAD 3 EN GENERAL)

Esta unidad, aunque es de las que más reconozco que he tenido que pedir ayuda a la inteligencia artificial con temas de codigo (especialmente en el reto) o incluso a que me diera explicaciones con algunos conceptos nuevos para comprender algunos métodos que no tenia del todo claros y sus funcionamientos, es hasta ahora la que más se me ha hecho interesante de llevar a cabo.

Usar Project Generator en C++ para crear programas en donde puedo generar figuras en 3D, manipularlas y modificarlas se me hizo impresionante. Asi mismo, ver como defino los métodos en App.h y despues los termino de configurar y establecer en el App.cpp me hizo comprender más las formas en las que se pueden desarollar estos programas con lenguaje de alto nivel.

Ver el como se pueden hacer distintos programas con esferas por ejemplo, ya sea para crearlas al hacer click, hacer que se generen varias mientras siguen el movimiento de mi mouse y poder modificar sus colores mientras se ejecuta el programa, ya sea con o sin depuración, o incluso en el reto viendo como se pueden degradar los colores de la grafica haciendo un mapeo o sabiendo que el limite de saturación para el fondo u objetos es 255, o descubrir que mientras más elementos (esferas) haya en el programa presentes, más caidas de FPS sufrira el programa, fueron mis partes favoritas de esta unidad.

Diria que lo más escencial para el reto, es comprender el funcionamiento de los métodos:

```cpp

	void convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd); 

	bool rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir, 
	const glm::vec3 & sphereCenter, float sphereRadius,
	glm::vec3 & intersectionPoint);

```

Debido a que son los que me permite convertir las coordenadas del mouse e interacción con las esferas se haga desde una perspectiva 3D y no 2D como es por defecto. Además de saber que es gracias a regenerateGrid() que el programa puede actualizarse en cada frame sin problemas, debido a que me regenerar los datos de la cuadricula sin causar fallos.