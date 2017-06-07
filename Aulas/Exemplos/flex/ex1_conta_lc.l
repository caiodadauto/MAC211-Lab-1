/* Este codigo gera um programa que faz a contagem de linhas
   e caracteres de um arquivo texto da entrada padrao     */
%{
int contLinhas = 0, contCaracteres = 0;
%}

%%
\n      ++contLinhas; ++contCaracteres;
.       ++contCaracteres;
<<EOF>> yyterminate();

%%
main() {
   yylex();
   printf( "# linhas: %d, # caracteres (incluindo '\\n') = %d\n",
           contLinhas, contCaracteres);
}

