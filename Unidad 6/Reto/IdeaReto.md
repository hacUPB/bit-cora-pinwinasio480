### EJEMPLOS:

- Aplica el patrón de diseño **Observer**.:

R/ En este programa, cuando presiono una de las teclas, ya sea 'a' para atraer, 's' para parar, 'r' para repeler y 'n' para hacer que las particulas vuelvan a su estado original, esto notifica al programa que se esta llevando a cabo un evento.

- Aplica el patrón de diseño **Factory**.:

R/ El patrón factory puede describirse como aquel que se encarga de crear los objetos en el programa, en este caso, las particulas. En el ofApp.h se encuentra ubicado en su propia clase:

- Aplica el patrón de diseño **State**.:

R/ El patrón state lo que hace es alterar el comportamiento de las particulas si se altera el estado interno.

```cpp

void Particle::onNotify(const std::string& event) {
    if (event == "attract") {
        setState(new AttractState());
    }
    else if (event == "repel") {
        setState(new RepelState());
    }
    else if (event == "stop") {
        setState(new StopState());
    }
    else if (event == "normal") {
        setState(new NormalState());
    }
}

```

### MI PROGRAMA RETO:

Mi idea para el programa consiste en un programa en el que el patrón observer si en la pantalla tengo varios triangulos abstractros, si presiono la tecla p, los triangulos hacen como un pulso (como un latido del corazón), osea, se agranda pero achica rapido, como una manera de notificar que el evento esta pasando, se achican los triangulos, si presiono b, se agrandan, y si oprimo r, se rotan los triangulos.

El patrón factory es el que crearia los triangulos de diferentes colores, en este caso, si es posible, con degradado como el de un arcoiris.

Y el patron state serian los eventos (pulse, small, big, rotate)