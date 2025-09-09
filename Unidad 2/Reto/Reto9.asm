//9. Considera que el punto de entrada del siguiente programa es la función main,
//es decir, el programa inicia llamando la función main. 
//Vas a proponer una posible traducción a lenguaje ensamblador de la función suma, 
//cómo llamar a suma y cómo regresar a std::cout << "El valor de c es: " << c << std::endl; 
//una vez suma termine.

//#include <iostream>

//int suma(int a, int b) 
//{
//   int var = a + b;
//   return var;
//}


//int main() {
//   int c = suma(6, 9);
//   std::cout << "El valor de c es: " << c << std::endl;
//   return 0;

//Intento a ensamblador

// a = 6

@6
D=A 
@a 
M=D 

// b = 9

@9
D=A 
@b 
M=D 

//Guarda retorno en [R15]

 @RETURN 
 D=A 
 @15 
 M=D

//Salta a suma

@SUMA 
0;JMP 

// Punto de retorno después de suma
(RETURN)
@var
D=M       
@c
M=D       

// Guardar el valor de c en [R0]
@c
D=M
@R0       
M=D       

// Fin del programa
(END)
@END
0;JMP

//Función suma

(SUMA)
@a 
D=M 
@b 
D=D+M 
@var 
M=D

//Retorna var

@R15 
A=M 
0;JMP
