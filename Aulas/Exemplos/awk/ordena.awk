# Programa Awk que ordena as linhas de um arquivo texto considerando
# que o primeiro campo do arquivo armazena um valor numerico

    {
       if ($1 > max)
         max = $1
       vet[$1] = $0
     }
END {
       for (x = 1; x <= max; x++)
         if (x in vet)
           print vet[x]
     }

