%{
#include<stdio.h>
#include<stdlib.h>
%}

%token FOR IF ELSE INT BOP UOP UPDT NUM ID ASSIGN LOG AOP BREAK CONTINUE

%%
S : FOR '(' INIT ';' COND ';' UPDATE ')' BODY {printf("\n\nValid For Loop\n\n");}
;

INIT : INT ID ASSIGN NUM INIT_R | ID ASSIGN NUM INIT_R | ;

INIT_R : ',' INIT | ;

COND : ID BOP F COND_R | ;

F : ID | NUM;

COND_R : LOG COND | ;

UPDATE : ID  U UPDATE_R | ;

U : UOP | UPDT T;

T : ID | NUM;

UPDATE_R : ',' UPDATE | ;

BODY : ';' | stmt | codeblock
;

codeblock:'{' stmt_list '}'
;

stmt_list: stmt_list stmt
|
;

stmt: lexp ';'
| IF '(' COND ')' codeblock ELSE codeblock | IF '(' COND ')' stmt_list ELSE stmt_list
| IF '(' COND ')' codeblock | IF '(' COND ')' stmt_list 
;

lexp: fexp			
;
 

fexp: fexp ',' exp		
|exp
|'(' fexp ')'			
;

exp: ID BOP exp
| ID AOP exp
| ID ASSIGN exp		
| ID UOP			
| UOP ID
| ID
| NUM
| BREAK
| CONTINUE
;

%%

int main()
{
    yyparse();
}
void yyerror(char *s)
{
    printf("error");
    exit(1);
}