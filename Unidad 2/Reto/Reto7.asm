//7. Traduce este programa a lenguaje ensamblador:

//int var = 10;
//int bis = 5;
//int *p_var;
//p_var = &var;
//bis = *p_var;

// int var = 10

@10 
D=A 
@var 
M=D 

// int bis = 5

@5 
D=A 
@bis 
M=D 

// p = &var

@var 
D=A 
@p_var
M=D 

// bis = *p_var
@p_var    
A=M      
D=M       
@bis
M=D       
