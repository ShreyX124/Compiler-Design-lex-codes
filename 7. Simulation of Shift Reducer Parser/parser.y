%{
#include <stdio.h>
#include <stdlib.h>
 
int yylex(void);
void yyerror(const char *s);
%}
 
%token A B END
 
%%
 
S:
    | A S B     { printf("Reduction: S -> aSb\n"); }
    ;
 
%%
 
void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}
 
int main(void) {
    printf("Enter the input string: ");
    yyparse();  // Start parsing
    return 0;
}