# Programa Awk que calcula a frequencia das palavras de um texto

     {
         for (i = 1; i <= NF; i++)
             freq[$i]++
     }

END  {
         for (palavra in freq)
             printf "%s\t%d\n", palavra, freq[palavra]
     }
