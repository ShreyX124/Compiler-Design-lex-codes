%{

#include <stdio.h>

#include <string.h>
 
typedef struct {

    char name[100];

    char type[10];

} Symbol;
 
Symbol symbolTable[100];

int symbolCount = 0;
 
char lastType[10] = ""; // Variable to store the last type encountered
 
void addSymbol(char* name, char* type) {

    strcpy(symbolTable[symbolCount].name, name);

    strcpy(symbolTable[symbolCount].type, type);

    symbolCount++;

}
 
%}
 
%option noyywrap
 
%%
 
int      { strcpy(lastType, "int"); }

float    { strcpy(lastType, "float"); }

[a-zA-Z_][a-zA-Z0-9_]* {

            // If it's a variable and a type was encountered before, add it to the symbol table

            if (strlen(lastType) > 0) {

                addSymbol(yytext, lastType);

                lastType[0] = '\0'; // Clear last type after using it

            }

        }
 
[ \t\n]  { /* Ignore white space */ }

.        { /* Ignore other characters */ }
 
%%
 
int main() {

    yylex(); // Start the lexical analysis

    // Print the symbol table

    for (int i = 0; i < symbolCount; i++) {

        printf("%s %s\n", symbolTable[i].name, symbolTable[i].type);

    }

    return 0;

}

 
