    {
        for(i = 1; i <= NF; i++) {
            freq[$i]++
        }
    }
END {
        for(campo in freq) {
            f = freq[campo]
            if(f > max)
                max = f
            ord[f] = campo
        }

        for(i = 1; i < max; i++)
            if(i in ord)
                print ord[i] "\t -> \t" i 
    }
