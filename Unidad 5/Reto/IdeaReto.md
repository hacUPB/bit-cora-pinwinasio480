## Idea para el reto 
"FIGURAS Y COLORES" 

Mi idea para el reto, consiste en diseñar un programa en el que desde openFrameWorks el usuario pueda crear atraves de figuras (como circulos, cuadrados o triangulos) diferentes composicines visuales. Cada figura se dibujaria con un clic del mouse en la posición seleccionada, mientras que al mismo tiempo, si se presiona una tecla específica, con una se podra cambiar las figuras y con la otra, los colores de las mismas figuras a dibujar.

Aplicación de la Programación Orientada a Objetos

Encapsulamiento: cada figura es un objeto independiente que contiene sus propios atributos (posición, color, tamaño) y métodos (draw()), controlando internamente su comportamiento.

Herencia: se define una clase base Shape de la cual derivan las clases Circle, Square y Triangle, compartiendo atributos comunes pero diferenciándose en la implementación de sus métodos de dibujo.

Polimorfismo: todas las figuras se almacenan en una misma colección (vector), y gracias al uso de métodos virtuales cada una se dibuja según su tipo concreto, demostrando cómo la vtable permite resolver las llamadas a draw() en tiempo de ejecución.

Justificación

Este proyecto convierte los principios de la programación orientada a objetos en una experiencia creativa tangible: cada figura generada no solo representa un elemento visual, sino también una abstracción de datos y comportamientos organizados en memoria. Documentar el proceso permitirá reflexionar sobre cómo los conceptos de encapsulamiento, herencia y polimorfismo no son únicamente teoría, sino herramientas fundamentales para estructurar sistemas complejos y expresivos.