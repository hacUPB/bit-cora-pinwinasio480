### OFAPP.H:

#pragma once

#include "ofMain.h"
#include <string>
#include <vector>

// -------------------------
// Patrón Observer
// -------------------------
class Observer {
public:
	virtual void onNotify(const std::string& event) = 0;
};

class Subject {
public:
	void addObserver(Observer* observer);
	void removeObserver(Observer* observer);

protected:
	void notify(const std::string& event);

private:
	std::vector<Observer*> observers;
};

// -------------------------
// Patrón State
// -------------------------
class Triangle; // forward declaration

class State {
public:
	virtual void update(Triangle* triangle) = 0;
	virtual void onEnter(Triangle* triangle) {}
	virtual void onExit(Triangle* triangle) {}
	virtual ~State() = default;
};

// -------------------------
// Clase principal Triangle
// -------------------------
class Triangle : public Observer {
public:
	Triangle();
	~Triangle();

	void update();
	void draw();
	void onNotify(const std::string& event) override;
	void setState(State* newState);

	ofVec2f position;
	float size; // tamaño actual (visual)
	float baseSize; // tamaño “base” usado para cálculos (no se acumula)
	float rotation;
	ofColor color1, color2;

	// facilitamos que los estados usen la fase del pulso
	float pulsePhase = 0.0f;

private:
	State* state;
};

// -------------------------
// Estados concretos
// -------------------------
class PulseState : public State {
public:
	void onEnter(Triangle* triangle) override;
	void update(Triangle* triangle) override;
};

class SmallState : public State {
public:
	void update(Triangle* triangle) override;
};

class BigState : public State {
public:
	void update(Triangle* triangle) override;
};

class RotateState : public State {
public:
	void update(Triangle* triangle) override;
};

class NormalState : public State {
public:
	void update(Triangle* triangle) override;
};

// -------------------------
// Patrón Factory
// -------------------------
class TriangleFactory {
public:
	static Triangle* createTriangle(const std::string& type);
};

// -------------------------
// ofApp principal
// -------------------------
class ofApp : public ofBaseApp, public Subject {
public:
	void setup();
	void update();
	void draw();
	void keyPressed(int key);
	void exit(); // limpieza final

private:
	std::vector<Triangle*> triangles;
};


### OFAPP.CPP:

#include "ofApp.h"
#include <algorithm> // para std::remove
#include <cmath> // para sinf si hace falta

// -------------------------
// Subject (Observer pattern)
// -------------------------
void Subject::addObserver(Observer* observer) {
	observers.push_back(observer);
}
void Subject::removeObserver(Observer* observer) {
	observers.erase(std::remove(observers.begin(), observers.end(), observer), observers.end());
}
void Subject::notify(const std::string& event) {
	for (Observer* o : observers)
		if (o) o->onNotify(event);
}

// -------------------------
// Triangle
// -------------------------
Triangle::Triangle() {
	position = ofVec2f(ofRandomWidth(), ofRandomHeight());
	size = ofRandom(20, 60);
	baseSize = size; // guardamos el tamaño base para evitar acumulaciones
	rotation = ofRandom(360);
	color1 = ofColor::fromHsb(ofRandom(255), 255, 255);
	color2 = ofColor::fromHsb(ofRandom(255), 255, 255);
	pulsePhase = ofRandom(0.0f, TWO_PI);
	state = new NormalState();
}
Triangle::~Triangle() {
	if (state) delete state;
}

void Triangle::setState(State* newState) {
	if (state != nullptr) {
		state->onExit(this);
		delete state;
	}
	state = newState;
	if (state != nullptr) {
		state->onEnter(this);
	}
}

void Triangle::update() {
	if (state != nullptr) state->update(this);
}

void Triangle::draw() {
	ofPushMatrix();
	ofTranslate(position);
	ofRotateDeg(rotation);

	// Degradado simple entre dos colores
	ofMesh triMesh;
	triMesh.setMode(OF_PRIMITIVE_TRIANGLES);

	triMesh.addVertex(glm::vec3(0, -size, 0));
	triMesh.addColor(color1);
	triMesh.addVertex(glm::vec3(-size * 0.8, size, 0));
	triMesh.addColor(color2);
	triMesh.addVertex(glm::vec3(size * 0.8, size, 0));
	triMesh.addColor(color1);

	triMesh.draw();

	ofPopMatrix();
}

