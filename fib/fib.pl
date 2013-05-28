#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;

use Memoize;
memoize 'fib';

while (my $in = <>) {
   chomp $in;
   my ($n, $k) = split /\s+/, $in;
   say fib($n, $k);
}

sub fib {
   my ($n, $k) = @_;
   if ($n < 3) {
      return 1;
   } else {
      return fib($n - 1, $k) + ($k * fib($n - 2, $k));
   }
}
