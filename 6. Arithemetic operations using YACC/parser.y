%{

#include <stdio.h>

extern int yylex();

extern int yylineno;

extern char* yytext;

void yyerror(const char *s) {

    fprintf(stderr, "Error: %s at line %d\n", s, yylineno);

}

void print_token(char* token, char* category) {

    printf("Token: %-15s Category: %s\n", token, category);

}

%}
 
%token INT FLOAT IDENTIFIER NUMBER PLUS MINUS MUL DIV SEMICOLON ASSIGN
 
%%

program: program statement | ;

statement: declaration SEMICOLON | assignment SEMICOLON | expression SEMICOLON;

declaration: type IDENTIFIER { print_token(yytext, "Declaration"); };

assignment: IDENTIFIER ASSIGN expression { print_token(yytext, "Assignment"); };

type: INT { print_token(yytext, "Keyword"); } | FLOAT { print_token(yytext, "Keyword"); };

expression: term | expression PLUS term | expression MINUS term;

term: factor | term MUL factor | term DIV factor;

factor: NUMBER { print_token(yytext, "Number"); } | IDENTIFIER { print_token(yytext, "Identifier"); };

%%
 
int main() {

    printf("Enter a simple program:\n");

    return yyparse();

}
 