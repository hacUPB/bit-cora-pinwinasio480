//5. Traduce este programa a lenguaje ensamblador:
//int a = 10;
//int *p;
//p = &a;
//*p = 20;

@10
D=A 
@var 
M=D 

@var
D=A
@punt
M=D 

@punt
A=M 
@20
D=A

