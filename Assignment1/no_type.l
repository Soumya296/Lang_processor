%{
    int pstv = 0;
    int ngtv = 0;
    int pstv_frac = 0;
    int ngtv_frac = 0;
%}

digit [0-9]
%%
\+?{digit}+     {pstv++;}
-{digit}+       {ngtv++;}
\+?{digit}*\.{digit}+ {pstv_frac++;}
-{digit}*\.{digit}+     {ngtv_frac++;}
%%
int main()
{
    printf("Enter the numbers:\n");
    yylex();
    printf("Number of positive numbers : %d\n",pstv);
    printf("Number of negative numbers : %d\n",ngtv);
    printf("Number of positve fractions : %d\n",pstv_frac);
    printf("Number of negative fractions : %d\n",ngtv_frac);
}