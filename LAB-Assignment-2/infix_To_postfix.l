%{
    char stack[50];
    int s_top = 0;
    void push(char);
    void pop();
    char top();
    int get_priority(char);    
%}

%%
[a-zA-Z]? {printf("%c",yytext[0]);}
[+\-\*\/\(\)] {
                    char op = yytext[0];
                    if(s_top==0 || op == '(') push(op);
                    else if (op ==')'){
                        while(top() != '('){
                            printf("%c",top());
                            pop();
                        }
                        pop();
                    }
                    else if(get_priority(op) >= get_priority(top()))
                    {
                        push(op);
                    }
                    else if(get_priority(op) <= get_priority(top()))
                    {
                        while(get_priority(op) <= get_priority(top()))
                        {
                            printf("%c",top());
                            pop();
                        }
                        push(op);
                    }
                }

[\n]            {
                int i=0;
                for(i=s_top-1;i>=0;i--)
                {
                    if(stack[i] != '(' && stack[i] !=')')
                    {
                        printf("%c",stack[i]);
                    }
                }
                printf("\n");
                s_top=0;
                yyterminate();
                }
%%

/*Driver Code*/

int main()
{
    printf("Enter the Infix Expression:\n");
    yylex();
}

void push(char c)
{
    stack[s_top++] = c;
}

void pop()
{
    s_top--;
}

char top()
{
    return stack[s_top-1];
}

int get_priority(char c)
{
    switch(c){
        case '(':return 0;
        case ')':return 0;
        case '+':return 1;
        case '-':return 1;
        case '*':return 2;
        case '/':return 2;
    }
}