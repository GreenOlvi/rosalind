#!/usr/bin/perl

use strict;
use warnings;

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

while (<>) {
   chomp;
   next unless $_;
   print join "\n", orf($_), '';
}

sub orf {
   my $in = shift;
   my $ret = {};

   foreach my $strand (rna($in), rna(revc($_))) {
      $ret->{$_} = 1 foreach (frames($strand));
   }

   return sort keys %$ret;
}

sub rna {
   my $in = shift;
   $in =~ s/T/U/gi;
   return $in;
}

sub revc {
   my $in = shift;
   $in =~ y/ACGT/TGCA/;
   return scalar reverse $in;
}

sub frames {
   my $string = shift;

   my @ret = ();
   while ($string =~ m/(?=(AUG(...)*?(UAA|UAG|UGA)))/g) {
      push @ret, trans($1);
   }

   return @ret;
}

sub trans {
   my $rna = shift;
   return join '', grep { $_ ne 'Stop' } map { $prot->{$_} } unpack("(A3)*", $rna);
}
