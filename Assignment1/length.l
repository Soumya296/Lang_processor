%{
    #include<stdio.h>
    int len=0;    
%}

%%
[a-zA-z \t0-9!@#$%&*^~]        {len++;}
%%

int main()
{
    printf("Enter the string\n");
    yylex();
    printf("The length of  input string is : %d \n", len);
    return 0;
}