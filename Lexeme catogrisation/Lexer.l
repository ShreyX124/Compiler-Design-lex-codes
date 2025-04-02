%{
#include<stdio.h>
#include<string.h>
%}
 
 
DIGIT [0-9]
LETTER [a-zA-Z]
IDENTIFIER {LETTER}({LETTER}|{DIGIT})*
NUMBER {DIGIT}+(\.{DIGIT}+)?
KEYWORDS if|else|while|for|int|float|return|char
OPERATORS \+|\-|\*|\/|\=|\<|\>|\!\=|\>\=|\<\=|\&\&|\|\|
 
%%
 
{KEYWORDS}    {printf("Keyword: %s\n", yytext);}
{IDENTIFIER}  {printf("Identifier: %s\n", yytext);}
{NUMBER}      {printf("Number: %s\n", yytext);}
{OPERATORS}   {printf("Operator: %s\n", yytext);}
.             {printf("Other: %s\n", yytext);}
 
%%
 
int main() {
    printf("Enter input: ");
    yylex();
    return 0;
}
 
int yywrap() {
    return 1;
}
