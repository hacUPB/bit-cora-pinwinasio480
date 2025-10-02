### Sesión 1: profundización teórica de patrones de diseño

A continuación, te presentaré los recursos teóricos para cada patrón. Estudia cada uno detenidamente y conversa con ChatGPT sobre ellos. Puedes hacer preguntas, pedir ejemplos y aclarar tus dudas.

#### Puntos clave que estoy evidenciando en las fuentes (enlace y video)

- En el ejemplo de la página, cuando tengo una plataforma en el que uso un sistema de transporte y me pide otro medio, dentro de la misma interfaz debo separar ambos transportes en subclases, ambas devuelven el objetos diferentes siempre y cuando tengan la misma interfaz base.

#### Patrones:

- Cadenas de responsabilidad:
- Comando: 
- Itinerador: 
- Mediador: 
- Recuerdo: Guarda y restaura el estado anterior de un objeto sin revelación de detalles.
- Observador: El ejemplo de las suscripciones, cuando estoy suscrito a algo, me notificara, de lo contrario, esto no pasara, como con los canales de YouTube,
- Estado: Altera el comportamiento de un objeto si se cambia su estado interno.
- Estrategia: Definir una familia de algoritmos con clases diferentes pero con objetos intercambiables.
- Método de plantilla: Define el patrón de un algortimo en una superclase, pero se puede anular pasos en las subclases sin alterar la estructura.
- Visitante: Separa algortimos de los objetos que operan.

#### Preguntas y respuestas hacia ChatGPT

#### Patrones de observación

Ejemplos de suscripción

las notificaciones llegan desde update con el metodo notify, haciendo un buncle con foreach