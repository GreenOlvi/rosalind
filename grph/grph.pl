#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;

my $k = 3;

my $seqio = Bio::SeqIO->new(
   -file   => $ARGV[0],
   -format => 'Fasta'
);

my @seqs  = ();
my $index = {};

while (my $seq = $seqio->next_seq) {
   push @seqs, $seq;
   push @{$index->{substr($seq->seq, 0, $k)}}, $seq;
}

foreach my $seq (@seqs) {
   print map {
      $seq->primary_id . " " . $_->primary_id . "\n";
   } grep {
      $seq->primary_id ne $_->primary_id;
   } @{$index->{substr($seq->seq, -$k, $k)}};
}

1;
