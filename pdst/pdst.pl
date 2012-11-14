#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;
use List::Util qw(sum);

my $seqio = Bio::SeqIO->new(
   -file   => $ARGV[0],
   -format => 'Fasta'
);

my $seqs = [];
while (my $seq = $seqio->next_seq) {
   push @$seqs, $seq;
}

foreach my $j (@$seqs) {
   print join(' ', map { sprintf("%0.2f", p($j->seq, $_->seq)) } @$seqs), "\n";
}

sub p {
   my $sa = [split(//, shift)];
   my $sb = [split(//, shift)];

   my $diff = sum map { $sa->[$_] eq $sb->[$_] ? 0 : 1 } (0..(scalar @$sa - 1));

   return $diff/(scalar @$sa);
}
