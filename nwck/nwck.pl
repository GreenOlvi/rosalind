#!/usr/bin/perl

use strict;
use warnings;

use Bio::TreeIO;
use Data::Dumper;

my $result = [];

while (my $t = <>) {
   chomp $t;
   next unless $t;
   my $n = <>;
   chomp $n;

   push(@$result, work($t, $n));
}

print join(' ', @$result), "\n";

sub work {
   my $t    = shift;
   my $pair = shift;

   my $tree = Bio::TreeIO->new(-format => 'newick', -string => $t)->next_tree;
   $_->branch_length(1) foreach ($tree->get_nodes);

   my @nodes = map { $tree->find_node(-id => $_) } split / /, $pair;

   return $tree->distance(-nodes => \@nodes);
}
