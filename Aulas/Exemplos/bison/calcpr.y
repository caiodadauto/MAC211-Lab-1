/* Calculadora em notacao polonesa reversa (posfixa) */

%{
  /* inclui as bibliotecas usadas na definicao
     das acoes da calculadora */ 
   #include <math.h>
   #include <stdio.h>

  /* especifica que os tipos dos valores semanticos 
     dos simbolos sera sempre double */ 
   #define YYSTYPE double

%}

%token NUM

%%

entrada: /* vazio */ 
        | entrada linha ;

linha  : '\n'            /* aceita uma linha em branco, mas a ignora, 
                            ja que nao ha uma acao definida aqui  */ 
        | exp '\n'       { printf ("RES = %lf\n", $1); 
                           printf ("Entre com uma nova expressao: "); };

exp    : NUM             { $$ = $1;                    }
        | exp exp '+'    { $$ = $1 + $2;               }
        | exp exp '-'    { $$ = $1 - $2;               }
        | exp exp '*'    { $$ = $1 * $2;               }
        | exp exp '/'    { $$ = $1 / $2;               }
        | exp exp '^'    { $$ = pow($1, $2);           }
        | exp 'n'        { $$ = -$1;                   };
%%

void main (void) {
  printf ("CALCULADORA POLONESA\n");
  printf ("Entre com uma expressao: ");

  yyparse();
}

yyerror (char * s) {
  printf ("Ohhhhh: %s\n", s);
}
