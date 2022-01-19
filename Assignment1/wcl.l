%{
    #include<stdio.h>
    int wc = 0;
    int ch = 0;
    int line = 0;    
%}

%%
\n {ch++; line++;}
[^ \n\t]+ {wc++, ch=ch+yyleng;}
. {ch++;}
%%
int main()
{
    printf("Enter the string : \n");
    yylex();
    printf("The number of words : %d\n", wc);
    printf("The number of characters : %d\n", ch);
    printf("The number of lines : %d\n", line);
    return 0;
}