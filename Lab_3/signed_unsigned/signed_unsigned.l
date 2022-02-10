%{
   // Code for identifying signed and unsigned numbers
%}

digit [0-9]

%%
{digit}+        {printf("%d is a an unsigned positive number",atoi(yytext));}
\+?{digit}+     {printf("+%d is a a signed positive number",atoi(yytext));}
-{digit}+       {printf("%d is a a signed negative number",atoi(yytext));}
{digit}*\.{digit}+ {printf("%.4f is a an unsigned positive fraction",atof(yytext));}
\+?{digit}*\.{digit}+ {printf("+%.4f is a a signed positive fraction",atof(yytext));}
-{digit}*\.{digit}+     {printf("%.4f is a a signed negative fraction",atof(yytext));}
%%

int main()
{
    printf("\nEnter the numbers\n");
    yylex();
}