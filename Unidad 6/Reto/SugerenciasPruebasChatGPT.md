🎯 1. Empieza con pruebas incrementales (parte por parte)

Esto te permitirá detectar errores temprano y entender el comportamiento del código.
Ve por bloques pequeños:

🧩 Paso 1: Probar la clase Triangle

Crea un proyecto vacío y solo copia la clase Triangle (sin Observer, Factory ni State).

En ofApp::setup() crea uno o dos triángulos y dibújalos en pantalla.

Si se ven bien y no hay errores, continúa.

👉 Qué verificas aquí:

Que se dibujen correctamente los triángulos.

Que cambien de color o tamaño sin fallar.

Que no haya errores de punteros o rotaciones raras.

🧩 Paso 2: Agregar el patrón State

Copia las clases State, PulseState, SmallState, BigState y RotateState.

Asegúrate de que Triangle pueda cambiar de estado y que cada estado cambie tamaño/rotación.

Usa teclas directas, por ejemplo:

void ofApp::keyPressed(int key) {
    if (key == 'p') triangle.setState(new PulseState());
}


👉 Qué verificas aquí:

Que los cambios de estado ocurran sin “saltos bruscos”.

Que los triángulos no crezcan infinitamente ni desaparezcan.

Que al presionar distintas teclas, el comportamiento cambie visualmente.

🧩 Paso 3: Integrar el Observer

Crea varios triángulos y haz que hereden de Observer.

Implementa el Subject (ofApp) y usa notify("evento") al presionar teclas.

Comprueba que todos los triángulos cambien de comportamiento a la vez.

👉 Qué verificas aquí:

Que los eventos lleguen correctamente.

Que no haya duplicados (cada triángulo reacciona solo una vez).

Que no se generen errores de memoria al agregar o quitar triángulos.

🧩 Paso 4: Agregar la Factory

Usa TriangleFactory::createTriangle("tipo") para generar triángulos con distintos colores.

Comprueba visualmente que los estilos se distinguen correctamente.

👉 Qué verificas aquí:

Que los colores cambien según el tipo.

Que se puedan crear varios tipos sin errores ni repeticiones extrañas.

📊 2. Pruebas cuantitativas (una vez el sistema completo funciona)

Estas te ayudan a medir rendimiento, estabilidad y consistencia visual.
Aquí van ejemplos prácticos que puedes incluir en tu informe o análisis final 👇

✅ 1. Rendimiento (FPS)

Mide cuántos cuadros por segundo mantiene tu programa con distintos números de triángulos:

void ofApp::draw() {
    for (Triangle* t : triangles) t->draw();
    ofSetColor(255);
    ofDrawBitmapString("FPS: " + ofToString(ofGetFrameRate()), 10, 20);
}


Ejemplo de prueba cuantitativa:

Nº Triángulos	FPS promedio	Observación
10	60	Perfecto
100	57	Leve caída
500	48	Ligeras ralentizaciones
✅ 2. Consumo de CPU o memoria

En Windows puedes abrir el Administrador de tareas → pestaña “Rendimiento”.

Observa el % de CPU con 100, 300, 500 triángulos.

Anota si aumenta mucho o sigue estable.

✅ 3. Sincronización de eventos

Mide el tiempo de respuesta entre presionar una tecla y que todos los triángulos reaccionen.
Puedes registrar un tiempo antes y después:

auto start = ofGetElapsedTimeMillis();
notify("pulse");
auto end = ofGetElapsedTimeMillis();
ofLog() << "Tiempo de reacción: " << (end - start) << " ms";


En openFrameworks, normalmente debe ser <16 ms (1 frame a 60fps).

✅ 4. Variación de tamaño o color (consistencia visual)

Puedes calcular el tamaño promedio de todos los triángulos cada frame:

float avgSize = 0;
for (auto* t : triangles) avgSize += t->size;
avgSize /= triangles.size();
ofLog() << "Tamaño promedio: " << avgSize;


Así puedes comprobar cuantitativamente si el cambio de estado afecta correctamente a todos.

🧠 En resumen
Etapa	Qué haces	Qué mides
Incremental (por partes)	Vas agregando patrones uno a uno	Funcionalidad básica y errores
Cuantitativa	Una vez todo funciona	Rendimiento, estabilidad y coherencia visual