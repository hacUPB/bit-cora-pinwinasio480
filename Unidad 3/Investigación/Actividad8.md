### Actividad 8

Construye un experimento (un programa) en el que puedas crear y dibujar objetos que se almacenan:

- En el `heap`.
- En el `stack`.
- En memoria global.

**Nota**

sí puedes usar el `stack,`pero recuerda que los objetos solo dudarán en el `stack` el tiempo que dure la función que los creó. ¿Hay alguna función en el programa que dure durante toda la ejecución del programa?

- ¿Cuándo debo crear objetos en el `heap` y cuándo en memoria global?

app.h:

```cpp

#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void createinStack();
		void createinHeap();

		std::vector<glm::vec3> spherePositions; // esferas creadas en stack
		glm::vec3 * sphereInHeap = nullptr; // esfera en heap

		int selectedIndex = -1; // índice seleccionado
		bool sphereSelected = false;

		float sphereRadius = 20.0f; // radio de las esferas
		
};

```

app.cpp:

```cpp

#include "ofApp.h"


struct Object {
	string name;
	Object(string n)
		: name(n) { }
	void draw() { cout << "Drawing" << name << endl; }
};

Object global("Global");

//--------------------------------------------------------------
void ofApp::setup(){

}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){

	ofBackground(220);

	// Global -> círculo rojo
	ofSetColor(255, 0, 0);
	ofDrawCircle(200, 200, 40);

	// Stack -> círculo verde
	ofSetColor(0, 255, 0);
	ofDrawCircle(400, 200, 40);

	// Heap -> círculo azul
	ofSetColor(0, 0, 255);
	ofDrawCircle(600, 200, 40);

	// También se imprime en consola
	global.draw();
	createinStack();
	createinHeap();
}

//--------------------------------------------------------------
void ofApp::createinStack(){

	Object local("Stack"); // vive solo mientras dure esta función
	local.draw();

}

//--------------------------------------------------------------
void ofApp::createinHeap(){

	 Object * dynamic = new Object("Heap"); // vive hasta que hagas delete
	dynamic->draw();
	delete dynamic; // liberar memoria

}

//--------------------------------------------------------------

```