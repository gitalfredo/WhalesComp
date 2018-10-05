#!/usr/bin/perl

use strict;
use warnings;

my $nameOfSpecie = shift or die "Usage: ./whalesTyles.pl NameOfSpecie dataWhales.txt\n";   # Usage: ./whalesTyles.pl Orca dataWhales.txt. Shift on the first param
my $fileName = shift or die "Usage: ./whalesTyles.pl NameOfSpecie dataWhales.txt\n";   # Shift on the next parameter dataWhales.txt
my $whalesType;		# Whale type string output 
my %whalesDict;		# Whales dictionary for associate array whale pods and countSpecimens


open my $file, "<", $fileName or die "Could not open file dataWhales.txt\n";   # Attempts to read file dataWhales.txt 

while( my $line =<$file>){         
    chomp $line;                               # Remove ending newline
    if($line =~ /$nameOfSpecie/i){
    	
	    my $countSpecimens = 0;
	    my @words = split(/\s+/, $line);     # Split by spaces (greedy)
	    $countSpecimens = $words[1];
		
	    splice @words, 0, 2;				# Remove Date and Number (used previously)
	    $whalesType = join(" ",@words) ;   # Join the array to prepare the output string  
	    $whalesType =~ s/s$/ /g;	# Replace the plural ending 's' on some words to bring together say Orca, and Orcas into the same category
	   
	    $whalesDict{$whalesType}[0] += 1;	# Increases number of pods by one for this entry
	    $whalesDict{$whalesType}[1] += $countSpecimens;	# Number of whales per pod
    }
    
       
}
# Loop through hash dictionary
foreach my $i ( sort keys %whalesDict) {
    print "$i : $whalesDict{$i}[0] total pods with $whalesDict{$i}[1] whales.\n";
}

close $file;	# Close file