void Triangle::onNotify(const std::string& event) {
	ofLogNotice() << "Triangle recibió evento: " << event;
	if (event == "normal")
		setState(new NormalState());
	else if (event == "pulse")
		setState(new PulseState());
	else if (event == "small")
		setState(new SmallState());
	else if (event == "big")
		setState(new BigState());
	else if (event == "rotate")
		setState(new RotateState());
}

// -------------------------
// Estados
// -------------------------
void PulseState::onEnter(Triangle* triangle) {
	triangle->pulsePhase = 0.0f; // reiniciamos la fase al entrar
}
void PulseState::update(Triangle* triangle) {
	triangle->pulsePhase += 0.2f;
	float pulse = sinf(triangle->pulsePhase) * 0.5f + 1.0f; // entre 0.5 y 1.5
	triangle->size = ofClamp(triangle->baseSize * pulse, 10.0f, 200.0f);
}

void SmallState::update(Triangle* triangle) {
	float target = triangle->baseSize * 0.5f;
	triangle->size = ofLerp(triangle->size, target, 0.12f);
}

void BigState::update(Triangle* triangle) {
	float target = triangle->baseSize * 1.8f;
	triangle->size = ofLerp(triangle->size, target, 0.08f);
}

void NormalState::update(Triangle* triangle) {
	float target = triangle->baseSize * 1.0f;
	triangle->size = ofLerp(triangle->size, target, 0.10f);
}

void RotateState::update(Triangle* triangle) {
	triangle->rotation += 2.0f;
	if (triangle->rotation > 360) triangle->rotation -= 360;
}

// -------------------------
// Factory
// -------------------------
Triangle* TriangleFactory::createTriangle(const std::string& type) {
	Triangle* t = new Triangle();
	if (type == "rainbow") {
		t->color1 = ofColor::fromHsb(ofRandom(255), 255, 255);
		t->color2 = ofColor::fromHsb(ofRandom(255), 255, 255);
	}
	else if (type == "blue") {
		t->color1 = ofColor(0, 0, 255);
		t->color2 = ofColor(0, 200, 255);
	}
	else if (type == "fire") {
		t->color1 = ofColor(255, 100, 0);
		t->color2 = ofColor(255, 200, 0);
	}
	return t;
}

// -------------------------
// ofApp
// -------------------------
void ofApp::setup() {
	ofBackground(0);
	ofSetFrameRate(60);

	// Empieza con pocos triángulos para pruebas; sube el número después
	for (int i = 0; i < 20; i++) {
		std::string type;
		if (i % 3 == 0)
			type = "rainbow";
		else if (i % 3 == 1)
			type = "blue";
		else
			type = "fire";

		Triangle* t = TriangleFactory::createTriangle(type);
		triangles.push_back(t);
		addObserver(t);
	}
}

void ofApp::update() {
	for (Triangle* t : triangles) {
		if (t) t->update();
	}
}

void ofApp::draw() {
	for (Triangle* t : triangles) {
		if (t) t->draw();
	}

	ofSetColor(255);
	ofDrawBitmapString("Teclas: P = Pulse | B = Big | S = Small | R = Rotate | N = Normal", 10, 20);
	ofDrawBitmapString("Triángulos: " + ofToString(triangles.size()) + "  FPS: " + ofToString(ofGetFrameRate(), 2), 10, 40);
}

void ofApp::keyPressed(int key) {
	if (key == 'n')
		notify("normal");
	else if (key == 'p')
		notify("pulse");
	else if (key == 'b')
		notify("big");
	else if (key == 's')
		notify("small");
	else if (key == 'r')
		notify("rotate");
	else if (key == 'n')
		notify("normal");
}

void ofApp::exit() {
	for (Triangle* t : triangles) {
		delete t;
	}
	triangles.clear();
}