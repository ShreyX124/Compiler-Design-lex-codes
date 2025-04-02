%{
#include <stdio.h>
#include <stdlib.h>
%}
 
%%
[ \t\n]+          { /* Skip whitespace */ }
"if"|"else"|"for" { printf("KEYWORD: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("IDENTIFIER: %s\n", yytext); }
[0-9]+            { printf("NUMBER: %s\n", yytext); }
"+"|"-"|"*"|"/"   { printf("OPERATOR: %s\n", yytext); }
"="               { printf("ASSIGNMENT OPERATOR: %s\n", yytext); }
"("               { printf("LEFT PARENTHESIS: %s\n", yytext); }
")"               { printf("RIGHT PARENTHESIS: %s\n", yytext); }
";"               { printf("SEMICOLON: %s\n", yytext); }
.                 { printf("UNKNOWN CHARACTER: %s\n", yytext); }
 
%%
 
int main() {
    yylex(); // Run the lexer
    return 0;
}