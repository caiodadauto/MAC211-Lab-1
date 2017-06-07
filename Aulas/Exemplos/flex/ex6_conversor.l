/* Conversor de real para dolar */
/* O primeiro argumento do programa e' a taxa de conversao */
/* O programa converte valores monetarios com prefixo R$ para US$.  Os
 * milhares devem estar separados por '.' e os centavos por ','.
 * Isso nao vale para o argumento do programa.
 */

%{ 
#include <math.h> 
#include <locale.h>
#include <monetary.h>

double taxa = 1.5;
double valor=0.; 

void converte(double d) { 
  char b[2048]; 
  /* a funcao strfmon colocara em b a versao em string
     do numero d/taxa, nao ocupando mais que 2048 bytes */
  strfmon(b,2048,"%!n", d/taxa); 
  printf("US$%s", b); 
} 
%}

MILHAR   [[:digit:]]{3} 
VAL      -?[[:digit:]][[:digit:]]?[[:digit:]]? 
CENT     [[:digit:]]{2}

SEP [[:space:]]*

%s VALOR  MEIO

%%

R[$]{SEP} BEGIN(VALOR);

<VALOR>{VAL} { 
               valor = atof(yytext); 
               BEGIN(MEIO); 
             } 
<MEIO>[.]{MILHAR} { 
                    valor *=1000; 
                    valor += atof(++yytext); 
                  } 
<MEIO,VALOR>[,]{CENT} { 
                        valor += atof(++yytext)/100; 
                        converte(valor); 
                        valor = 0.; 
                        BEGIN(INITIAL); 
                      }

<VALOR,MEIO>. { 
                     converte(valor); 
                     valor = 0.; 
                     BEGIN(INITIAL); 
              } 
 
. ECHO;

%%

int main(int ac, char **av) 
{
  /* pula nome do programa */ 
  ac--, av++; 
  if (ac) 
    { 
        taxa = atof(*av); 
        ac--, av++; 
    } 
  
 

  if (!taxa) 
    { 
        fprintf(stderr,"Taxa inaceitável\n"); 
        exit(1); 
    }

  if (ac) yyin = fopen(*av,"r"); 
  yylex(); 
}


