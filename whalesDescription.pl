#!/usr/bin/perl

use strict;
use warnings;

my $input = shift or die "Usage: ./whalesDescription.pl dataWhales.txt\n";   # Usage 
my $whalesType = "";			# Whale type string output 
my %whalesDict;


open my $file, "<", $input or die "Could not open file dataWhales.txt\n";  # Attempts to read file dataWhales.txt 

while(<$file>){           
    chomp;                      # Remove ending newline

    my $countSpecimens = 0;
    my @words = split(/\s+/, $_);     # Split text line into spaces repeated

    $countSpecimens = $words[1];	# Gets how many specimens there are
    splice @words, 0, 2;
    $whalesType =~ s/\s+/ /g;	# Remove multiple empty spaces and substitute it by a single empty space
    $whalesType = join(" ",@words) ;     
    $whalesType =~ s/s$/ /g;	# Replace the plural ending 's' on some words to bring together say Orca, and Orcas into the same category
   
    $whalesDict{$whalesType}[0] += 1;
    $whalesDict{$whalesType}[1] += $countSpecimens;

   
       
}
# Loop through hash dictionary
foreach my $i ( sort keys %whalesDict) {
	my $lowercase = lc($i);	# Key to lowercase
    print "$lowercase : $whalesDict{$i}[0] total pods, with $whalesDict{$i}[1] whales.\n";
}


close $file;