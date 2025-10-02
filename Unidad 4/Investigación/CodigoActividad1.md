### Actividad 1:

En esta actividad vas a experimentar con una aplicación interactiva y listas enlazadas El siguiente código código además incluye la gestión de memoria.

ofApp.h:

```cpp

#pragma once
#include "ofMain.h"

class Node {
public:
    float x, y;
    Node* next;
    
    Node(float _x, float _y);
    ~Node();
};

class LinkedList {
public:
    Node* head;
    Node* tail;
    int size;

    LinkedList();
    ~LinkedList();
    
    void clear();
    void addNode(float x, float y);
    void update(float x, float y);
    void display();
};

class ofApp : public ofBaseApp {
public:
    LinkedList snake;
    void setup();
    void update();
    void draw();
    void keyPressed(int key);  // Nueva función para manejar el teclado
};

```

ofApp.cpp:

```cpp

#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
    // Añadir nodos a la serpiente
    ofBackground(255, 255, 255);
    for (int i = 0; i < 10; i++) {
        snake.addNode(ofGetWidth() / 2, ofGetHeight() / 2);
    }
}
//--------------------------------------------------------------
void ofApp::update() {
    // Actualizar la posición de la serpiente
    snake.update(ofGetMouseX(), ofGetMouseY());
}
//--------------------------------------------------------------
void ofApp::draw() {
    ofBackground(220);
    // Dibujar la serpiente
    snake.display();
}
//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
    if (key == 'c') {
        snake.clear();  // Limpiar explícitamente la lista cuando se presiona la tecla 'c'
    }
}
//--------------------------------------------------------------

LinkedList::LinkedList() {
    head = new Node(ofGetWidth() / 2, ofGetHeight() / 2);
    tail = head;
    size = 1;
}
//--------------------------------------------------------------
LinkedList::~LinkedList() {
    clear();
}
//--------------------------------------------------------------
void LinkedList::clear() {
    Node* current = head;
    while (current != nullptr) {
        Node* nextNode = current->next;
        delete current;
        current = nextNode;
    }
    head = nullptr;
    tail = nullptr;
    size = 0;
}
//--------------------------------------------------------------
void LinkedList::addNode(float x, float y) {
    Node* newNode = new Node(x, y);
    if (tail != nullptr) {
        tail->next = newNode;
        tail = newNode;
    } else {
        head = tail = newNode;
    }
    size++;
}
//--------------------------------------------------------------
void LinkedList::update(float x, float y) {
    Node* current = head;
    float prevX = x;
    float prevY = y;

    while (current != nullptr) {
        float tempX = current->x;
        float tempY = current->y;
        current->x = prevX;
        current->y = prevY;
        prevX = tempX;
        prevY = tempY;
        current = current->next;
    }
}
//--------------------------------------------------------------
void LinkedList::display() {
    Node* current = head;
    while (current != nullptr) {
        ofSetColor(ofColor(255,0,0));
        ofDrawCircle(current->x, current->y, 10);
        current = current->next;
    }
}
//--------------------------------------------------------------
Node::Node(float _x, float _y) {
    x = _x;
    y = _y;
    next = nullptr;
}
//--------------------------------------------------------------
Node::~Node() {
    // Destructor para Node (si hay recursos adicionales)
}

```