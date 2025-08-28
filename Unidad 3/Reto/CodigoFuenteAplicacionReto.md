ofApp.h

```cpp

#pragma once
#include "ofMain.h"

class ofApp : public ofBaseApp {
public:
	void setup() override; //Ejecuta una vez el programa.
	void update() override; //Se ejecuta antes que cada draw.
	void draw() override; //Se ejecuta en cada frame para dibujar en la pantalla

	void keyPressed(int key) override; //Cuando se oprime una tecla
	void mousePressed(int x, int y, int button) override; //Cuando oprimo el click del mouse

	// Utilidades para picking 3D
	void convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd); //Convierte las coordenadas del mouse en una raya en el espacio 3D (por defecto es 2D).
	bool rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir, //Verifica si el rayo generado intersecta con una esfera en el espacio 3D, al ser bool se verifica si cumple la condició o no.
		const glm::vec3 & sphereCenter, float sphereRadius,
		glm::vec3 & intersectionPoint);

private:
	// Generación y parámetros de la cuadrícula de esferas
	void regenerateGrid(); //Reconstruye o actualiza la grafica

	ofEasyCam cam;
	std::vector<glm::vec3> spherePositions; // Requisito: almacenar posiciones

	// Parámetros modificables por teclado
	int xStep = 50; // Separación en X entre esferas (px)
	int yStep = 50; // Separación en Y entre esferas (px)
	float amplitud = 120; // Amplitud del desplazamiento en Z
	float distDiv = 40; // Divisor de distancia para la función cos()
	float sphereRadius = 8.0f; // Radio visual y de colisión

	// Selección
	bool sphereSelected = false;
	int selectedIndex = -1; // Indice en spherePositions
	glm::vec3 selectedPoint = { 0, 0, 0 }; // punto de intersección del rayo

	// Fuente para UI
	ofTrueTypeFont uiFont;
};


```

ofApp.cpp

