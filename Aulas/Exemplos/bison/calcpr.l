/* Calculadora em notacao polonesa reversa (posfixa)   */

%{
  # include "calcpr.tab.h"
%}

%%

[0-9]*\.?[0-9]+ { sscanf (yytext, "%lf", &yylval); return NUM;}

[ \t]*          {;}

.|\n            {return yytext[0];}

%%
