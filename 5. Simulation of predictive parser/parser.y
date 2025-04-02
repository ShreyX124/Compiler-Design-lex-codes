%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
%}

%token A B

%%
S: A B { printf("Successfully parsed S -> A B\n"); }
;

%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main(void) {
    printf("Enter a string to parse (e.g., 'ab'):\n");
    yyparse();
    return 0;
}
