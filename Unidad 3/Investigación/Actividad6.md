### Actividad 6

//TERMINADO

El código anterior tiene un problema. ¿Puedes identificar cuál es? ¿Cómo lo solucionarías? Recuerda que deberías poder seleccionar una esfera y moverla con el mouse.

El problema era que cuando seleccionaba una esfera, esta no se me despegaba del mouse, y al seleccionar otra, ya no me dejaba seleccionar más esferas. El problema era en que hacia falta la función mouseReleased(), al tener esta función, si yo puedo mover las esferas que yo desee con el mouse siempre y cuando mantenga click, dejo aqui adjunto el codigo completo del ofApp.h y ofApp.cpp:

ofApp.h:

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

    void mouseMoved(int x, int y);
    void mousePressed(int x, int y, int button);
    void mouseReleased(int x, int y, int button);

private:

    vector<Sphere*> spheres;
    Sphere* selectedSphere;
};


ofApp.cpp:

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
void ofApp::draw() {
    for (auto sphere : spheres) {
        sphere->draw();
    }
}

//--------------------------------------------------------------
 void ofApp::mouseMoved(int x, int y) {

    }

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

    if (button == OF_MOUSE_BUTTON_LEFT) {
        for (auto sphere : spheres) {
            float distance = ofDist(x, y, sphere->getX(), sphere->getY());
            if (distance < sphere->getRadius()) {

                selectedSphere = sphere;
                break;
            }
        }
    }
}

//--------------------------------------------------------------

void ofApp::mouseReleased(int x, int y, int button) {
    if (button == OF_MOUSE_BUTTON_LEFT) {
        selectedSphere = nullptr;  
    }
}