```cpp

#include "ofApp.h"

	//--------------------------------------------------------------
	void
	ofApp::setup() {

	ofSetVerticalSync(true); //Activa la sincronización vertical, lo cual hace
	ofBackground(255); //Color de la pantalla

	uiFont.load("verdana.ttf", 12, true, true);

	// Configurar cámara
	cam.setDistance(600);
	cam.setNearClip(0.1f);
	cam.setFarClip(5000.0f);

	regenerateGrid();
}

//--------------------------------------------------------------
void ofApp::update() {
}

//--------------------------------------------------------------
void ofApp::draw() {

	ofEnableDepthTest(); //Dibuja correctamente las esferas 3D segun la distancia que este de la camara
	cam.begin();

	// Ejes de referencia
	ofDrawAxis(100);

// Dibujar todas las esferas
	for (size_t i = 0; i < spherePositions.size(); ++i) {
		const auto & p = spherePositions[i];

		if (sphereSelected && (int)i == selectedIndex) {
			// Si se selecciona una esfera...
			ofSetColor(255, 180, 40); // resaltada
			ofDrawSphere(p, sphereRadius * 1.2f);
			ofDrawLine(p, selectedPoint); // línea al punto de intersección (opcional)
		} else {
			// --- Aquí va el degradado ---
			float minZ = -amplitud; // valor mínimo Z
			float maxZ = amplitud; // valor máximo Z
			float t = ofMap(p.z, minZ, maxZ, 0.0, 1.0, true);

			ofColor rojo = ofColor::red;
			ofColor verde = ofColor::green;

			// Color interpolado según Z
			ofColor color = rojo.getLerped(verde, t);

			ofSetColor(color);
			ofDrawSphere(p, sphereRadius);
		}
	}

	cam.end();
	ofDisableDepthTest();

	// HUD
	ofSetColor(255);
	std::stringstream ss;
	ss << "[Controles]" << "\n"
	   << "A/D: xStep -/+ (actual: " << xStep << ")\n"
	   << "W/S: yStep -/+ (actual: " << yStep << ")\n"
	   << "Z/X: amplitud -/+ (actual: " << amplitud << ")\n"
	   << "C/V: distDiv -/+ (actual: " << distDiv << ")\n"
	   << "R: regenerar cuadrícula\n"
	   << "Click: seleccionar esfera\n\n";

	if (sphereSelected && selectedIndex >= 0 && selectedIndex < (int)spherePositions.size()) {
		const auto & sp = spherePositions[selectedIndex];
		ss << "Seleccionada idx " << selectedIndex
		   << " | pos = (" << sp.x << ", " << sp.y << ", " << sp.z << ")\n";
	} else {
		ss << "Sin selección" << "\n";
	}

	ofDrawBitmapStringHighlight(ss.str(), 15, 20);
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key) {

	switch (key) {
	case 'a':
	case 'A':
		xStep = std::max(5, xStep - 5);
		regenerateGrid();
		break;
	case 'd':
	case 'D':
		xStep += 5;
		regenerateGrid();
		break;
	case 'w':
	case 'W':
		yStep = std::max(5, yStep - 5);
		regenerateGrid();
		break;
	case 's':
	case 'S':
		yStep += 5;
		regenerateGrid();
		break;
	case 'z':
	case 'Z':
		amplitud = std::max(0.0f, amplitud - 5.0f);
		regenerateGrid();
		break;
	case 'x':
	case 'X':
		amplitud += 5.0f;
		regenerateGrid();
		break;
	case 'c':
	case 'C':
		distDiv = std::max(1.0f, distDiv - 1.0f);
		regenerateGrid();
		break;
	case 'v':
	case 'V':
		distDiv += 1.0f;
		regenerateGrid();
		break;
	case 'r':
	case 'R':
		regenerateGrid();
		break;
	default:
		break;
	}
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {

	// Convertir las coordenadas del mouse en un rayo 3D
	glm::vec3 rayStart, rayEnd;
	convertMouseToRay(x, y, rayStart, rayEnd);

	// Comprobar intersecciones
	sphereSelected = false;
	selectedIndex = -1;

	const glm::vec3 rayDir = glm::normalize(rayEnd - rayStart);
	float closestT = std::numeric_limits<float>::max();

	for (int i = 0; i < (int)spherePositions.size(); ++i) {
		glm::vec3 ip;
		// Usamos el mismo radio que de dibujo para coherencia
		if (rayIntersectsSphere(rayStart, rayDir, spherePositions[i], sphereRadius, ip)) {
			// Elegir la intersección más cercana a la cámara
			float t = glm::length(ip - rayStart);
			if (t < closestT) {
				closestT = t;
				sphereSelected = true;
				selectedIndex = i;
				selectedPoint = ip;
			}
		}
	}
}

//--------------------------------------------------------------

bool ofApp::rayIntersectsSphere(const glm::vec3 & rayStart, const glm::vec3 & rayDir,
	const glm::vec3 & sphereCenter, float sphereRadius,
	glm::vec3 & intersectionPoint) {
	glm::vec3 oc = rayStart - sphereCenter;
	float a = glm::dot(rayDir, rayDir);
	float b = 2.0f * glm::dot(oc, rayDir);
	float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;

	float discriminant = b * b - 4 * a * c;

	if (discriminant < 0) {
		return false;
	} else {
		float t = (-b - sqrt(discriminant)) / (2.0f * a);
		if (t < 0) return false; // intersección detrás de la cámara
		intersectionPoint = rayStart + t * rayDir;
		return true;
	}
}

//--------------------------------------------------------------

void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3 & rayStart, glm::vec3 & rayEnd) {
	// Obtener matrices de proyección y modelo/vista de la cámara
	glm::mat4 modelview = cam.getModelViewMatrix();
	glm::mat4 projection = cam.getProjectionMatrix();
	ofRectangle viewport = ofGetCurrentViewport();

	// Convertir a NDC
	float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
	float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;

	// Rayo en NDC
	glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f);
	glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);

	// A coordenadas de mundo
	glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
	glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;

	rayStartWorld /= rayStartWorld.w;
	rayEndWorld /= rayEndWorld.w;

	rayStart = glm::vec3(rayStartWorld);
	rayEnd = glm::vec3(rayEndWorld);
}

//--------------------------------------------------------------
void ofApp::regenerateGrid() {
	spherePositions.clear();
	spherePositions.reserve(((ofGetWidth() / xStep) + 2) * ((ofGetHeight() / yStep) + 2));

	for (int x = -ofGetWidth() / 2; x < ofGetWidth() / 2; x += xStep) {
		for (int y = -ofGetHeight() / 2; y < ofGetHeight() / 2; y += yStep) {
			// Función dada: z depende de la distancia al origen en el plano XY
			float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
			spherePositions.emplace_back(x, y, z);
		}
	}
}

```

main.cpp

```cpp

#include "ofApp.h"
#include "ofMain.h"

int main() {
	ofSetupOpenGL(1280, 720, OF_WINDOW);
	ofRunApp(new ofApp());
}

```