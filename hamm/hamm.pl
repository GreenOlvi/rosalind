#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw(sum);

my $s = [];

while (<>) {
   chomp;
   push @$s, $_;
}

print dist($s->[0], $s->[1]), "\n";

sub dist {
   my $sa = shift;
   my $sb = shift;

   my @aa = split //, $sa;
   my @ab = split //, $sb;

   return sum map { $aa[$_] eq $ab[$_] ? 0 : 1 } (0..(scalar @aa - 1));
}
