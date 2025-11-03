   
// 19. Analiza el siguiente programa en lenguaje de máquina:
    
    //- ¿Qué hace este programa?
   
    0100000000000000
    110110000010000
    0000000000010000
    1110001100001000
    0110000000000000
    1111110000010000
    0000000000010011
    1110001100000101
    0000000000010000
    1111110000010000
    0100000000000000
    1110010011010000
    0000000000000100
    1110001100000110
    0000000000010000
    1111110010101000
    1110101010001000
    0000000000000100
    1110101010000111
    0000000000010000
    1111110000010000
    0110000000000000
    1110010011010000
    0000000000000100
    1110001100000011
    0000000000010000
    1111110000100000
    1110111010001000
    0000000000010000
    1111110111001000
    0000000000000100
    1110101010000111

    //Voy a hacer una aclaración, existen varias interpretaciones al pasar este codigo binario a ensamblador
    //Dependera de si lo escribes manualmente, si cargas el archivo .hack, o la respuesta de la Inteligencia Artificial.
    //En este caso, voy a explicarlo en base a la explicación dada por Copilot (en relación a la traducción de binario a ensamblador).


Línea	Binario	     Ensamblador	
1	0100000000000000	@16384	//Carga en A la dirección de SCREEN (16384)
2	1110110000010000	D=A	    //Guarda en D el valor 16384
3	0000000000010000	@16	    //Carga en A el registro 16
4	1110001100001000	M=D	    //RAM[16] ← D (puntero a SCREEN)
5	0110000000000000	@24576	//Carga en A la dirección (24576)
6	1111110000010000	D=M	    //D ← M[24576] (lectura de teclado)
7	0000000000010011	@19	    //Salto a rutina de dibujo (línea 19)
8	1110001100000101	D;JNE	//Si D≠0, ir a la línea 19
9	0000000000010000	@16  	//Carga en A el puntero a pantalla (16)
10	1111110000010000	D=M	    //D ← M[16]
11	0100000000000000	@16384	//Reinicia A a 16384 (SCREEN)
12	1110010011010000	D=A-D	//D ← A − D
13	0000000000000100	@4	    //Carga en A la etiqueta de bucle (4)
14	1110001100000110	D;JGE	//Si D≥0, ir a la línea 4
15	0000000000010000	@16	    //Carga en A el registro 16
16	1111110010101000	AM=M-1	//A,M ← M[16] − 1
17	1110101010001000	A=0	    //A ← 0
18	0000000000000100	@4	    //Carga en A la etiqueta de bucle (4)
19	1110101010000111	0;JMP	//Salto incondicional a línea 4
20	0000000000010000	@16	    //Carga en A el registro 16
21	1111110000010000	D=M	    //D ← M[16]
22	0110000000000000	@24576	//Carga en A la dirección (24576)
23	1110010011010000	D=A-D	//D ← A − D
24	0000000000000100	@4	    //Carga en A la etiqueta de bucle (4)
25	1110001100000011	D;JLT	//Si D<0, ir a la línea 4
26	0000000000010000	@16	    //Carga en A el registro 16
27	1111110000100000	D=M	    //D ← M[16]
28	1110111010001000	A=-1	//A ← −1
29	0000000000010000	@16	    //Carga en A el registro 16
30	1111110111001000	A=M+1	//A ← M[16] + 1
31	0000000000000100	@4	    //Carga en A la etiqueta de bucle (4)
32	1110101010000111	0;JMP	//Vuelve al inicio del programa

//Teniendo en cuenta la traducción de binario a ensamblador que brindo la inteligencia Artificial,
//así como haber verificado probando el código en modo ensamblador cargando un archivo .asm actualmente no visible,
//el programa inicia almacenando la dirección 16384 en la variable R16, luego entra en un bucle donde primero consulta el estado del
//teclado, el cual lee R24576. Algo interesante es esa es la ultima posición posible de la RAM, estando reservada para el teclado.
//Volviendo al programa, si no hay ninguna tecla presionada, el programa recorre toda la memoria de video desde la dirección almacenada en R16, 
//escribiendo ceros para borrar la pantalla. En cambio, si se detecta una tecla presionada (por ejemplo, el valor 104 para la tecla 'h'), 
//el programa interpreta este valor como un desplazamiento que determina cuál palabra de memoria modificar y qué bit encender dentro de ella. 
//De esta forma, se calcula la dirección y el bit a activar, encendiendo un único píxel correspondiente al valor de la tecla presionada. 
//Este comportamiento se repite constantemente, asegurando que la pantalla se mantenga limpia si no hay interacción 
//y que se actualice dinámicamente con cada pulsación de tecla.

//En ensamblador al escribir manualmente seria asi (esto es un dato extra):

//@16384 
//@27664 
//@16 
//M=D 
//@24576 
//D=M 
//@19 
//D;JNE 
//@16 
//D=M 
//@16384 
//D=D-A 
//@4 
//D;JLE 
//@16 
//AM=M-1 
//M=0 
//@4 
//0;JMP 
//@16 
//D=M 
//@24576 
//D=D-A 
//@4 
//D;JGE 
//@16 
//A=M 
//M=-1 
//@16 
//M=M+1 
//@4 
//0;JMP 