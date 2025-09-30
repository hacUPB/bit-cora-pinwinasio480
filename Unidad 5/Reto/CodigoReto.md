## OfApp.h:

```cpp

#pragma once
#include "ofMain.h"

// -------------------- Clase base --------------------
class Shape {
protected:
	ofPoint pos;
	ofColor color;
	float size;

public:
	Shape(ofPoint _pos, ofColor _color, float _size)
		: pos(_pos)
		, color(_color)
		, size(_size) {
	}

	virtual void draw() = 0;
	virtual ~Shape() {}
};

// -------------------- Círculo --------------------
class Circle : public Shape {
public:
	Circle(ofPoint _pos, ofColor _color, float _size)
		: Shape(_pos, _color, _size) {
	}

	void draw() override {
		ofSetColor(color);
		ofDrawCircle(pos, size);
	}
};

// -------------------- Cuadrado --------------------
class Square : public Shape {
public:
	Square(ofPoint _pos, ofColor _color, float _size)
		: Shape(_pos, _color, _size) {
	}

	void draw() override {
		ofSetColor(color);
		ofDrawRectangle(pos.x - size / 2, pos.y - size / 2, size, size);
	}
};

// -------------------- Triángulo --------------------
class Triangle : public Shape {
public:
	Triangle(ofPoint _pos, ofColor _color, float _size)
		: Shape(_pos, _color, _size) {
	}

	void draw() override {
		ofSetColor(color);
		ofDrawTriangle(pos.x, pos.y - size / 2,
			pos.x - size / 2, pos.y + size / 2,
			pos.x + size / 2, pos.y + size / 2);
	}
};

// -------------------- ofApp --------------------
class ofApp : public ofBaseApp {
public:
	void setup();
	void update();
	void draw();

	void keyPressed(int key);
	void mousePressed(int x, int y, int button);

	vector<Shape*> shapes; // Vector de punteros normales
	int currentShape; // 0=circle, 1=square, 2=triangle
	ofColor currentColor;

	~ofApp(); // destructor para liberar memoria
};

```

## OfApp.cpp:

```cpp

#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	ofBackground(0);
	currentShape = 0;
	currentColor = ofColor::fromHsb(ofRandom(255), 200, 255);
}

//--------------------------------------------------------------
void ofApp::update() {
}

//--------------------------------------------------------------
void ofApp::draw() {
	for (auto& s : shapes) {
		s->draw();
	}
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == 'f') { // Cambiar figura
		currentShape = (currentShape + 1) % 3;
	}
	else if (key == 'c') { // Cambiar color
		currentColor = ofColor::fromHsb(ofRandom(255), 200, 255);
	}
	else if (key == 'b') { // Borrar todas las figuras
	 shapes.clear(); // ¡Limpia el vector completo!
	}
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
	ofPoint pos(x, y);

	if (currentShape == 0) {
		shapes.push_back(new Circle(pos, currentColor, 40));
	}
	else if (currentShape == 1) {
		shapes.push_back(new Square(pos, currentColor, 50));
	}
	else if (currentShape == 2) {
		shapes.push_back(new Triangle(pos, currentColor, 60));
	}
}

//--------------------------------------------------------------
// Destructor: libera memoria
ofApp::~ofApp() {
	for (auto& s : shapes) {
		delete s;
	}
	shapes.clear();
}

```


## Main.cpp:

```cpp

#include "ofMain.h"
#include "ofApp.h"

//========================================================================

int main() {
	ofSetupOpenGL(800, 600, OF_WINDOW);
	ofRunApp(new ofApp());
}

```
