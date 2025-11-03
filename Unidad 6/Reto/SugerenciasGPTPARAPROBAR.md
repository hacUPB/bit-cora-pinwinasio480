## Anexo de pruebas sugeridas para verificar el funcionamiento del programa 

🧠 Paso 1. Pruebas unitarias simples (por patrón)

Aquí no necesitas librerías de testing.
Puedes hacer pruebas visuales o de consola (cout/ofLog) para confirmar el comportamiento esperado.

🧱 1. Prueba del patrón Observer

1. 🧩 Propósito: verificar que los triángulos reaccionan a eventos globales (notify).

Cómo probarlo:

Ejecuta la aplicación.

Presiona las teclas:

P → todos los triángulos deben empezar a "latir" (cambiar su tamaño cíclicamente).

S → todos se encogen.

B → todos crecen.

R → todos rotan.

N → vuelven al tamaño normal.

1.2 Agrega una línea de log para evidenciar el cambio:

void Triangle::onNotify(const std::string& event) {
    ofLogNotice() << "Triangle recibió evento: " << event;
    if (event == "normal") setState(new NormalState());
    else if (event == "pulse") setState(new PulseState());
    else if (event == "small") setState(new SmallState());
    else if (event == "big") setState(new BigState());
    else if (event == "rotate") setState(new RotateState());
}


Muestra la consola (F1 en algunos IDEs) y toma captura del log:

[notice ] Triangle recibió evento: pulse
[notice ] Triangle recibió evento: pulse
[notice ] Triangle recibió evento: pulse
...


✅ Resultado esperado: todos los triángulos responden al mismo evento, lo que confirma que el Observer funciona.

🎨 2. Prueba del patrón State

🧩 Propósito: verificar que los triángulos cambian de comportamiento al cambiar de estado.

Cómo probarlo:

Inicia con estado Normal.

Pulsa P, S, B o R y observa el cambio visual (animación, rotación, escalado).

Agrega logs dentro de cada update() de estado:

void RotateState::update(Triangle* triangle) {
    triangle->rotation += 2.0f;
    ofLogVerbose() << "Rotando, ángulo actual: " << triangle->rotation;
}


Captura en el log cómo el valor de rotación cambia constantemente.

✅ Resultado esperado: cada estado aplica un comportamiento distinto (verificable visualmente o por consola).

🏭 3. Prueba del patrón Factory

🧩 Propósito: confirmar que los triángulos creados por la fábrica tienen colores distintos según su tipo.

Cómo probarlo:

Muestra en consola el tipo y los colores:

Triangle* t = TriangleFactory::createTriangle(type);
ofLogNotice() << "Creado triángulo tipo: " << type
              << " Color1: " << t->color1
              << " Color2: " << t->color2;


Al iniciar la app, revisa el log:

[notice ] Creado triángulo tipo: rainbow Color1: (120,255,255)
[notice ] Creado triángulo tipo: blue Color1: (0,0,255)
[notice ] Creado triángulo tipo: fire Color1: (255,100,0)


✅ Resultado esperado: cada tipo tiene una paleta diferente, confirmando que la fábrica funciona.

🌍 Paso 2. Prueba de integración (la aplicación completa)

🧩 Propósito: garantizar que todos los patrones funcionan juntos.

Cómo probarlo:

Ejecuta la aplicación final con todos los triángulos en pantalla.

Interactúa con el teclado para enviar notificaciones.

Observa cómo todos los triángulos cambian de estado en tiempo real.

Confirma que no hay errores en consola ni fugas de memoria al cerrar.

✅ Resultado esperado:

Los triángulos responden a los eventos del teclado.

Las animaciones se comportan correctamente.

No hay cierres inesperados ni errores al salir.

📹 Paso 3. Evidencias visuales para entregar

Para tu informe o presentación:

🎥 Graba un video corto (1–2 min):

Muestra la app en ejecución.

Presiona las teclas (P, B, S, R, N).

Explica brevemente qué patrón se está viendo en acción.

📸 Capturas de pantalla:

Una con los triángulos en “pulse”.

Una con los triángulos rotando.

Una del log de consola mostrando los eventos recibidos.

📝 Explicación corta por patrón:

Qué se probó.

Qué se esperaba.

Qué resultado se obtuvo.
Ejemplo:

Prueba del patrón Observer:
- Entrada: tecla P (evento "pulse")
- Resultado esperado: todos los triángulos cambian al estado de pulso.
- Resultado obtenido: correcto. Todos los triángulos aumentan y disminuyen su tamaño de forma sincronizada.

📋 Ejemplo de resumen para tu entrega

RAE2 – Pruebas del software

Patrón	Qué se probó	Evidencia	Resultado
Observer	Reacción de los triángulos a eventos globales	Captura del log Triangle recibió evento: pulse	Correcto
State	Cambios de comportamiento según el estado	Video mostrando animación de pulso y rotación	Correcto
Factory	Creación con colores distintos por tipo	Log de consola con tipos y colores	Correcto
Integración	Interacción total y sin errores	Video general y cierre limpio	Correcto