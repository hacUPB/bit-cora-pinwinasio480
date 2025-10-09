## Pruebas cualitativas (sugeridas por ChatGPT)

1.1 Funcionamiento adecuado de los eventos suscritos (Rotar, Agrandar, Achicar, Normal y Pulso)

R = Rotar/Rotate
A = Agrandar/Big
S = Achicar/Small
N = Normal
P = Pulso/Pulse

(Prueba1Reto)[https://upbeduco-my.sharepoint.com/:v:/g/personal/samuel_gomeze_upb_edu_co/ESe7agkdCiRAtjKHsc6JabsBshfRBnwfjNX8jjnAPBEgGg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=yvi1yU]

1.2 Agregar un log para verificar que si se este cumpliendo los eventos.

```cpp
void Triangle::onNotify(const std::string & event) {
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
```

![alt text](image.png)

<video controls src="20251009-0257-12.4464699.mp4" title="Title"></video>