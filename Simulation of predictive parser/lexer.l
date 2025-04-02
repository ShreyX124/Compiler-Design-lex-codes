%{
#include "y.tab.h"
%}

%%
a   return A;
b   return B;
\n  return 0;
.   return 0;
%%

int yywrap(void) {
    return 1;
}
