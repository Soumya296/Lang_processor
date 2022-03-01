%{
#include <stdio.h>
%}

%token ZERO ONE

%%

r : s {printf("\nSequence Accepted\n\n");}
;
  
s : n
| ZERO a
| ONE b
;
  
a : n a
| ZERO
;
  
b : n b
| ONE
;
  
n : ZERO
| ONE
;

%%

int main() {
	printf("Enter the expression\n");
	yyparse();
}

/* For printing error messages */
int yyerror(char* s) {
	printf("\nSequence not accepted\n");
}