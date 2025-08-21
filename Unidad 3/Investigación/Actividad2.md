### Actividad 2

//TERMINADA POR AHORA

De nuevo una actividad grupal en la cual escribiremos juntos nuestra primera aplicación y analizaremos las diferentes partes que la componen.
Genera un proyecto con el generador de proyectos de openframeworks.
Abre el proyecto en Visual Studio.
Modifica el archivo ofApp.h así:
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

    public:
        void setup();
        void update();
        void draw();

        void mouseMoved(int x, int y );
        void mousePressed(int x, int y, int button);

    private:

        vector<ofVec2f> particles;
        ofColor particleColor;

};

Ahora modifica el archivo ofApp.cpp así:

#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
    particleColor = ofColor::white;
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    for(auto &pos: particles){
        ofSetColor(particleColor);
        ofDrawCircle(pos.x, pos.y, 50);
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
    particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}

Analicemos juntos este código:

- ¿Qué fue lo que incluimos en el archivo .h?

Se incluyo un void setup, un update, asi como draw, mouse moved, pressed. Además de veector of vec2f y of color.

- ¿Cómo funciona la aplicación?

Se generan esferas blancas que van siguiendo el movimiento del mouse. En si, se generan 50 esferas, y si la cantidad es mayor a 100, las esferas anteriores se borran y generan nuevas.

- ¿Qué hace la función mouseMoved?

Provoca que las esferas sigan el movimiento del mouse.

- ¿Qué hace la función mousePressed?

Cambia el color de las esferas, aunque por más que se haga click, estas no volveran al color original (blanco).

- ¿Qué hace la función setup?

Elige el color por defecto del fondo y las esferas (en este caso, fondo negro y esferas blancas).

- ¿Qué hace la función update?

Actualiza el programa.

- ¿Qué hace la función draw?

Dibuja las esferas.