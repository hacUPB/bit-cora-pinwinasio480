### Actividad 5

//TERMINADO POR AHORA

En la unidad anterior introdujimos el concepto de puntero. Ahora vamos a profundizar en este concepto de manera práctica.

El siguiente ejemplo se supone (en la actividad que sigue vas a corregir un error) que te permite seleccionar una esfera y moverla con el mouse.

Modifica el archivo `ofApp.h` de la siguiente manera:

#pragma once

#include "ofMain.h"


class Sphere {
public:
    Sphere(float x, float y, float radius);
    void draw();
    void update(float x, float y);
    float getX();
    float getY();
    float getRadius();

private:
    float x, y;
    float radius;
    ofColor color;
};

class ofApp : public ofBaseApp{

    public:
        void setup();
        void update();
        void draw();

        void mouseMoved(int x, int y );
        void mousePressed(int x, int y, int button);

    private:

        vector<Sphere*> spheres;
        Sphere* selectedSphere;
};
​
Y el archivo ofApp.cpp así:

#include "ofApp.h"

Sphere::Sphere(float x, float y, float radius) : x(x), y(y), radius(radius) {
    color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}

void Sphere::draw() {
    ofSetColor(color);
    ofDrawCircle(x, y, radius);
}

void Sphere::update(float x, float y) {
    this->x = x;
    this->y = y;
}

float Sphere::getRadius() {
    return radius;
}

float Sphere::getX() {
    return x;
}

float Sphere::getY() {
    return y;
}

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);

    for (int i = 0; i < 5; i++) {
        float x = ofRandomWidth();
        float y = ofRandomHeight();
        float radius = ofRandom(20, 50);
        spheres.push_back(new Sphere(x, y, radius));
    }
    selectedSphere = nullptr;

}

//--------------------------------------------------------------
void ofApp::update(){
    if (selectedSphere != nullptr) {
        selectedSphere->update(ofGetMouseX(), ofGetMouseY());
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    for (auto sphere : spheres) {
        sphere->draw();
    }
}


//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

    if(button == OF_MOUSE_BUTTON_LEFT){
        for (auto sphere : spheres) {
            float distance = ofDist(x, y, sphere->getX(), sphere->getY());
            if (distance < sphere->getRadius()) {

                selectedSphere = sphere;
                break;
            }
        }
    }
}
​
¿Cuál es la definición de un puntero?

Un puntero en C++ se refiere a una variable encargada de almacenar la dirección de memoria otra variable, siendo util para acceder y manipular el valor almacenado en esa dirección.

¿Dónde está el puntero?

El puntero se encuentra ubicado en la clase ofApp.h, estando declarada asi:

vector<Sphere*> spheres;
Sphere* selectedSphere;

¿Cómo se inicializa el puntero?

Al ya tener la declaración de los punteros como se ve en la pregunta anterior, en un metodo setup(), el puntero se inicializa con nullptr

selectedSphere = nullptr

¿Para qué se está usando el puntero?

En el caso de este ejercicio, el puntero se esta utilizando para apuntar a la esfera selecccionada, de manera en que el esa esfera pueda ser movida con el mouse. Mientras que el vector almacena punteros a todas las esferas creadas.

¿Qué es exactamente lo que está almacenado en el puntero?

Esta almacenando la dirección de memoria de un objeto Sphere, es decir, no almacena la esfera, sino una referencia a donde esta siendo guardada.


