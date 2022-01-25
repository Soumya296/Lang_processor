%{
    #include<stdio.h>
    int vc=0;
    int cc=0;    
%}

%%
[aeiouAEIOU]    {vc++;}
[a-zA-z]        {cc++;}

%%
int main()
{
    printf("Enter the string\n");
    yylex();
    printf("The number of vowels in the input string is : %d \n", vc);
    printf("The number of consonants in the input string is : %d \n", cc);
    return 0;
}