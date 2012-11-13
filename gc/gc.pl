#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;

my $seqio = Bio::SeqIO->new(
   -file   => $ARGV[0],
   -format => 'Fasta'
);

my $max = { gc => 0, id => '' };
while (my $seq = $seqio->next_seq) {
   my $c = count($seq->seq);
   if ($max->{gc} < $c) {
      $max = {
         gc => $c,
         id => $seq->display_id,
      };
   }
}

printf("%s\n%0.6f%%\n", $max->{id}, $max->{gc});

sub count {
   my $in = shift;
   my $gc = ($in =~ s/[GC]/-/g);
   return ($gc / length($in)) * 100;
}

