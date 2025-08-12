// sum = 0
@sum
M=0

// i = 1
@i 
M=1 

(FOR_LOOP)
// if (i > 100) salta a END
@i 
D=M 
@101 
D=D-A 
@END 
D;JGE // Jump if Greater or Equal (i >= 101)

// sum += i
@i 
D=M 
@sum 
M=M+D 

// i++
@i 
M=M+1

// Regresa al for
@FOR_LOOP
0;JMP

(END)
// Fin para acabar el programa
@END 
0;JMP