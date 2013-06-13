#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

my $in = <>;
chomp $in;

my $A = [split /\s+/, $in];

my $n = <>;
chomp $n;

my $index = 0;
while (my $s = genString($index++)) {
   say $s;
}

exit 0;

sub genString {
   my $i = shift;
   my $l = scalar @$A;

   return if $i> ($l**$n) - 1;

   my $s = '';
   foreach (1..$n) {
      $s = $A->[$i % $l] . $s;
      $i /= $l;
   }

   return $s;
}
