%{
    #include<stdio.h>    
%}
%%
[ ]+ {}
[^a-zA-Z] {printf("This character : %s is not in alphabet\n", yytext);exit;}
%%

int main()
{
    printf("Enter the string: \n");
    yylex();
}