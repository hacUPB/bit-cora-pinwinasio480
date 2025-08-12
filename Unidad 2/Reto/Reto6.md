6. Ahora vas a usar un puntero para leer la posición de memoria a la que este apunta, es decir, 
vas a leer por medio del puntero la variable cuya dirección está almacenada en él.

int var = 10;
int bis = 5;
int *p_var;
p_var = &var;
bis = *p_var;

En este caso bis = *p_var; hace que el valor de bis cambie de 5 a 10 
porque p_var apunta a la la variable var y con *p_var a la derecha del igual estás leyendo 
el contenido de la variable apuntada.

Lo que estoy entendiendo, es que debo declarar en la variable `var` un 10, y en `bis` un 5. 
Despues declaro un puntero en `p_var` el cual incializo en la dirección var,
posterior a eso asigno a la variable `bis` el valor apuntado por `p_var`.
Lo cual implica que el valor de `bis` cambia de 5 a 10

Aclaro que esto lo escribo en base a lo que entiendo del codigo, ya que como tal
no tengo claro si era hacer esto u otra cosa, eso si, se que el punto 7 es pasar este mismo codigo
a ensamblador.
