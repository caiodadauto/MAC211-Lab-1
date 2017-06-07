/* Gera um programa que substitui cadeias delimitadas por aspas 
   pela palavra "string" */

/* Declaracao de uma condicao de inicio para regras exclusivas */
%x  STRING

%%
\"            { 
                 printf(" string ");
                 /* habilita todas as regras que começam com <STRING> */  
                 BEGIN(STRING);   
              }
<STRING>[^"]  ;  /* nenhuma acao p/ um carac. <> aspas */
<STRING>\"    { 
                 /* desabilita a condicao de inicio STRING */
                 BEGIN(INITIAL);  
              }
