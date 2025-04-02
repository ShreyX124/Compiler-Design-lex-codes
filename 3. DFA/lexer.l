%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
 
int currentState = 0;
%}
 
%%
 
a   {
 
        if (currentState == 0) { currentState = 1; } 
        else { currentState = 0; } 
    }
 
b   {
 
    }
 
\n  {
 
        if (currentState == 0) {
            printf("Accepted\n"); 
        } else {
            printf("Rejected\n"); 
        }
        currentState = 0;
    }
 
.   {
 
        currentState = 0;
    }
 
%%
 
int main() {
 
    printf("Enter a string over the alphabet {a, b}:\n");
    yylex();
    return 0;
}