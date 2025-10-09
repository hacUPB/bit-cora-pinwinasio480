## Pruebas cualitativas (sugeridas por ChatGPT)

1.1 Funcionamiento adecuado de los eventos suscritos (Rotar, Agrandar, Achicar, Normal y Pulso)

R = Rotar/Rotate
A = Agrandar/Big
S = Achicar/Small
N = Normal
P = Pulso/Pulse

[Prueba1RetoEnlaceAOneDrive](https://upbeduco-my.sharepoint.com/:v:/g/personal/samuel_gomeze_upb_edu_co/ESe7agkdCiRAtjKHsc6JabsBshfRBnwfjNX8jjnAPBEgGg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=yvi1yU)

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

[Prueba2RetoEnlaceAOneDrive](https://upbeduco-my.sharepoint.com/:v:/g/personal/samuel_gomeze_upb_edu_co/EW5E0Y9QlVtGgJ9CSO0eV9IBBO8qTuPJ_WMa4DaTZzG8yg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=2hl7F4)

## Pruebas cuantitativas

2.1 Como influyen los fps con la cantidad de triangulos en pantalla.

| Cantidad de Triangulos en Pantalla | FPS |
| --- | --- |
| 20 | 59-60 FPS |
| 80 | 56-57 FPS Iniciales, 58-59 FPS posteriormente|
| 250 | 55 - 59 FPS |
| 850 | FPS inestables entre 41 - 59 dependiendo del evento |
| 2000 | Puede llegar a bajar hasta 32 FPS, con subidas algo agresivas de hasta 40 o 50 FPS |

[PruebaFPSRetoEnlaceAOneDrive](https://upbeduco-my.sharepoint.com/:v:/g/personal/samuel_gomeze_upb_edu_co/EVqndZfgEElGmdJqzpIyO9kBOtIp6a3FIOHaZ8CZJTAa6A?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=dgDigt)