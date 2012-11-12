#!/usr/bin/perl

use strict;
use warnings;

use Algorithm::Combinatorics qw(permutations);

while (<>) {
   chomp;
   next unless $_;

   my @perms = permutations([1..$_]);

   print join "\n", scalar @perms, map { join ' ', @$_ } @perms;
}
