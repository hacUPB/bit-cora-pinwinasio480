ofapp.h
```cpp
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp {
public:
	void setup();
	void update();
	void draw();

	void keyPressed(int key);
	void keyReleased(int key);
	void mouseMoved(int x, int y);
	void mouseDragged(int x, int y, int button);
	void mousePressed(int x, int y, int button);
	void mouseReleased(int x, int y, int button);
	void windowResized(int w, int h);
	void dragEvent(ofDragInfo dragInfo);
	void gotMessage(ofMessage msg);

	ofShader shader;
	ofPlanePrimitive plane;
	ofImage img;
};

```

ofapp.cpp
```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	ofDisableArbTex();
	if (ofIsGLProgrammableRenderer()) {
		shader.load("shadersGL3/shader");
	} else {
		shader.load("shadersGL2/shader");
	}

	img.allocate(80, 60, OF_IMAGE_COLOR);

	plane.set(800, 600, 80, 60);
	plane.mapTexCoordsFromTexture(img.getTexture());
}

//--------------------------------------------------------------
void ofApp::update() {
	float noiseScale = ofMap(mouseX, 0, ofGetWidth(), 0, 0.1);
	float noiseVel = ofGetElapsedTimef();

	ofPixels & pixels = img.getPixels();
	int w = img.getWidth();
	int h = img.getHeight();

	for (int y = 0; y < h; y++) {
		for (int x = 0; x < w; x++) {
			int i = y * w + x;
			float noiseValue = ofNoise(x * noiseScale, y * noiseScale, noiseVel);
			ofColor c1 = ofColor::indianRed;
			ofColor c2 = ofColor::blueSteel;
			ofColor mixed = c1.getLerped(c2, noiseValue); // mezcla según ruido
			pixels.setColor(x, y, mixed);
		}
	}
	/* for (int y = 0; y < h; y++) {
		for(int x=0; x<w; x++) {
			int i = y * w + x;
			float noiseVelue = ofNoise(x * noiseScale, y * noiseScale, noiseVel);
			pixels[i] = 255 * noiseVelue;
		}
	}*/
	img.update(); //Aqui la CPU envia los datos a la GPU
}

//--------------------------------------------------------------
void ofApp::draw() {

	// bind our texture. in our shader this will now be tex0 by default
	// so we can just go ahead and access it there.
	img.getTexture().bind();

	shader.begin();

	ofPushMatrix();

	// translate plane into center screen.
	float tx = ofGetWidth() / 2;
	float ty = ofGetHeight() / 2;
	ofTranslate(tx, ty);

	// the mouse/touch X position changes the rotation of the plane.
	float percentX = mouseX / (float)ofGetHeight();
	float rotation = ofMap(percentX, 0, 0.9, -40, 40, true) + 40;
	ofRotateDeg(rotation, 0, 1, 0);

	plane.drawWireframe();

	ofPopMatrix();

	shader.end();

	ofSetColor(ofColor::indianRed);
	ofSetColor(ofColor::blueSteel);
	img.draw(0, 0);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key) {
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button) {
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button) {
}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h) {
}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg) {
}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo) {
}

```

main.cpp
```cpp
#include "ofApp.h"
#include "ofMain.h"

//========================================================================
int main() {

#ifdef TARGET_OPENGLES
	ofGLESWindowSettings settings;
	settings.glesVersion = 2;
#else
	ofGLWindowSettings settings;
	settings.setGLVersion(3, 2);
#endif

	auto window = ofCreateWindow(settings);

	ofRunApp(window, std::make_shared<ofApp>());
	ofRunMainLoop();
}

```

shader.vert
```cpp
OF_GLSL_SHADER_HEADER

// these are from the programmable pipeline system
uniform mat4 modelViewProjectionMatrix;
in vec4 position;
in vec2 texcoord;

// this is how we receive the texture
uniform sampler2D tex0;

out vec2 texCoordVarying;

void main()
{
    // get the position of the vertex relative to the modelViewProjectionMatrix
    vec4 modifiedPosition = modelViewProjectionMatrix * position;
    
    // we need to scale up the values we get from the texture
    float scale = 400.;
    
    // here we get the red channel value from the texture
    // to use it as vertical displacement
    float displacementX = texture(tex0, texcoord).r;

    // use the displacement we created from the texture data
    // to modify the vertex position
	modifiedPosition.x += displacementX * scale;
	
    // this is the resulting vertex position
    gl_Position = modifiedPosition;

    // pass the texture coordinates to the fragment shader
    texCoordVarying = texcoord;
}

```

shader.frag
```cpp
OF_GLSL_SHADER_HEADER

uniform sampler2D tex0;

in vec2 texCoordVarying;

out vec4 outputColor;
 
void main()
{
    //outputColor = texture(tex0, texCoordVarying);
	 vec4 texColor = texture(tex0, texCoordVarying);
    outputColor = texColor; // ya contiene el color indianRed modulado por ruido
}

```