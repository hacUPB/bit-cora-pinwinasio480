//5. Traduce este programa a lenguaje ensamblador:

//int a = 10;
//int *p;
//p = &a;
//*p = 20;


// int a = 10

@a
M=10

// p = &a (Almacena la dirección de la variable)

@a
D=A
@p
M=D

// *p = 20 (Se declara el puntero)

@p
A=M
M=20