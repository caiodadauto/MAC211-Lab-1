AC_INIT(pi.c)

dnl procura e testa o compilador C
AC_PROG_CC

dnl define C como a linguagem dos códigos-fonte
AC_LANG(C)

dnl procura e testa a ferramenta make
AC_PROG_MAKE_SET

dnl verifica as bibliotecas padrao do C
AC_HEADER_STDC
dnl verifica se a funcao atol esta definida
AC_CHECK_FUNC(atol,,AC_MSG_ERROR(oops! funcao atol nao existe?!?))

dnl cria uma variavel de ambiente no makefile de saida
VERSION="0.0.1"
AC_SUBST(VERSION)

dnl indica que o arquivo Makefile deve ser gerado
AC_CONFIG_FILES([Makefile])

dnl le os arquivos de entrada .in e faz as substituicoes, 
dnl gerando os arquivos de saida
AC_OUTPUT
