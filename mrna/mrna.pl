#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(reduce);

my $prot = {
   UUU => 'F',    CUU => 'L', AUU => 'I', GUU => 'V',
   UUC => 'F',    CUC => 'L', AUC => 'I', GUC => 'V',
   UUA => 'L',    CUA => 'L', AUA => 'I', GUA => 'V',
   UUG => 'L',    CUG => 'L', AUG => 'M', GUG => 'V',
   UCU => 'S',    CCU => 'P', ACU => 'T', GCU => 'A',
   UCC => 'S',    CCC => 'P', ACC => 'T', GCC => 'A',
   UCA => 'S',    CCA => 'P', ACA => 'T', GCA => 'A',
   UCG => 'S',    CCG => 'P', ACG => 'T', GCG => 'A',
   UAU => 'Y',    CAU => 'H', AAU => 'N', GAU => 'D',
   UAC => 'Y',    CAC => 'H', AAC => 'N', GAC => 'D',
   UAA => 'Stop', CAA => 'Q', AAA => 'K', GAA => 'E',
   UAG => 'Stop', CAG => 'Q', AAG => 'K', GAG => 'E',
   UGU => 'C',    CGU => 'R', AGU => 'S', GGU => 'G',
   UGC => 'C',    CGC => 'R', AGC => 'S', GGC => 'G',
   UGA => 'Stop', CGA => 'R', AGA => 'R', GGA => 'G',
   UGG => 'W',    CGG => 'R', AGG => 'R', GGG => 'G',
};

my $rev_prot_count = {};
foreach my $c (keys %$prot) {
   $rev_prot_count->{$prot->{$c}}++;
}

while (<>) {
   chomp;
   next unless $_;
   print count_trans($_), "\n";
}

sub count_trans {
   my $p = shift;
   return reduce { our ($a,$b);  multiply_mod($a, $b, 1000000) } map { $rev_prot_count->{$_} } split(//, $p), 'Stop';
}

sub multiply_mod {
   my ($a, $b, $n) = @_;
   my $r = $a * $b;
   $r -= $n while ($r >= $n);
   return $r;
}

