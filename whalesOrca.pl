#!/usr/bin/perl

use strict;
use warnings;

my $fileName = shift or die "Usage: ./whalesOrca.pl dataWhales.txt \n";   # Usage feedback
my $numberOrcas = 0;                                 		# Counter for how many orcas there are


open my $file, "<", $fileName or die "Could not open file dataWhales.txt\n"; # Attempts to read file dataWhales.txt
while( my $line =<$file>){           
	chomp $line;                               # Remove newline ending
	if($line =~ /Orca/i){                  # Check if there is a match of the word 'orca' disregarding capitalization
       my @words = split(/\s+/, $line);     # Split line into words by spaces repeated
       $numberOrcas += $words[1];            # Second index in array is pod of whales 
       
	}
		   
}
print "$numberOrcas Orcas reported in $fileName\n";
close $file;	# Close file handler