# This is an awk program that summarizes a coin collection.

/gold/	{ 
	num_gold++; 
	wt_gold += $2 
}  # Get weight of gold.

/silver/  { 
	num_silver++; 
	wt_silver += $2 
}  # Get weight of silver.

END { 
 	val_gold = 485 * wt_gold;              # Compute value of gold.
 	val_silver = 16 * wt_silver;           # Compute value of silver.
	total = val_gold + val_silver;
	print "Summary data for coin collection:";  # Print results.
	printf ("\n");
	printf ("   Gold pieces:                   %2d\n", num_gold);
	printf ("   Weight of gold pieces:         %5.2f\n", wt_gold);
	printf ("   Value of gold pieces:        %7.2f\n",val_gold);
	printf ("\n");
	printf ("   Silver pieces:                 %2d\n", num_silver);
	printf ("   Weight of silver pieces:       %5.2f\n", wt_silver);
	printf ("   Value of silver pieces:      %7.2f\n",val_silver);
	printf ("\n");
	printf ("   Total number of pieces:        %2d\n", NR);
	printf ("   Value of collection:         %7.2f\n", total); 
}
