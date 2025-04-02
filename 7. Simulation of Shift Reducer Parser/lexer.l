%{
#include "y.tab.h"
%}
 
%%
 
a       { printf("Shifting: a\n"); return A; }
b       { printf("Shifting: b\n"); return B; }
\n      { return END; }
[ \t]   { /* skip whitespace */ }
 
%%
 
int yywrap() {
    return 1;
}