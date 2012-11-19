#!/usr/bin/perl

use strict;
use warnings;

use Algorithm::Combinatorics qw(permutations);

while (<>) {
   chomp;
   next unless $_;

   my @signed_perms = map { sign_perm($_) } permutations([1..$_]);

   print join "\n", scalar @signed_perms, map { join ' ', @$_ } @signed_perms;
   print "\n";
}

sub sign_perm {
   my $p  = shift;
   my $sp = [];

   my $count = 2**(scalar @$p) - 1;

   foreach my $i (0..$count) {
      my @s = (@$p);
      @s = map { 2**$_ & $i ? -1 * $p->[$_] : $p->[$_] } (0..scalar @s - 1);
      push @$sp, \@s;
   }
   return @$sp;
}
