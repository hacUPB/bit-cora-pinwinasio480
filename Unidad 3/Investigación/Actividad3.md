### Actividad 3

Analiza la aplicación anterior. ¿Qué hace cada función? ¿Qué hace cada línea de código?

1. setup():

Inicializa el programa una vez.

- ofBackground(0); : Asigna fondo negro a la pantalla, mientras más alto el número, más claro sera.
- particleColor = ofColor::white; :Asigna el color predeterminado a las esferas, es decir, blanco.

2. update():

Actualiza la logica del programa en cada frame.

3. draw():

Dibuja lo que el usuario ponga en el programa, en este caso, las esferas.

- for(auto &pos: particles):  Recorre las posiciones guardadas en particles con un puntero.

- ofSetColor(particleColor); : Define el color de las esferas, en esta ocasión, el que este almacenado en particleColor.

- ofDrawCircle(pos.x, pos.y, 50); : Dibuja un circulo en la posición pos tanto x como y y con un radio de 50 pixeles.

4. mouseMoved():

El evento que ocurre cuando muevo el mouse, osea, me va generando más esferas al msimo tiempo que muevo el mouse.

- particles.push_back(ofVec2f(x, y)); : Añade al vector particles la posición del mouse.

- if (particles.size() > 100) : Se revisa si el vector (cantidad de esferas) es mayor a 100.

- particles.erase(particles.begin()); : Si se cumple la condición, las esferas iniciales (primer elemento) seran borradas y reemplazadas por las nuevas.


5. mousePressed():

- particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255)); : Cambia el color de las esferas a uno aleatorio con el maximo nivel de saturación (255).

Otro evento el cual, ocurre cuando oprimo click con el mouse, en el cual, si lo oprimo, las esferas cambiaran a un color diferente de blanco.

Realiza un experimento con la aplicación anterior. Modifica alguna parte de su código.

Debido a que no queria complicarme tanto con las modificaciones, hice cambios muy pequeños:

a. Cambie el color del fondo de negro a blanco, pasando de 0 a 255, además de cambiar el color predeterminado de las esferas de blanco a negro, basicamente, colores invertidos a la versión original, esto en setup():

```cpp

	ofBackground(255);
	particleColor = ofColor::black;

```
b. Cambie el tamaño de las esferas, pasando de 50 pixeles a 20 en draw().

```cpp

	for (auto & pos : particles) {
		ofSetColor(particleColor);
		ofDrawCircle(pos.x, pos.y, 20);
	}

```

c. Cuando se hace click, en lugar de cambiar de color aleatoriamente sin volver al original sin importar cuantas veces se hiciera esto, cambie a que solo puede cambiar de color una vez, en este caso, pasando de negro a cian en mousePressed().

```cpp

particleColor = ofColor:: cyan;

```

En todo caso, dejo adjunto el codigo completo del ofApp.h y ofApp.cpp, no pongo el main.cpp ya que se no sufrio modificaciones:

ofApp.h

```cpp

#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

 public:
	void setup();
	void update();
	void draw();

	void mouseMoved(int x, int y);
	void mousePressed(int x, int y, int button);

 private:
	vector<ofVec2f> particles;
	ofColor particleColor;
		
};

```

ofApp.cpp

```cpp

#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

	ofBackground(255);
	particleColor = ofColor::black;

}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){

	for (auto & pos : particles) {
		ofSetColor(particleColor);
		ofDrawCircle(pos.x, pos.y, 20);
	}
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

	 particles.push_back(ofVec2f(x, y));
	if (particles.size() > 100) {
		particles.erase(particles.begin());
	}

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

 particleColor = ofColor:: cyan;

}

//--------------------------------------------------------------

```