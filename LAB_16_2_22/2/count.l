%{
int COMMENT=0;
int id = 0;
int k = 0;
int op = 0;
%}

identifier[a-z|A-Z][a-z|A-Z|0-9]*

%%
#.* {printf("\n%s is a preprocesor directive",yytext);}
int {printf("\n%s is a keyword",yytext);k++;}
float {printf("\n%s is a keyword",yytext);k++;}
double {printf("\n%s is a keyword",yytext);k++;}
char {printf("\n%s is a keyword",yytext);k++;}
if {printf("\n%s is a keyword",yytext);k++;}
else {printf("\n%s is a keyword",yytext);k++;}
while {printf("\n%s is a keyword",yytext);k++;}
do {printf("\n%s is a keyword",yytext);k++;}
return {printf("\n%s is a keyword",yytext);k++;}
break {printf("\n%s is a keyword",yytext);k++;}
continue {printf("\n%s is a keyword",yytext);k++;}
void {printf("\n%s is a keyword",yytext);k++;}
switch {printf("\n%s is a keyword",yytext);k++;}
for {printf("\n%s is a keyword",yytext);k++;}
typedef {printf("\n%s is a keyword",yytext);k++;}
struct {printf("\n%s is a keyword",yytext);k++;}
goto {printf("\n%s is a keyword",yytext);k++;}
begin {printf("\n%s is a keyword",yytext);k++;}
printf {printf("\n%s is a keyword",yytext);k++;}

{identifier}\( {printf("\n%s is an identifier",yytext);id++;}

\{ {}
\} {}
\[
\]
\;
\.
[\*\%\/\+\-\^] {printf("\n%s is an operator",yytext);op++;}
\+\+ {printf("\n%s is an operator",yytext);op++;}
\-\- {printf("\n%s is an operator",yytext);op++;}

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
    printf("\n\nCount of identifiers : %d\n",id);
    printf("Count of keywords : %d\n",k);
    printf("Count of operators : %d\n",op);
    printf("\n\n");
    return 0;
}