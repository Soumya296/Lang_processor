%{
#include "y.tab.h"
%}
num	[0-9]+
id	[a-zA-Z]+
assign =
bop	<|>|!=|<=|>=|==
aop \+|-|\*|\/
log "||"|&&
uop	"++"|"--"
updt "+="|"-="|"*="|"/="
%%
"for"	{return FOR;}
"if"	{return IF;}
"else"	{return ELSE;}
"int"   {return INT;}
"break" {return BREAK;}
"continue" {return CONTINUE;}
{assign} {return ASSIGN;}
{log}   {return LOG;}
{bop}	{return BOP;}
{aop}   {return AOP;}
{uop}	{return UOP;}
{updt}	{return UPDT;}
{num}	{return NUM;}
{id}	{return ID;}
[ \n\t]	; /*reject whitespaces*/
.	{return *yytext;}
%%
int yywrap(){return 1;}
