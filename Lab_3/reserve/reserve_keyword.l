%{
int COMMENT=0;
%}
identifier[a-z|A-Z][a-z|A-Z|0-9]*
%%
#.* {printf("\n%s is a preprocesor directive",yytext);}
int {printf("\n%s is a keyword",yytext);}
float {printf("\n%s is a keyword",yytext);}
double {printf("\n%s is a keyword",yytext);}
char {printf("\n%s is a keyword",yytext);}
if {printf("\n%s is a keyword",yytext);}
else {printf("\n%s is a keyword",yytext);}
while {printf("\n%s is a keyword",yytext);}
do {printf("\n%s is a keyword",yytext);}
return {printf("\n%s is a keyword",yytext);}
break {printf("\n%s is a keyword",yytext);}
continue {printf("\n%s is a keyword",yytext);}
void {printf("\n%s is a keyword",yytext);}
switch {printf("\n%s is keyword",yytext);}
for {printf("\n%s is a keyword",yytext);}
typedef {printf("\n%s is a keyword",yytext);}
struct {printf("\n%s is a keyword",yytext);}
goto {printf("\n%s is a keyword",yytext);}

{identifier}\( {}

\{ {}
\} {}
\[
\]
\;
\.
\*

{identifier} {}

{identifier}(\[[0-9]*\])?\( {}
\".*\" {}
[0-9]+ {}
\)(\;)? {}
\(ECHO;
= {}
\> {}
\n
%%

int main(int argc,char **argv)
{

    if(argc>1)
    {
        FILE *file;
        file=fopen(argv[1],"r");
        if(!file)
        {
            printf("COULD NOT OPEN %s\n",argv[1]);
            exit(1);
        }
        yyin=file;
    }
    yylex();
    printf("\n\n");
    return 0;
}