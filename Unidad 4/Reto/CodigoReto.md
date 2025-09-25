ofApp.h:

```cpp

#pragma once
#include "ofMain.h"

// Nodo de rectángulo
class RectNode {
public:
	ofRectangle rect;
	ofVec2f dir;
	float speed;
	ofColor color;
	float alpha;
	RectNode * next;

	RectNode(float x, float y, int c) {
		rect.set(x, y, 50, 30);
		dir.set(ofRandom(-1, 1), ofRandom(-1, 1));
		dir.normalize();
		speed = 2.0;
		color = (c == 0 ? ofColor::red : ofColor::blue);
		alpha = 255;
		next = nullptr;
	}
};

// Lista enlazada de rectángulos
class ListaRectangulos {
private:
	RectNode * head;
	int size;
	int maxSize;

public:
	ListaRectangulos(int maxN = 10) {
		head = nullptr;
		size = 0;
		maxSize = maxN;
	}

	~ListaRectangulos() { clear(); }

	RectNode * agregar(float x, float y, int c) {
		if (size >= maxSize) eliminarUltimo();
		RectNode * nuevo = new RectNode(x, y, c);
		nuevo->next = head;
		head = nuevo;
		size++;
		return nuevo; // devolvemos puntero para pila
	}

	void actualizar(float factorVel) {
		RectNode * actual = head;
		while (actual != nullptr) {
			actual->rect.x += actual->dir.x * actual->speed * factorVel;
			actual->rect.y += actual->dir.y * actual->speed * factorVel;

			// Rebote estilo DVD
			if (actual->rect.x <= 0 || actual->rect.x + actual->rect.width >= ofGetWidth())
				actual->dir.x *= -1;
			if (actual->rect.y <= 0 || actual->rect.y + actual->rect.height >= ofGetHeight())
				actual->dir.y *= -1;

			actual = actual->next;
		}
	}

	void display() {
		RectNode * actual = head;
		while (actual != nullptr) {
			ofSetColor(actual->color, actual->alpha);
			ofDrawRectangle(actual->rect);
			actual = actual->next;
		}
	}

	void aparecer() {
		RectNode * actual = head;
		while (actual != nullptr) {
			if (actual->alpha > 0) actual->alpha += 5;
			actual = actual->next;
		}
	}

	void desvanecer() {
		RectNode * actual = head;
		while (actual != nullptr) {
			if (actual->alpha > 0) actual->alpha -= 5;
			actual = actual->next;
		}
	}

	void eliminarUltimo() {
		if (head == nullptr) return;
		if (head->next == nullptr) {
			delete head;
			head = nullptr;
			size--;
			return;
		}
		RectNode * actual = head;
		while (actual->next->next != nullptr) {
			actual = actual->next;
		}
		delete actual->next;
		actual->next = nullptr;
		size--;
	}

	void eliminarEspecifico(RectNode * nodo) {
		if (!head || !nodo) return;
		if (head == nodo) {
			RectNode * temp = head;
			head = head->next;
			delete temp;
			size--;
			return;
		}
		RectNode * actual = head;
		while (actual->next && actual->next != nodo) {
			actual = actual->next;
		}
		if (actual->next == nodo) {
			RectNode * temp = actual->next;
			actual->next = temp->next;
			delete temp;
			size--;
		}
	}

	void clear() {
		while (head != nullptr) {
			RectNode * temp = head;
			head = head->next;
			delete temp;
		}
		size = 0;
	}
};

// ----------- Nueva clase: Pila ----------------
class PilaRectangulos {
private:
	std::vector<RectNode *> pila; // usamos vector como contenedor
public:
	void push(RectNode * nodo) { pila.push_back(nodo); }
	RectNode * pop() {
		if (pila.empty()) return nullptr;
		RectNode * ultimo = pila.back();
		pila.pop_back();
		return ultimo;
	}
	bool empty() { return pila.empty(); }
};

// Clase principal de la app
class ofApp : public ofBaseApp {
public:
	ListaRectangulos lista;
	PilaRectangulos pila; // NUEVO
	float factorVelocidad = 1.0;

	void setup();
	void update();
	void draw();
	void keyPressed(int key);
};

```

ofApp.cpp:

```cpp

#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	ofSetBackgroundColor(0);
}

//--------------------------------------------------------------
void ofApp::update() {
	lista.actualizar(factorVelocidad);
}

//--------------------------------------------------------------
void ofApp::draw() {
	lista.display();
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == 'r') {
		RectNode * nodo = lista.agregar(ofRandomWidth(), ofRandomHeight(), 0);
		pila.push(nodo);
	} else if (key == 'b') {
		RectNode * nodo = lista.agregar(ofRandomWidth(), ofRandomHeight(), 1);
		pila.push(nodo);
	} else if (key == OF_KEY_UP) {
		factorVelocidad *= 1.1;
	} else if (key == OF_KEY_DOWN) {
		factorVelocidad *= 0.9;
	} else if (key == 'c') {
		lista.desvanecer();
	} else if (key == 'v') {
		lista.aparecer();
	} else if (key == 'z') {
		// Deshacer: sacar último rectángulo de la pila y borrarlo de la lista
		RectNode * nodo = pila.pop();
		if (nodo) lista.eliminarEspecifico(nodo);
	}
}

```

main.cpp:

```cpp

#include "ofApp.h"
#include "ofMain.h"

//========================================================================
int main() {

	//Use ofGLFWWindowSettings for more options like multi-monitor fullscreen
	ofGLWindowSettings settings;
	settings.setSize(1024, 768);
	settings.windowMode = OF_WINDOW; //can also be OF_FULLSCREEN

	auto window = ofCreateWindow(settings);

	ofRunApp(window, make_shared<ofApp>());
	ofRunMainLoop();
}

``` 