### **Reto**

Vas a desarrollar una aplicación que genere una cuadrícula de esferas en un espacio tridimensional y que permita interactuar con ellas a través de la cámara y el ratón. Deberás implementar la lógica para seleccionar una esfera con el ratón y mostrar la información de la esfera seleccionada en la pantalla.

Para calcular el valor en z de cada esfera usa esta función:

```cpp

float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;

```
​
Donde distDiv y amplitud son variables que puedes modificar con el teclado.

Al generar la cuadrícula de esferas puedes usar bucles anidados para recorrer las posiciones:

```cpp

for (int x = -ofGetWidth() / 2; x < ofGetWidth() / 2; x += xStep) {
    for (int y = -ofGetHeight() / 2; y < ofGetHeight() / 2; y += yStep) {

```

Nota que `xStep` y `yStep` son variables que puedes modificar con el teclado. En la imagen que te mostré anteriormente `xStep` y `yStep` tienen el mismo valor.

Para seleccionar una esfera con el mouse:

Puedes usar los siguientes métodos:

```cpp

void ofApp::mousePressed(int x, int y, int button) {
    // Convertir las coordenadas del mouse en un rayo 3D
    glm::vec3 rayStart, rayEnd;
    convertMouseToRay(x, y, rayStart, rayEnd);

    // Comprobar si el rayo intersecta alguna esfera
    sphereSelected = false;
    for (auto& pos : spherePositions) {
        glm::vec3 intersectionPoint;
        if (rayIntersectsSphere(rayStart, rayEnd - rayStart, pos, 5.0, intersectionPoint)) {
            // EN ESTA PARTE Debes adicionar la lógica para indicarle
            // a la aplicación la esfera seleccionada.
        }
    }
}

```
```cpp

void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd) {
    // Obtener matrices de proyección y modelo/vista de la cámara
    glm::mat4 modelview = cam.getModelViewMatrix();
    glm::mat4 projection = cam.getProjectionMatrix();
    ofRectangle viewport = ofGetCurrentViewport();

    // Convertir coordenadas del mouse a Normalized Device Coordinates (NDC)
    float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
    float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;

    // Crear el rayo en NDC
    glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f); // Near plane
    glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);   // Far plane

    // Convertir a coordenadas mundiales
    glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
    glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;

    rayStartWorld /= rayStartWorld.w;
    rayEndWorld /= rayEndWorld.w;

    rayStart = glm::vec3(rayStartWorld);
    rayEnd = glm::vec3(rayEndWorld);
}

// Detectar si el rayo intersecta una esfera
bool ofApp::rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint) {
    glm::vec3 oc = rayStart - sphereCenter;

    float a = glm::dot(rayDir, rayDir);
    float b = 2.0f * glm::dot(oc, rayDir);
    float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;

    float discriminant = b * b - 4 * a * c;

    if (discriminant < 0) {
        return false;
    }
    else {
        float t = (-b - sqrt(discriminant)) / (2.0f * a);
        intersectionPoint = rayStart + t * rayDir;
        return true;
    }
}

```

### **Requisitos de la aplicación**

1. **Generación de esferas:** utiliza bucles anidados para generar posiciones de esferas en una cuadrícula tridimensional. Las posiciones deben almacenarse en un vector de `ofVec3f`.
2. **Interacción con el ratón:** implementa la funcionalidad para seleccionar una esfera con el ratón. Al seleccionar una esfera, debes mostrar sus coordenadas en pantalla.
3. **Interacción con el teclado:** implementa controles básicos para modificar la separación entre esferas, la amplitud de sus posiciones en el eje Z, y otros parámetros visuales.
4. **Visualización:** utiliza una cámara 3D (`ofEasyCam`) para permitir la exploración de la escena desde diferentes ángulos.

1. **Generación de esferas:** utiliza bucles anidados para generar posiciones de esferas en una cuadrícula tridimensional. Las posiciones deben almacenarse en un vector de `ofVec3f`.
2. **Interacción con el ratón:** implementa la funcionalidad para seleccionar una esfera con el ratón. Al seleccionar una esfera, debes mostrar sus coordenadas en pantalla.
3. **Interacción con el teclado:** implementa controles básicos para modificar la separación entre esferas, la amplitud de sus posiciones en el eje Z, y otros parámetros visuales.
4. **Visualización:** utiliza una cámara 3D (`ofEasyCam`) para permitir la exploración de la escena desde diferentes ángulos.

### Análisis de Memoria

Además de implementar la aplicación, debes analizar cómo y dónde se almacenan los datos en la memoria. Para ello:

1. **Investiga:** investiga cómo se gestionan los vectores de `ofVec3f` en C++. ¿Dónde se almacenan? ¿En qué parte de la memoria se guardan los objetos y cómo se gestionan?
2. **Experimenta:** utiliza el depurador de Visual Studio para examinar la memoria de la aplicación en tiempo de ejecución. Observa en qué parte de la memoria se encuentran los objetos (`stack`, `heap`, memoria global).
3. **Documenta:** documenta tus hallazgos en un informe breve, explicando qué descubriste sobre la gestión de la memoria en tu aplicación.

### 📤 **Bitácora**

1. El código fuente de la aplicación.
2. Un breve informe donde expliques el manejo de memoria en tu aplicación, identificando en qué parte de la memoria se encuentran los datos clave.
3. Un enlace a un video corto que muestre funcionando la aplicación.