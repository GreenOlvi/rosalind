#!/usr/bin/env perl

use strict;
use warnings;
use v5.10;
use bignum;

while (my $in = <>) {
   print subsets($in);
}

sub subsets {
   my $a = shift;
   return (2**$a) % 1000000;
}

