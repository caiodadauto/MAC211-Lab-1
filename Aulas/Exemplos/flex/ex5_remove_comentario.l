/* Scanner que reconhece e descarta comentarios C ao mesmo tempo que
   mantem um contador de linhas.  */

/* Declaracao de uma condicao de inicio para regras exclusivas */
%x comentario
%%
    int    contLinhas = 1;

"/*"  BEGIN(comentario);   /* habilita todas as regras do grupo <comentario> */  
<comentario>[^*\n]*        /* consome tudo que nao eh '*' */
<comentario>"*"+[^*/\n]*   /* consome todos os '*' nao seguidos por '/'s */
<comentario>\n             ++   contLinhas;
<comentario>"*"+"/"        BEGIN(INITIAL); /* desabilita as regras do grupo <comentario> */ 
