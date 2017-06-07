/* Gera um programa que conta linhas, palavras e caracteres 
   de um arquivo texto cujo o nome sera passado via linha 
   de comando                                              */
%{
int contCaracter = 0, contPalavra = 0, contLinha = 0;
%}

EOL      \n
PALAVRA  [^ \n\t]+

%%
{PALAVRA}       {contPalavra++; contCaracter += yyleng;}
{EOL}           {contCaracter++; contLinha++;}
.               {contCaracter++;}

%%
int main(int argc,char** argv){
	yyin = fopen(argv[1],"r");  /* abre arq de entrada */
	yylex();                    /* executa o scanner  */
	printf("# linhas: %d, # palavras: %d, # caracteres: %d\n", 
                  contLinha, contPalavra, contCaracter);
	fclose(yyin);               /* fecha arq de entrada */
}
