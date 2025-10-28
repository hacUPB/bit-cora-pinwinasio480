#### Adding textures

Imagen original:

![alt text](image-9.png)

Imagen personalizada

![alt text](image-10.png)

#### Alpha Masking

Original: 

![alt text](image-11.png)

Modificada:

![alt text](image-12.png)

```cpp

void ofApp::setup(){
	ofDisableArbTex();
	if(ofIsGLProgrammableRenderer()){
		shader.load("shadersGL3/shader");
	}else{
		shader.load("shadersGL2/shader");
	}

	image.load("meow.jpg");
	imageMask.load("blue_mask.png");
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
	
	// draw a white rectangle for background.
	ofDrawRectangle(0, 0, image.getWidth(), image.getHeight());
	
	shader.begin();
	shader.setUniformTexture("imageMask", imageMask.getTexture(), 1);
	shader.setUniform2f("resolution", image.getWidth(), image.getHeight());

	image.draw(0, 0);
	
	shader.end();
}
``` 

#### Multiple Textures

Original:

![alt text](image-13.png)

Modificada:

https://upbeduco-my.sharepoint.com/:v:/g/personal/samuel_gomeze_upb_edu_co/ES67yCI2mdpBl_qS3VuMIe8BJplxuIiJ47YXH2bSgZO8SQ

#### ofFbo

Original:

![alt text](image-14.png)

Modificada:

![alt text](image-15.png)

#### Textures as Data (e.g. Displacement)

Original:

Modificada:

#### Blurring

Original:

Modificada:

#### The End, Congrats!