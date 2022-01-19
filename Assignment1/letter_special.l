%{
    #include<stdio.h>
    int small_count = 0;    
    int cap_count = 0;
    int special = 0;
%}

%%
[a-z] {small_count++;}
[A-Z] {cap_count++;}
[!@#$%^&*~] {special++;}
%%

int main()
{
    printf("Enter the string: \n");
    yylex();
    printf("The number of uppercase letters : %d\n", cap_count);
    printf("The number of lowercase letters : %d\n", small_count);
    printf("The number of special characters : %d\n", special);
    return 0;
}