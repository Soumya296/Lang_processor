%{
    #include<stdio.h>
    int count = 0;    
%}

%%
[a-zA-Z]{3,5} {count++;}
%%

int main()
{
    printf("Enter the string: \n");
    yylex();
    printf("The number of words with 3 to 5 alphabet in it : %d\n", count);
    return 0;
}