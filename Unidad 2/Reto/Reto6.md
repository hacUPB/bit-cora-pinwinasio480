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

En este ejercicio se utiliza un puntero para acceder indirectamente al valor de una variable.
Primero se declara una variable `var` con valor 10, y otra llamada `bis` con valor 5.
Luego se declara un puntero `p_var`, que se inicializa con la dirección de `var`.
Finalmente, se asigna a `bis` el valor apuntado por `p_var`, es decir, el contenido de `var`.

Esto significa que `bis = *p_var;` cambia el valor de `bis` de 5 a 10,
porque `p_var` apunta a `var`, y al usar `*p_var` estamos accediendo al contenido de esa dirección.

En resumen, se está leyendo el valor de `var` a través del puntero `p_var`
y copiándolo en la variable `bis`.
