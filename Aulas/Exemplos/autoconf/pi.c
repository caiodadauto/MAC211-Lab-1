#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
         double valor=0.0,denom=1.0,sinal=1.0;
         unsigned long t,prec;

	 printf("Aproximador de PI - versao %s\n",VERSION);

         prec = 10;
         if (argc > 1) 
		prec = atol(argv[1]);
         
         for(t = prec; t; t--) {
                 valor += sinal/denom;
                 sinal = -sinal;
                 denom += 2.0;
         }

         valor *= 4.0;
         printf("pi ~= %.8f , com %lu iteracoes\n", valor, prec);
         return 0;
}
